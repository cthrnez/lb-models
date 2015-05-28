

#include <stdio.h>
#include <sys/types.h>
#include <arpa/nameser.h>
#include <arpa/nameser_compat.h>
#include <stdlib.h>
#include <string.h>
#include <netinet/in.h>
#include <resolv.h>
#include <assert.h>



#define DNS_LABELTYPE_BITSTRING		0x41
#define NS_TYPE_ELT			0x40
#define NS_CMPRSFLGS	0xc0	/*%< Flag bits indicating name compression. */


enum req_action { Finish, Refuse, Return };

int something;

/* Modified version of req_action */

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

int
ns_name_skip(const u_char **ptrptr, const u_char *eom)
{
	const u_char *cp;
	u_int n;
	int l;

	cp = *ptrptr;
	while (cp < eom && (n = *cp++) != 0) {
		/* Check for indirection. */
		switch (n & NS_CMPRSFLGS) {
		case 0:			/*%< normal case, n == len */
			cp += n;
			continue;
		case NS_TYPE_ELT: /*%< EDNS0 extended label */
			if ((l = labellen(cp - 1)) < 0) {
				//__set_errno (EMSGSIZE);
				return(-1);
			}
			cp += l;
			continue;
		case NS_CMPRSFLGS:	/*%< indirection */
			cp++;
			break;
		default:		/*%< illegal type */
			//__set_errno (EMSGSIZE);
			return (-1);
		}
		break;
	}
	if (cp > eom) {
		//__set_errno (EMSGSIZE);
		return (-1);
	}
	*ptrptr = cp;
	return (0);
}

int
dn_skipname(const u_char *ptr, const u_char *eom) {
	const u_char *saveptr = ptr;

	if (ns_name_skip(&ptr, eom) == -1)
		return (-1);
	return (ptr - saveptr);
}

static enum req_action
req_iquery(HEADER *hp, u_char **cpp, u_char *eom, int *buflenp, u_char *msg)
{
	int dlen, alen, n, type, class, count;
	char anbuf[2], *data, *fname;

	/*
	 * Skip domain name, get class, and type.
	 */
	if ((n = dn_skipname(*cpp, eom)) < 0) {
	  printf("FORMERR IQuery packet name problem\n");
	  hp->rcode = FORMERR;
	  return (Finish);
	}
	*cpp += n;
	GETSHORT(type, *cpp);
	GETSHORT(class, *cpp);
	*cpp += INT32SZ;	/* ttl */
	GETSHORT(dlen, *cpp);
	*cpp += dlen;
	if (*cpp != eom) {
	  printf("FORMERR IQuery message length off\n");
	  hp->rcode = FORMERR;
	  return (Finish);
	}

	/*
	 * not all inverse queries are handled.
	 * this is a meaningless switch statement to preserve original program's structure 
	 */

        printf("home free");
	switch (type) {
	case T_A:
	  if (something == 0) 
	    return (Refuse);
	  break;
	default:
	  return (Refuse);
	}
	printf("req: IQuery class %d type %d\n", class, type);

	fname = (char *)msg + HFIXEDSZ;
	alen = (char *)*cpp - fname;
	
	printf("Copying %d bytes from fname to anbuf which can store %d bytes\n", alen, sizeof(anbuf)); 
	/*BAD*/
	memcpy(anbuf, fname, alen);
	data = anbuf + alen - dlen;
	*cpp = (u_char *)fname;
	*buflenp -= HFIXEDSZ;
	count = 0;


	/* ..... do some other stuff */

	return (Finish);
}

/* read in a resource record from a file */
int create_msg(u_char *msg, int len, char *filename){

  FILE *f;
  int i = 0;
  int c;
/*
  if ((f = fopen("iquery-file", "r")) == NULL)
    {
      printf("iquery-file not found!\n");
      return -1;
    }
  
  while (((c = fgetc(f)) != EOF) && (i < len)) {
    *msg++ = (u_char) c;
    i++;  
  }

  fclose(f);
  */
  // Hardcode all of this, since iquery-file is right there...
  i = 39;
  return i;

}


int main(int argc, char **argv){
  
  HEADER *hp;
  u_char *cp, *eom;
  int msglen;
  FILE *f;

// Make filename symbolic when calling
  //assert(argc==2);
  //f = fopen (argv[1], "r");
  //assert(f!=NULL);
  //assert ((fscanf(f, "%d", &something)) != 0);
  something = 9283721;
  // We know f won't equal 0, so can just set f = something here

  

  //msg = (u_char *) malloc(10000*sizeof(u_char));
  u_char msg[39];
  // klee_make_symbolic(msg, 39, "msg");
  msglen = create_msg(msg, 10000, argv[1]);
  msglen = 39;
  hp = (HEADER *) msg;

  /*
  printf("Enter value for something:");
  scanf("%d", &something);
  */

  cp = msg + sizeof(HEADER);
  eom = msg + msglen;
  printf("Got here");
  //printf("opcode = %d\n",hp->opcode);
  
  switch(hp->opcode){
  case ns_o_iquery:           /* ns_o_iquery = */
    printf("Doing stuff"); 
    req_iquery(hp, &cp, eom, &msglen, msg);
    break;
  default:
    printf("We only support inverse queries!\n");
  }

  return 0;

}


/*

</source>

*/

