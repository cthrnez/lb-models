
/* This is rrextract taken from BIND 8.2 */

#include <stdio.h>
#include <sys/types.h>
#include <sys/param.h>
#include <sys/socket.h>
#include <sys/file.h>
#include <sys/un.h>

#include <netinet/in.h>
#include <arpa/nameser.h>
#include <arpa/inet.h>

#include <errno.h>
#include <limits.h>
#include <resolv.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <syslog.h>
#include <time.h>
#include <assert.h>
#include "ns_defs.h"
#include <hurd/bits/errno.h>


#define NS_SIG_SIGNER 18 /* Domain name of who signed it */

#define BOUNDS_CHECK(ptr, count) \
	do { \
		if ((ptr) + (count) > eom) { \
			hp->rcode = FORMERR; \
			return (-1); \
		} \
	} while (0)

const char *transport_strings[] = { "primary", "secondary", "response", NULL };

#define PERIOD 0x2e
#define	hyphenchar(c) ((c) == 0x2d)
#define bslashchar(c) ((c) == 0x5c)
#define periodchar(c) ((c) == PERIOD)
#define asterchar(c) ((c) == 0x2a)
#define alphachar(c) (((c) >= 0x41 && (c) <= 0x5a) \
		   || ((c) >= 0x61 && (c) <= 0x7a))
#define digitchar(c) ((c) >= 0x30 && (c) <= 0x39)

#define borderchar(c) (alphachar(c) || digitchar(c))
#define middlechar(c) (borderchar(c) || hyphenchar(c))
#define domainchar(c) ((c) > 0x20 && (c) < 0x7f)

//#include <resolv.h>

//#include <sysdeps/mach/hurd/bits/errno.h>
#define _HURD_ERRNO(n)	((0x10 << 26) | ((n) & 0x3fff))
#define	EMSGSIZE        _HURD_ERRNO (40)/* Message too long */

// #include <arpa/nameser.h>
#define NS_MAXCDNAME	255	/*%< maximum compressed domain name */
#define NS_CMPRSFLGS	0xc0	/*%< Flag bits indicating name compression. */

# define SPRINTF(x) ((size_t)sprintf x)

#define NS_TYPE_ELT			0x40 /*%< EDNS0 extended label type */
#define DNS_LABELTYPE_BITSTRING		0x41

static const char	digits[] = "0123456789";
static const char digitvalue[256] = {
	-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, /*16*/
	-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, /*32*/
	-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, /*48*/
         0,  1,  2,  3,  4,  5,  6,  7,  8,  9, -1, -1, -1, -1, -1, -1, /*64*/
	-1, 10, 11, 12, 13, 14, 15, -1, -1, -1, -1, -1, -1, -1, -1, -1, /*80*/
	-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, /*96*/
	-1, 10, 11, 12, 13, 14, 15, -1, -1, -1, -1, -1, -1, -1, -1, -1, /*112*/
	-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, /*128*/
	-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
	-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
	-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
	-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
	-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
	-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
	-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
	-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, /*256*/
};

static int
labellen(const u_char *lp)
{
	int bitlen;
	u_char l = *lp;

	if ((l & NS_CMPRSFLGS) == NS_CMPRSFLGS) {
		/* should be avoided by the caller */
		return(-1);
	}

	if ((l & NS_CMPRSFLGS) == NS_TYPE_ELT) {
		if (l == DNS_LABELTYPE_BITSTRING) {
			if ((bitlen = *(lp + 1)) == 0)
				bitlen = 256;
			return((bitlen + 7 ) / 8 + 1);
		}
		return(-1);	/*%< unknwon ELT */
	}
	return(l);
}

static int
decode_bitstring(const unsigned char **cpp, char *dn, const char *eom)
{
	const unsigned char *cp = *cpp;
	char *beg = dn, tc;
	int b, blen, plen, i;

	if ((blen = (*cp & 0xff)) == 0)
		blen = 256;
	plen = (blen + 3) / 4;
	plen += sizeof("\\[x/]") + (blen > 99 ? 3 : (blen > 9) ? 2 : 1);
	if (dn + plen >= eom)
		return(-1);

	cp++;
	i = SPRINTF((dn, "\\[x"));
	if (i < 0)
		return (-1);
	dn += i;
	for (b = blen; b > 7; b -= 8, cp++) {
		i = SPRINTF((dn, "%02x", *cp & 0xff));
		if (i < 0)
			return (-1);
		dn += i;
	}
	if (b > 4) {
		tc = *cp++;
		i = SPRINTF((dn, "%02x", tc & (0xff << (8 - b))));
		if (i < 0)
			return (-1);
		dn += i;
	} else if (b > 0) {
		tc = *cp++;
		i = SPRINTF((dn, "%1x",
			       ((tc >> 4) & 0x0f) & (0x0f << (4 - b))));
		if (i < 0)
			return (-1);
		dn += i;
	}
	i = SPRINTF((dn, "/%d]", blen));
	if (i < 0)
		return (-1);
	dn += i;

	*cpp = cp;
	return(dn - beg);
}

int
ns_name_unpack(const u_char *msg, const u_char *eom, const u_char *src,
	       u_char *dst, size_t dstsiz)
{
	const u_char *srcp, *dstlim;
	u_char *dstp;
	int n, len, checked, l;

	len = -1;
	checked = 0;
	dstp = dst;
	srcp = src;
	dstlim = dst + dstsiz;
	if (srcp < msg || srcp >= eom) {
		//__set_errno (EMSGSIZE);
		return (-1);
	}
	/* Fetch next label in domain name. */
	while ((n = *srcp++) != 0) {
		/* Check for indirection. */
		switch (n & NS_CMPRSFLGS) {
		case 0:
		case NS_TYPE_ELT:
			/* Limit checks. */
			if ((l = labellen(srcp - 1)) < 0) {
				//__set_errno (EMSGSIZE);
				return(-1);
			}
			if (dstp + l + 1 >= dstlim || srcp + l >= eom) {
				//__set_errno (EMSGSIZE);
				return (-1);
			}
			checked += l + 1;
			*dstp++ = n;
			memcpy(dstp, srcp, l);
			dstp += l;
			srcp += l;
			break;

		case NS_CMPRSFLGS:
			if (srcp >= eom) {
				//__set_errno (EMSGSIZE);
				return (-1);
			}
			if (len < 0)
				len = srcp - src + 1;
			srcp = msg + (((n & 0x3f) << 8) | (*srcp & 0xff));
			if (srcp < msg || srcp >= eom) {  /*%< Out of range. */
				//__set_errno (EMSGSIZE);
				return (-1);
			}
			checked += 2;
			/*
			 * Check for loops in the compressed name;
			 * if we've looked at the whole message,
			 * there must be a loop.
			 */
			if (checked >= eom - msg) {
				//__set_errno (EMSGSIZE);
				return (-1);
			}
			break;

		default:
			//__set_errno (EMSGSIZE);
			return (-1);			/*%< flag error */
		}
	}
	*dstp = '\0';
	if (len < 0)
		len = srcp - src;
	return (len);
}


int
ns_name_ntop(const u_char *src, char *dst, size_t dstsiz)
{
	const u_char *cp;
	char *dn, *eom;
	u_char c;
	u_int n;
	int l;

	cp = src;
	dn = dst;
	eom = dst + dstsiz;

	while ((n = *cp++) != 0) {
		if ((n & NS_CMPRSFLGS) == NS_CMPRSFLGS) {
			/* Some kind of compression pointer. */
			//__set_errno (EMSGSIZE);
			return (-1);
		}
		if (dn != dst) {
			if (dn >= eom) {
				//__set_errno (EMSGSIZE);
				return (-1);
			}
			*dn++ = '.';
		}
		if ((l = labellen(cp - 1)) < 0) {
			//__set_errno (EMSGSIZE);
			return(-1);
		}
		if (dn + l >= eom) {
			//__set_errno (EMSGSIZE);
			return (-1);
		}
		if ((n & NS_CMPRSFLGS) == NS_TYPE_ELT) {
			int m;

			if (n != DNS_LABELTYPE_BITSTRING) {
				/* XXX: labellen should reject this case */
				//__set_errno (EINVAL);
				return(-1);
			}
			if ((m = decode_bitstring(&cp, dn, eom)) < 0)
			{
				//__set_errno (EMSGSIZE);
				return(-1);
			}
			dn += m;
			continue;
		}
		for ((void)NULL; l > 0; l--) {
			c = *cp++;
			if (special(c)) {
				if (dn + 1 >= eom) {
					//__set_errno (EMSGSIZE);
					return (-1);
				}
				*dn++ = '\\';
				*dn++ = (char)c;
			} else if (!printable(c)) {
				if (dn + 3 >= eom) {
					//__set_errno (EMSGSIZE);
					return (-1);
				}
				*dn++ = '\\';
				*dn++ = digits[c / 100];
				*dn++ = digits[(c % 100) / 10];
				*dn++ = digits[c % 10];
			} else {
				if (dn >= eom) {
					//__set_errno (EMSGSIZE);
					return (-1);
				}
				*dn++ = (char)c;
			}
		}
	}
	if (dn == dst) {
		if (dn >= eom) {
			//__set_errno (EMSGSIZE);
			return (-1);
		}
		*dn++ = '.';
	}
	if (dn >= eom) {
		//__set_errno (EMSGSIZE);
		return (-1);
	}
	*dn++ = '\0';
	return (dn - dst);
}

int
ns_name_uncompress(const u_char *msg, const u_char *eom, const u_char *src,
		   char *dst, size_t dstsiz)
{
	u_char tmp[NS_MAXCDNAME];
	int n;

	if ((n = ns_name_unpack(msg, eom, src, tmp, sizeof tmp)) == -1)
		return (-1);
	if (ns_name_ntop(tmp, dst, dstsiz) == -1)
		return (-1);
	return (n);
}

int
dn_expand(const u_char *msg, const u_char *eom, const u_char *src,
	  char *dst, int dstsiz)
{
	int n = ns_name_uncompress(msg, eom, src, dst, (size_t)dstsiz);

	if (n > 0 && dst[0] == '.')
		dst[0] = '\0';
	return (n);
}


u_int
res_randomid(void) {
	return 0xffff & __getpid();
}
/*
int
res_init(void) {
	extern int __res_vinit(res_state, int);
*/
	/*
	 * These three fields used to be statically initialized.  This made
	 * it hard to use this code in a shared library.  It is necessary,
	 * now that we're doing dynamic initialization here, that we preserve
	 * the old semantics: if an application modifies one of these three
	 * fields of _res before res_init() is called, res_init() will not
	 * alter them.  Of course, if an application is setting them to
	 * _zero_ before calling res_init(), hoping to override what used
	 * to be the static default, we can't detect it and unexpected results
	 * will follow.  Zero for any of these fields would make no sense,
	 * so one can safely assume that the applications were already getting
	 * unexpected results.
	 *
	 * _res.options is tricky since some apps were known to diddle the bits
	 * before res_init() was first called. We can't replicate that semantic
	 * with dynamic initialization (they may have turned bits off that are
	 * set in RES_DEFAULT).  Our solution is to declare such applications
	 * "broken".  They could fool us by setting RES_INIT but none do (yet).
	 */
	 /*
	if (!_res.retrans)
		_res.retrans = RES_TIMEOUT;
	if (!_res.retry)
		_res.retry = 4;
	if (!(_res.options & RES_INIT))
		_res.options = RES_DEFAULT;
	else if (_res.nscount > 0)
		__res_iclose (&_res, true);	/* Close any VC sockets.  */

	/*
	 * This one used to initialize implicitly to zero, so unless the app
	 * has set it to something in particular, we can randomize it now.
	 */
	 /*
	if (!_res.id)
		_res.id = res_randomid();

	atomicinclock (lock);*/
	/* Request all threads to re-initialize their resolver states,
	   resolv.conf might have changed.  */
	/*
	atomicinc (__res_initstamp);
	atomicincunlock (lock);

	return (__res_vinit(&_res, 1));
}*/

/*
 * This function is quite liberal, since RFC 1034's character sets are only
 * recommendations.
 */
int
res_dnok(const char *dn) {
	int ch;

	while ((ch = *dn++) != '\0')
		if (!domainchar(ch))
			return (0);
	return (1);
}

int
res_hnok(const char *dn) {
	int ppch = '\0', pch = PERIOD, ch = *dn++;

	while (ch != '\0') {
		int nch = *dn++;

		if (periodchar(ch)) {
			(void)NULL;
		} else if (periodchar(pch)) {
			if (!borderchar(ch))
				return (0);
		} else if (periodchar(nch) || nch == '\0') {
			if (!borderchar(ch))
				return (0);
		} else {
			if (!middlechar(ch))
				return (0);
		}
		ppch = pch, pch = ch, ch = nch;
	}
	return (1);
}


enum context
ns_ownercontext(type, transport)
	int type;
	enum transport transport;
{
	enum context context = domain_ctx;

	switch (type) {
	case T_A:
	case T_WKS:
	case T_MX:
		switch (transport) {
		case update_trans:
		case primary_trans:
		case secondary_trans:
			context = owner_ctx;
			break;
		case response_trans:
			context = hostname_ctx;
			break;
		default:
			printf("impossible condition in ns_ownercontext()"); 
			      
		}
		break;
	case T_MB:
	case T_MG:
		context = mailname_ctx;
		break;
	default:
		/* Nothing to do. */
		break;
	}
	return (context);
}




/*MZ: modified newstr function */

/*
 * Return a counted string buffer big enough for a string of length 'len'.
 */
char *
newstr(size_t len, int needpanic) {
	u_char *buf, *bp;

	assert(len <= 65536);

	buf = (u_char *)malloc(2 + len + 1);
	if (buf == NULL) {
		if (needpanic)
			printf("savestr: malloc failed (%s)", strerror(errno));
		else
			return (NULL);
	}
	bp = buf;
	NS_PUT16(len, bp);
	return ((char *)bp);
}


/*MZ: Modified ns_nameok.. we only deal with some context cases */

int
ns_nameok(const char *name, int class, struct zoneinfo *zp,
	  enum transport transport,
	  enum context context,
	  const char *owner)
{

	enum severity severity = not_set;
	int ok = 1;

	if (zp != NULL)
		severity = zp->z_checknames;

	/*
	if (severity == not_set)
	  {
	    printf("severity must be set!\n");
	    return (0);
	  }     
	*/

	if (severity == ignore)
		return (1);
	switch (context) {
	case domain_ctx:
		ok = (class != C_IN) || res_dnok(name);
		break;
	case hostname_ctx:
		ok = res_hnok(name);
		break;
	default:
	  {
	    printf("unexpected context %d in ns_nameok", (int)context);
	    return 0;
	  }
	  
	  return (ok);
	}

	return (ok);
  }	
/* rrp points to the resource record */

static int
rrextract(u_char *msg, int msglen, u_char *rrp, u_char *dname, int namelen)
{
	u_char *eom, *cp, *cp1, *rdatap;
	u_int class, type, dlen;
	int n,len=0;
	u_int32_t ttl;
	u_char data[MAXDATA*2];   /* sizeof data = 2 (2 * 1025 + 5*4) = 4140 */
	HEADER *hp = (HEADER *)msg;
		
	cp = rrp;
	eom = msg + msglen;

	printf("Trying to do dn_expand..\n");
	printf("msg = %s, msglen = %d, rrp = %s, namelen = %d\n", (char *) msg, msglen, (char *)rrp, namelen);

	if ((n = dn_expand(msg, eom, cp, (char *) dname, namelen)) < 0) {
	  printf("dn_expand returned %d\n", n);
	  hp->rcode = FORMERR;
	  return (-1);
	}
	
	printf("First dn_expand returned n = %d\n", n);

	cp += n;
	len += n;
	len += sizeof(HEADER);

	BOUNDS_CHECK(cp, 2*INT16SZ + INT32SZ + INT16SZ);
	GETSHORT(type, cp);
	cp += 2;
	len += 2;
	printf("type = %d\n", type);
	GETSHORT(class, cp);
	cp += 2;
	len += 2;
	
	if (class > CLASS_MAX) {
	  printf("bad class in rrextract");
	  hp->rcode = FORMERR;
	  return (-1);
	}
	GETLONG(ttl, cp);
	printf("ttl = %d\n",ttl); 
	cp += 4;
	len += 4;

	if (ttl > MAXIMUM_TTL) {
	  printf("%s: converted TTL > %u to 0",
		 dname, MAXIMUM_TTL);		

		ttl = 0;
	}
	GETSHORT(dlen, cp);
	cp += 2; 
	len += 2;

	printf("msglen - len - 12 = %d, dlen = %d\n", msglen - len - 12, dlen);
	BOUNDS_CHECK(cp, dlen);
	printf("bounds check succeeded\n");
	rdatap = cp;

	if (!ns_nameok((char *)dname, class, NULL, response_trans,
		       ns_ownercontext(type, response_trans),
		      (char *)dname)) {
		hp->rcode = REFUSED;
		return (-1);
	}
	printf("rrextract: dname %s type %d class %d ttl %d\n",
		 dname, type, class, ttl);
	/*
	 * Convert the resource record data into the internal
	 * database format.
	 *
	 * On entry to the switch:
	 *   CP points to the RDATA section of the wire-format RR.
	 *   DLEN is its length.
	 *   The memory area at DATA is available for processing.
	 * 
	 * On exit from the switch:
	 *   CP has been incremented past the RR.
	 *   CP1 points to the RDATA section of the database-format RR.
	 *   N contains the length of the RDATA section of the dbase-format RR.
	 *
	 * The new data at CP1 for length N will be copied into the database,
	 * so it need not be in any particular storage location.
	 */
	switch (type) {
	case T_A:
	  if (dlen != INT32SZ) {
		  hp->rcode = FORMERR;
		  return (-1);
	  }
	  /*FALLTHROUGH*/
	  break;
		
		
	case T_NAPTR:
	  printf("NOT HANDLING T_NAPTR RECORDS\n");
	  break;

	  /* Many cases were cut out from this program for simplicity's
	     sake 
	  */
	  
	case T_MX:
	case T_AFSDB:
	case T_RT:
	case T_SRV:
	  printf("NOT HANDLING T_SRV RECORDS\n");
	  break;
	  
	case T_PX:
	  printf("NOT HANDLING T_PX RECORDS\n");
	  break;
	  
	
	case T_NXT:
	  /* Copy record into data buf */
	  n = dn_expand(msg, eom, cp, (char *)data, sizeof data);
	  
	  printf("n = %d\n", n);
 
	  if (n < 0) {
	    printf("n < 0\n");
	    hp->rcode = FORMERR;
	    return (-1);
	  }

	  if (!ns_nameok((char *)data, class, NULL, response_trans, domain_ctx, (char *)dname)) {
	    printf("Name not ok!\n");
	    hp->rcode = FORMERR;
	    return (-1);
	  }
	  cp += n;
	  cp1 = data + strlen((char *)data) + 1;

	  printf("Trying to copy dlen-n = %u bytes from cp to cp1!\n", dlen - n);
	  /*BAD*/
	  memcpy(cp1, cp, dlen - n);  /* we haven't checked to see if dlen - n
					 bytes can even fit into data buf 
				      */
	  
	  cp += (dlen - n);
	  cp1 += (dlen - n);
	  
	  /* compute size of data */
	  n = cp1 - (u_char *)data;
	  cp1 = (u_char *)data;
	 
	  break; 


	default:
	  printf("unknown type %d", type);
	  return ((cp - rrp) + dlen);
	}

	if (cp > eom) {
		hp->rcode = FORMERR;
		return (-1);
	}
	if ((u_int)(cp - rdatap) != dlen) {
	  
	  printf("encoded rdata length is %u, but actual length was %u",
		 dlen, (u_int)(cp - rdatap));
	  hp->rcode = FORMERR;
	  
	  return (-1);
	}
	if (n > MAXDATA) {
	  printf("update type %d: %d bytes is too much data",
		 type, n);
	  
	  hp->rcode = FORMERR;
	  return (-1);
	}

	
	/* We don't need to save it for our test program */
	/* *dpp = savedata(class, type, ttl, cp1, n); */
	return (cp - rrp);
}


int create_msg(u_char *buf) {

  u_char *p;
  char *temp, *temp1; 
  u_char *comp_dn, *comp_dn2;
  char exp_dn[200], exp_dn2[200];
  u_char **dnptrs, **lastdnptr, **dnptrs2;
  int i,len = 0, comp_size;
  u_long now;

  dnptrs = (unsigned char **) malloc(2 * sizeof(unsigned char *));
  dnptrs2 = (unsigned char **) malloc(2 * sizeof(unsigned char *));

  comp_dn = (unsigned char *) malloc(200*sizeof(unsigned char));
  comp_dn2 = (unsigned char *) malloc(200*sizeof(unsigned char));

  temp1 = (char *) malloc(400*sizeof(char));
    
  temp = temp1;
  
  p = buf;

  strcpy(temp, "HEADER JUNK:");
  
  len += strlen(temp);

  while (*temp != '\0') 
    *p++ = *temp++;
  
  strcpy(exp_dn, "lcs.mit.edu");         
  
  *dnptrs++ = (u_char *) exp_dn;
  *dnptrs-- = NULL;

  lastdnptr = NULL;

  printf("Calling dn_comp..\n");
  comp_size = dn_comp((const char *) exp_dn, comp_dn, 200, dnptrs, lastdnptr);
  printf("uncomp_size = %d\n", strlen(exp_dn));
  printf("comp_size = %d\n", comp_size);
  printf("exp_dn = %s, comp_dn = %s\n", exp_dn, (char *) comp_dn);
  
  for(i=0; i<comp_size; i++) 
    *p++ = *comp_dn++;

  len += comp_size;

  PUTSHORT(30, p); /* type = T_NXT = 30 */
  p += 2;    
  
  PUTSHORT(255, p);   /* class = C_ANY = 255*/
  p += 2;

  PUTLONG(255, p);  /* ttl */
  p += 4;

  PUTSHORT(16, p); /* dlen = len of everything starting with the covered byte 
		      (the length of the entire resource record... we lie about it
		   */
  p += 2;

  len += 10;

  strcpy(exp_dn2, "sls.lcs.mit.edu");    /* domain name */

  *dnptrs2++ = (u_char *) exp_dn2;
  *dnptrs2-- = NULL;
  lastdnptr = NULL;
  
  printf("Calling dn_comp..\n");
  comp_size = dn_comp((const char *) exp_dn2, comp_dn2, 200, dnptrs2, lastdnptr);
  printf("uncomp_size = %d\n", strlen(exp_dn2));
  printf("comp_size = %d\n", comp_size);
  printf("exp_dn2 = %s, comp_dn2 = %s\n", exp_dn2, (char *) comp_dn2);

  len += comp_size;
   
  for(i=0; i<comp_size; i++) 
    *p++ = *comp_dn2++;

  PUTLONG(1 << 24, p);             /* bitmap - set NXT type*/
  p += 4;
  PUTLONG(0, p);
  p += 4;
  PUTLONG(0, p);
  p += 4;
  PUTLONG(0, p);
  p += 4;

  len += 16;
   
  return (len);
}




int main(int argc, char **argv){
  
  int msglen, ret;
  u_char *dp;
  u_char *name = (u_char *) malloc(100*sizeof(u_char));
  //msg = (u_char *) malloc(1000 * sizeof(u_char));
  u_char msg[68];
  printf("Size of msg %d\n", sizeof(msg));
  klee_make_symbolic(msg, 68, "msg");
  printf("Calling create_msg:\n");
  //msglen = create_msg(msg);
  msglen = 68;

  printf("msglen = %d\n", msglen);

  dp = msg + sizeof(HEADER); /* point dp past the header (i.e to the hostname)*/ 
  
  printf("Calling rrextract!\n");

  //res_init();  
  ret = rrextract(msg, msglen, dp, name, 100);

  
  printf("rrextract returned %d\n", ret); 
  
  return 0;
  
}

/*

</source>

*/

