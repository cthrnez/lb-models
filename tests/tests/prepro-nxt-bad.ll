; ModuleID = 'prepro-nxt-bad.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.zoneinfo = type { i8*, i64, i64, i32, i32, i32, i32, i32, i8*, i64, %struct.in_addr, %struct.in_addr, [16 x %struct.in_addr], i8, i8, i32, i32, i32, i32, i32, i32, i32, %struct.in_addr*, i32, i8*, i8*, i32, i32, i32 }
%struct.in_addr = type { i32 }

@.str = private unnamed_addr constant [8 x i8] c"primary\00", align 1
@.str1 = private unnamed_addr constant [10 x i8] c"secondary\00", align 1
@.str2 = private unnamed_addr constant [9 x i8] c"response\00", align 1
@transport_strings = global [4 x i8*] [i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([10 x i8]* @.str1, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8]* @.str2, i32 0, i32 0), i8* null], align 16
@.str3 = private unnamed_addr constant [42 x i8] c"impossible condition in ns_ownercontext()\00", align 1
@.str4 = private unnamed_addr constant [13 x i8] c"len <= 65536\00", align 1
@.str5 = private unnamed_addr constant [10 x i8] c"nxt-bad.c\00", align 1
@__PRETTY_FUNCTION__.newstr = private unnamed_addr constant [26 x i8] c"char *newstr(size_t, int)\00", align 1
@.str6 = private unnamed_addr constant [28 x i8] c"savestr: malloc failed (%s)\00", align 1
@.str7 = private unnamed_addr constant [35 x i8] c"unexpected context %d in ns_nameok\00", align 1
@.str8 = private unnamed_addr constant [13 x i8] c"HEADER JUNK:\00", align 1
@.str9 = private unnamed_addr constant [12 x i8] c"lcs.mit.edu\00", align 1
@.str11 = private unnamed_addr constant [18 x i8] c"uncomp_size = %d\0A\00", align 1
@.str12 = private unnamed_addr constant [16 x i8] c"comp_size = %d\0A\00", align 1
@.str13 = private unnamed_addr constant [27 x i8] c"exp_dn = %s, comp_dn = %s\0A\00", align 1
@.str14 = private unnamed_addr constant [16 x i8] c"sls.lcs.mit.edu\00", align 1
@.str15 = private unnamed_addr constant [29 x i8] c"exp_dn2 = %s, comp_dn2 = %s\0A\00", align 1
@.str17 = private unnamed_addr constant [13 x i8] c"msglen = %d\0A\00", align 1
@.str19 = private unnamed_addr constant [23 x i8] c"rrextract returned %d\0A\00", align 1
@.str21 = private unnamed_addr constant [47 x i8] c"msg = %s, msglen = %d, rrp = %s, namelen = %d\0A\00", align 1
@.str22 = private unnamed_addr constant [23 x i8] c"dn_expand returned %d\0A\00", align 1
@.str23 = private unnamed_addr constant [33 x i8] c"First dn_expand returned n = %d\0A\00", align 1
@.str24 = private unnamed_addr constant [11 x i8] c"type = %d\0A\00", align 1
@.str25 = private unnamed_addr constant [23 x i8] c"bad class in rrextract\00", align 1
@.str26 = private unnamed_addr constant [10 x i8] c"ttl = %d\0A\00", align 1
@.str27 = private unnamed_addr constant [28 x i8] c"%s: converted TTL > %u to 0\00", align 1
@.str28 = private unnamed_addr constant [35 x i8] c"msglen - len - 12 = %d, dlen = %d\0A\00", align 1
@.str30 = private unnamed_addr constant [45 x i8] c"rrextract: dname %s type %d class %d ttl %d\0A\00", align 1
@.str34 = private unnamed_addr constant [8 x i8] c"n = %d\0A\00", align 1
@.str37 = private unnamed_addr constant [50 x i8] c"Trying to copy dlen-n = %u bytes from cp to cp1!\0A\00", align 1
@.str38 = private unnamed_addr constant [16 x i8] c"unknown type %d\00", align 1
@.str39 = private unnamed_addr constant [53 x i8] c"encoded rdata length is %u, but actual length was %u\00", align 1
@.str40 = private unnamed_addr constant [42 x i8] c"update type %d: %d bytes is too much data\00", align 1
@str41 = private unnamed_addr constant [18 x i8] c"Calling dn_comp..\00"
@str42 = private unnamed_addr constant [20 x i8] c"Calling create_msg:\00"
@str43 = private unnamed_addr constant [19 x i8] c"Calling rrextract!\00"
@str44 = private unnamed_addr constant [25 x i8] c"Trying to do dn_expand..\00"
@str45 = private unnamed_addr constant [23 x i8] c"bounds check succeeded\00"
@str46 = private unnamed_addr constant [13 x i8] c"Name not ok!\00"
@str47 = private unnamed_addr constant [6 x i8] c"n < 0\00"
@str48 = private unnamed_addr constant [26 x i8] c"NOT HANDLING T_PX RECORDS\00"
@str49 = private unnamed_addr constant [27 x i8] c"NOT HANDLING T_SRV RECORDS\00"
@str50 = private unnamed_addr constant [29 x i8] c"NOT HANDLING T_NAPTR RECORDS\00"

; Function Attrs: nounwind readonly uwtable
define i32 @__res_dnok(i8* nocapture readonly %dn) #0 {
entry:
  br label %while.cond, !dbg !282

while.cond:                                       ; preds = %while.body, %entry
  %dn.addr.0 = phi i8* [ %dn, %entry ], [ %incdec.ptr, %while.body ]
  %0 = load i8* %dn.addr.0, align 1, !dbg !282, !tbaa !283
  %cmp = icmp eq i8 %0, 0, !dbg !282
  br i1 %cmp, label %return, label %while.body, !dbg !282

while.body:                                       ; preds = %while.cond
  %incdec.ptr = getelementptr inbounds i8* %dn.addr.0, i64 1, !dbg !282
  %cmp2 = icmp sgt i8 %0, 32, !dbg !286
  %cmp4 = icmp ne i8 %0, 127, !dbg !286
  %or.cond = and i1 %cmp2, %cmp4, !dbg !286
  br i1 %or.cond, label %while.cond, label %return, !dbg !286

return:                                           ; preds = %while.body, %while.cond
  %retval.0 = phi i32 [ 0, %while.body ], [ 1, %while.cond ]
  ret i32 %retval.0, !dbg !288
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind readonly uwtable
define i32 @__res_hnok(i8* nocapture readonly %dn) #0 {
entry:
  %0 = load i8* %dn, align 1, !dbg !289, !tbaa !283
  %cmp128 = icmp eq i8 %0, 0, !dbg !290
  br i1 %cmp128, label %return, label %while.body, !dbg !290

while.body:                                       ; preds = %if.else51, %while.cond.backedge, %entry
  %dn.pn = phi i8* [ %dn, %entry ], [ %dn.addr.0132, %while.cond.backedge ], [ %dn.addr.0132, %if.else51 ]
  %ch.0131.in = phi i8 [ %0, %entry ], [ %1, %while.cond.backedge ], [ %1, %if.else51 ]
  %pch.0129 = phi i32 [ 46, %entry ], [ %ch.0131, %while.cond.backedge ], [ %ch.0131, %if.else51 ]
  %ch.0131 = sext i8 %ch.0131.in to i32, !dbg !289
  %dn.addr.0132 = getelementptr inbounds i8* %dn.pn, i64 1, !dbg !289
  %1 = load i8* %dn.addr.0132, align 1, !dbg !291, !tbaa !283
  %cmp4 = icmp eq i8 %ch.0131.in, 46, !dbg !292
  br i1 %cmp4, label %while.cond.backedge, label %if.else, !dbg !292

if.else:                                          ; preds = %while.body
  %cmp6 = icmp eq i32 %pch.0129, 46, !dbg !294
  %ch.0.in.off114 = add i8 %ch.0131.in, -65, !dbg !296
  %2 = icmp ult i8 %ch.0.in.off114, 26, !dbg !296
  br i1 %cmp6, label %if.then8, label %if.else25, !dbg !294

if.then8:                                         ; preds = %if.else
  %ch.0.in.off115 = add i8 %ch.0131.in, -97, !dbg !296
  %3 = icmp ult i8 %ch.0.in.off115, 26, !dbg !296
  %or.cond = or i1 %2, %3, !dbg !296
  %ch.0.in.off116 = add i8 %ch.0131.in, -48, !dbg !296
  %4 = icmp ult i8 %ch.0.in.off116, 10, !dbg !296
  %or.cond119 = or i1 %or.cond, %4, !dbg !296
  br i1 %or.cond119, label %while.cond.backedge, label %return, !dbg !296

while.cond.backedge:                              ; preds = %lor.lhs.false63, %if.then31, %if.then8, %while.body
  %cmp = icmp eq i8 %1, 0, !dbg !290
  br i1 %cmp, label %return, label %while.body, !dbg !290

if.else25:                                        ; preds = %if.else
  switch i8 %1, label %if.else51 [
    i8 46, label %if.then31
    i8 0, label %if.then31
  ], !dbg !299

if.then31:                                        ; preds = %if.else25, %if.else25
  %ch.0.in.off112 = add i8 %ch.0131.in, -97, !dbg !301
  %5 = icmp ult i8 %ch.0.in.off112, 26, !dbg !301
  %or.cond121 = or i1 %2, %5, !dbg !301
  %ch.0.in.off113 = add i8 %ch.0131.in, -48, !dbg !301
  %6 = icmp ult i8 %ch.0.in.off113, 10, !dbg !301
  %or.cond123 = or i1 %or.cond121, %6, !dbg !301
  br i1 %or.cond123, label %while.cond.backedge, label %return, !dbg !301

if.else51:                                        ; preds = %if.else25
  %ch.0.in.off110 = add i8 %ch.0131.in, -97, !dbg !304
  %7 = icmp ult i8 %ch.0.in.off110, 26, !dbg !304
  %or.cond125 = or i1 %2, %7, !dbg !304
  br i1 %or.cond125, label %while.body, label %lor.lhs.false63, !dbg !304

lor.lhs.false63:                                  ; preds = %if.else51
  %ch.0.in.off111 = add i8 %ch.0131.in, -48, !dbg !304
  %8 = icmp ult i8 %ch.0.in.off111, 10, !dbg !304
  %cmp70 = icmp eq i8 %ch.0131.in, 45, !dbg !304
  %or.cond86 = or i1 %8, %cmp70, !dbg !304
  br i1 %or.cond86, label %while.cond.backedge, label %return, !dbg !304

return:                                           ; preds = %lor.lhs.false63, %if.then31, %while.cond.backedge, %if.then8, %entry
  %retval.0 = phi i32 [ 1, %entry ], [ 1, %while.cond.backedge ], [ 0, %lor.lhs.false63 ], [ 0, %if.then31 ], [ 0, %if.then8 ]
  ret i32 %retval.0, !dbg !307
}

; Function Attrs: nounwind uwtable
define i32 @ns_ownercontext(i32 %type, i32 %transport) #2 {
entry:
  switch i32 %type, label %sw.epilog5 [
    i32 1, label %sw.bb
    i32 11, label %sw.bb
    i32 15, label %sw.bb
    i32 7, label %sw.bb3
    i32 8, label %sw.bb3
  ], !dbg !308

sw.bb:                                            ; preds = %entry, %entry, %entry
  switch i32 %transport, label %sw.default [
    i32 3, label %sw.epilog5
    i32 0, label %sw.epilog5
    i32 1, label %sw.epilog5
    i32 2, label %sw.bb2
  ], !dbg !309

sw.bb2:                                           ; preds = %sw.bb
  br label %sw.epilog5, !dbg !311

sw.default:                                       ; preds = %sw.bb
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([42 x i8]* @.str3, i64 0, i64 0)) #6, !dbg !313
  br label %sw.epilog5, !dbg !314

sw.bb3:                                           ; preds = %entry, %entry
  br label %sw.epilog5, !dbg !315

sw.epilog5:                                       ; preds = %sw.bb3, %sw.default, %sw.bb2, %sw.bb, %sw.bb, %sw.bb, %entry
  %context.0 = phi i32 [ 0, %entry ], [ 2, %sw.bb3 ], [ 0, %sw.default ], [ 3, %sw.bb2 ], [ 1, %sw.bb ], [ 1, %sw.bb ], [ 1, %sw.bb ]
  ret i32 %context.0, !dbg !316
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #3

; Function Attrs: nounwind uwtable
define noalias i8* @newstr(i64 %len, i32 %needpanic) #2 {
entry:
  %cmp = icmp ult i64 %len, 65537, !dbg !317
  br i1 %cmp, label %cond.end, label %cond.false, !dbg !317

cond.false:                                       ; preds = %entry
  tail call void @__assert_fail(i8* getelementptr inbounds ([13 x i8]* @.str4, i64 0, i64 0), i8* getelementptr inbounds ([10 x i8]* @.str5, i64 0, i64 0), i32 282, i8* getelementptr inbounds ([26 x i8]* @__PRETTY_FUNCTION__.newstr, i64 0, i64 0)) #8, !dbg !317
  unreachable, !dbg !317

cond.end:                                         ; preds = %entry
  %add1 = add i64 %len, 3, !dbg !318
  %call = tail call noalias i8* @malloc(i64 %add1) #6, !dbg !318
  %cmp2 = icmp eq i8* %call, null, !dbg !319
  br i1 %cmp2, label %if.then, label %if.end7, !dbg !319

if.then:                                          ; preds = %cond.end
  %tobool = icmp eq i32 %needpanic, 0, !dbg !321
  br i1 %tobool, label %return, label %if.then3, !dbg !321

if.then3:                                         ; preds = %if.then
  %call4 = tail call i32* @__errno_location() #1, !dbg !324
  %0 = load i32* %call4, align 4, !dbg !324, !tbaa !325
  %call5 = tail call i8* @strerror(i32 %0) #6, !dbg !324
  %call6 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str6, i64 0, i64 0), i8* %call5) #6, !dbg !324
  br label %if.end7, !dbg !327

if.end7:                                          ; preds = %if.then3, %cond.end
  %1 = trunc i64 %len to i32, !dbg !328
  %conv8 = lshr i32 %1, 8, !dbg !328
  %conv9 = trunc i32 %conv8 to i8, !dbg !328
  %incdec.ptr = getelementptr inbounds i8* %call, i64 1, !dbg !328
  store i8 %conv9, i8* %call, align 1, !dbg !328, !tbaa !283
  %conv10 = trunc i64 %len to i8, !dbg !328
  store i8 %conv10, i8* %incdec.ptr, align 1, !dbg !328, !tbaa !283
  %add.ptr = getelementptr inbounds i8* %call, i64 2, !dbg !328
  br label %return, !dbg !329

return:                                           ; preds = %if.end7, %if.then
  %retval.0 = phi i8* [ %add.ptr, %if.end7 ], [ null, %if.then ]
  ret i8* %retval.0, !dbg !330
}

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8*, i8*, i32, i8*) #4

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #3

; Function Attrs: nounwind
declare i8* @strerror(i32) #3

; Function Attrs: nounwind readnone
declare i32* @__errno_location() #5

; Function Attrs: nounwind uwtable
define i32 @ns_nameok(i8* nocapture readonly %name, i32 %class, %struct.zoneinfo* readonly %zp, i32 %transport, i32 %context, i8* nocapture readnone %owner) #2 {
entry:
  %cmp = icmp eq %struct.zoneinfo* %zp, null, !dbg !331
  br i1 %cmp, label %if.end3, label %if.then, !dbg !331

if.then:                                          ; preds = %entry
  %z_checknames = getelementptr inbounds %struct.zoneinfo* %zp, i64 0, i32 21, !dbg !333
  %0 = load i32* %z_checknames, align 4, !dbg !333, !tbaa !334
  %phitmp = icmp eq i32 %0, 0, !dbg !333
  br i1 %phitmp, label %return, label %if.end3, !dbg !339

if.end3:                                          ; preds = %if.then, %entry
  switch i32 %context, label %sw.default [
    i32 0, label %sw.bb
    i32 3, label %sw.bb5
  ], !dbg !341

sw.bb:                                            ; preds = %if.end3
  %cmp4 = icmp eq i32 %class, 1, !dbg !342
  br i1 %cmp4, label %while.cond.i, label %return, !dbg !342

while.cond.i:                                     ; preds = %while.body.i, %sw.bb
  %dn.addr.0.i = phi i8* [ %incdec.ptr.i, %while.body.i ], [ %name, %sw.bb ]
  %1 = load i8* %dn.addr.0.i, align 1, !dbg !344, !tbaa !283
  %cmp.i = icmp eq i8 %1, 0, !dbg !344
  br i1 %cmp.i, label %return, label %while.body.i, !dbg !344

while.body.i:                                     ; preds = %while.cond.i
  %incdec.ptr.i = getelementptr inbounds i8* %dn.addr.0.i, i64 1, !dbg !344
  %cmp2.i = icmp sgt i8 %1, 32, !dbg !345
  %cmp4.i = icmp ne i8 %1, 127, !dbg !345
  %or.cond.i = and i1 %cmp2.i, %cmp4.i, !dbg !345
  br i1 %or.cond.i, label %while.cond.i, label %return, !dbg !345

sw.bb5:                                           ; preds = %if.end3
  %2 = load i8* %name, align 1, !dbg !346, !tbaa !283
  %cmp128.i = icmp eq i8 %2, 0, !dbg !348
  br i1 %cmp128.i, label %return, label %while.body.i12, !dbg !348

while.body.i12:                                   ; preds = %if.else51.i, %while.cond.backedge.i, %sw.bb5
  %dn.pn.i = phi i8* [ %name, %sw.bb5 ], [ %dn.addr.0132.i, %while.cond.backedge.i ], [ %dn.addr.0132.i, %if.else51.i ]
  %ch.0131.in.i = phi i8 [ %2, %sw.bb5 ], [ %3, %while.cond.backedge.i ], [ %3, %if.else51.i ]
  %pch.0129.i = phi i32 [ 46, %sw.bb5 ], [ %ch.0131.i, %while.cond.backedge.i ], [ %ch.0131.i, %if.else51.i ]
  %ch.0131.i = sext i8 %ch.0131.in.i to i32, !dbg !346
  %dn.addr.0132.i = getelementptr inbounds i8* %dn.pn.i, i64 1, !dbg !346
  %3 = load i8* %dn.addr.0132.i, align 1, !dbg !349, !tbaa !283
  %cmp4.i11 = icmp eq i8 %ch.0131.in.i, 46, !dbg !350
  br i1 %cmp4.i11, label %while.cond.backedge.i, label %if.else.i, !dbg !350

if.else.i:                                        ; preds = %while.body.i12
  %cmp6.i = icmp eq i32 %pch.0129.i, 46, !dbg !351
  %ch.0.in.off114.i = add i8 %ch.0131.in.i, -65, !dbg !352
  %4 = icmp ult i8 %ch.0.in.off114.i, 26, !dbg !352
  br i1 %cmp6.i, label %if.then8.i, label %if.else25.i, !dbg !351

if.then8.i:                                       ; preds = %if.else.i
  %ch.0.in.off115.i = add i8 %ch.0131.in.i, -97, !dbg !352
  %5 = icmp ult i8 %ch.0.in.off115.i, 26, !dbg !352
  %or.cond.i13 = or i1 %4, %5, !dbg !352
  %ch.0.in.off116.i = add i8 %ch.0131.in.i, -48, !dbg !352
  %6 = icmp ult i8 %ch.0.in.off116.i, 10, !dbg !352
  %or.cond119.i = or i1 %or.cond.i13, %6, !dbg !352
  br i1 %or.cond119.i, label %while.cond.backedge.i, label %return, !dbg !352

while.cond.backedge.i:                            ; preds = %lor.lhs.false63.i, %if.then31.i, %if.then8.i, %while.body.i12
  %cmp.i14 = icmp eq i8 %3, 0, !dbg !348
  br i1 %cmp.i14, label %return, label %while.body.i12, !dbg !348

if.else25.i:                                      ; preds = %if.else.i
  switch i8 %3, label %if.else51.i [
    i8 46, label %if.then31.i
    i8 0, label %if.then31.i
  ], !dbg !353

if.then31.i:                                      ; preds = %if.else25.i, %if.else25.i
  %ch.0.in.off112.i = add i8 %ch.0131.in.i, -97, !dbg !354
  %7 = icmp ult i8 %ch.0.in.off112.i, 26, !dbg !354
  %or.cond121.i = or i1 %4, %7, !dbg !354
  %ch.0.in.off113.i = add i8 %ch.0131.in.i, -48, !dbg !354
  %8 = icmp ult i8 %ch.0.in.off113.i, 10, !dbg !354
  %or.cond123.i = or i1 %or.cond121.i, %8, !dbg !354
  br i1 %or.cond123.i, label %while.cond.backedge.i, label %return, !dbg !354

if.else51.i:                                      ; preds = %if.else25.i
  %ch.0.in.off110.i = add i8 %ch.0131.in.i, -97, !dbg !355
  %9 = icmp ult i8 %ch.0.in.off110.i, 26, !dbg !355
  %or.cond125.i = or i1 %4, %9, !dbg !355
  br i1 %or.cond125.i, label %while.body.i12, label %lor.lhs.false63.i, !dbg !355

lor.lhs.false63.i:                                ; preds = %if.else51.i
  %ch.0.in.off111.i = add i8 %ch.0131.in.i, -48, !dbg !355
  %10 = icmp ult i8 %ch.0.in.off111.i, 10, !dbg !355
  %cmp70.i = icmp eq i8 %ch.0131.in.i, 45, !dbg !355
  %or.cond86.i = or i1 %10, %cmp70.i, !dbg !355
  br i1 %or.cond86.i, label %while.cond.backedge.i, label %return, !dbg !355

sw.default:                                       ; preds = %if.end3
  %call7 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([35 x i8]* @.str7, i64 0, i64 0), i32 %context) #6, !dbg !356
  br label %return, !dbg !358

return:                                           ; preds = %sw.default, %lor.lhs.false63.i, %if.then31.i, %while.cond.backedge.i, %if.then8.i, %sw.bb5, %while.body.i, %while.cond.i, %sw.bb, %if.then
  %retval.0 = phi i32 [ 0, %sw.default ], [ 1, %if.then ], [ 1, %sw.bb5 ], [ 1, %sw.bb ], [ 0, %while.body.i ], [ 1, %while.cond.i ], [ 0, %lor.lhs.false63.i ], [ 0, %if.then31.i ], [ 1, %while.cond.backedge.i ], [ 0, %if.then8.i ]
  ret i32 %retval.0, !dbg !359
}

; Function Attrs: nounwind uwtable
define i32 @create_msg(i8* nocapture %buf) #2 {
while.body.lr.ph:
  %exp_dn = alloca [200 x i8], align 16
  %exp_dn2 = alloca [200 x i8], align 16
  %0 = getelementptr inbounds [200 x i8]* %exp_dn, i64 0, i64 0, !dbg !360
  %1 = getelementptr inbounds [200 x i8]* %exp_dn2, i64 0, i64 0, !dbg !360
  %call = call noalias i8* @malloc(i64 16) #6, !dbg !361
  %2 = bitcast i8* %call to i8**, !dbg !361
  %call1 = call noalias i8* @malloc(i64 16) #6, !dbg !362
  %3 = bitcast i8* %call1 to i8**, !dbg !362
  %call2 = call noalias i8* @malloc(i64 200) #6, !dbg !363
  %call3 = call noalias i8* @malloc(i64 200) #6, !dbg !364
  %call4 = call noalias i8* @malloc(i64 400) #6, !dbg !365
  %4 = call i8* @memcpy(i8* %call4, i8* getelementptr inbounds ([13 x i8]* @.str8, i64 0, i64 0), i64 13)
  %call6 = call i64 @strlen(i8* %call4) #9, !dbg !366
  %conv7 = trunc i64 %call6 to i32, !dbg !366
  br label %while.body, !dbg !367

while.body:                                       ; preds = %while.body, %while.body.lr.ph
  %5 = phi i8 [ 72, %while.body.lr.ph ], [ %6, %while.body ]
  %p.0267 = phi i8* [ %buf, %while.body.lr.ph ], [ %incdec.ptr10, %while.body ]
  %temp.0266 = phi i8* [ %call4, %while.body.lr.ph ], [ %incdec.ptr, %while.body ]
  %incdec.ptr = getelementptr inbounds i8* %temp.0266, i64 1, !dbg !368
  %incdec.ptr10 = getelementptr inbounds i8* %p.0267, i64 1, !dbg !368
  store i8 %5, i8* %p.0267, align 1, !dbg !368, !tbaa !283
  %6 = load i8* %incdec.ptr, align 1, !dbg !367, !tbaa !283
  %cmp = icmp eq i8 %6, 0, !dbg !367
  br i1 %cmp, label %while.end, label %while.body, !dbg !367

while.end:                                        ; preds = %while.body
  %7 = call i8* @memcpy(i8* %0, i8* getelementptr inbounds ([12 x i8]* @.str9, i64 0, i64 0), i64 12)
  %incdec.ptr13 = getelementptr inbounds i8* %call, i64 8, !dbg !369
  %8 = bitcast i8* %incdec.ptr13 to i8**, !dbg !369
  store i8* %0, i8** %2, align 8, !dbg !369, !tbaa !370
  store i8* null, i8** %8, align 8, !dbg !371, !tbaa !370
  %puts = call i32 @puts(i8* getelementptr inbounds ([18 x i8]* @str41, i64 0, i64 0)), !dbg !372
  %call17 = call i32 @__dn_comp(i8* %0, i8* %call2, i32 200, i8** %2, i8** null) #6, !dbg !373
  %call19 = call i64 @strlen(i8* %0) #9, !dbg !374
  %call20 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([18 x i8]* @.str11, i64 0, i64 0), i64 %call19) #6, !dbg !374
  %call21 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([16 x i8]* @.str12, i64 0, i64 0), i32 %call17) #6, !dbg !375
  %call23 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([27 x i8]* @.str13, i64 0, i64 0), i8* %0, i8* %call2) #6, !dbg !376
  %cmp24260 = icmp sgt i32 %call17, 0, !dbg !377
  br i1 %cmp24260, label %for.body.lr.ph, label %for.end, !dbg !377

for.body.lr.ph:                                   ; preds = %while.end
  %9 = add i32 %call17, -1, !dbg !377
  %10 = zext i32 %9 to i64
  %11 = zext i32 %9 to i64
  %12 = add i64 %11, 1, !dbg !377
  %end.idx477 = add i64 %11, 1, !dbg !377
  %n.vec479 = and i64 %12, 8589934560, !dbg !377
  %cmp.zero481 = icmp eq i64 %n.vec479, 0, !dbg !377
  %13 = add i32 %call17, -1
  %14 = zext i32 %13 to i64
  br i1 %cmp.zero481, label %middle.block474, label %vector.memcheck488

vector.memcheck488:                               ; preds = %for.body.lr.ph
  %incdec.ptr10.sum818 = add i64 %14, 1
  %scevgep483 = getelementptr i8* %call2, i64 %14
  %scevgep482 = getelementptr i8* %p.0267, i64 %incdec.ptr10.sum818
  %bound1485 = icmp ule i8* %call2, %scevgep482
  %bound0484 = icmp ule i8* %incdec.ptr10, %scevgep483
  %memcheck.conflict487 = and i1 %bound0484, %bound1485
  %incdec.ptr10.sum819820 = or i64 %n.vec479, 1
  %ptr.ind.end490 = getelementptr i8* %p.0267, i64 %incdec.ptr10.sum819820
  %ptr.ind.end492 = getelementptr i8* %call2, i64 %n.vec479
  %15 = trunc i64 %n.vec479 to i32
  br i1 %memcheck.conflict487, label %middle.block474, label %vector.body473

vector.body473:                                   ; preds = %vector.body473, %vector.memcheck488
  %index476 = phi i64 [ %index.next496, %vector.body473 ], [ 0, %vector.memcheck488 ], !dbg !377
  %incdec.ptr10.sum821822 = or i64 %index476, 1
  %next.gep499 = getelementptr i8* %p.0267, i64 %incdec.ptr10.sum821822
  %next.gep596 = getelementptr i8* %call2, i64 %index476
  %16 = bitcast i8* %next.gep596 to <16 x i8>*, !dbg !379
  %wide.load695 = load <16 x i8>* %16, align 1, !dbg !379
  %next.gep596.sum947 = or i64 %index476, 16, !dbg !379
  %17 = getelementptr i8* %call2, i64 %next.gep596.sum947, !dbg !379
  %18 = bitcast i8* %17 to <16 x i8>*, !dbg !379
  %wide.load696 = load <16 x i8>* %18, align 1, !dbg !379
  %19 = bitcast i8* %next.gep499 to <16 x i8>*, !dbg !379
  store <16 x i8> %wide.load695, <16 x i8>* %19, align 1, !dbg !379
  %next.gep499.sum956 = or i64 %index476, 17, !dbg !379
  %20 = getelementptr i8* %p.0267, i64 %next.gep499.sum956, !dbg !379
  %21 = bitcast i8* %20 to <16 x i8>*, !dbg !379
  store <16 x i8> %wide.load696, <16 x i8>* %21, align 1, !dbg !379
  %index.next496 = add i64 %index476, 32, !dbg !377
  %22 = icmp eq i64 %index.next496, %n.vec479, !dbg !377
  br i1 %22, label %middle.block474, label %vector.body473, !dbg !377, !llvm.loop !380

middle.block474:                                  ; preds = %vector.body473, %vector.memcheck488, %for.body.lr.ph
  %resume.val489 = phi i8* [ %incdec.ptr10, %for.body.lr.ph ], [ %incdec.ptr10, %vector.memcheck488 ], [ %ptr.ind.end490, %vector.body473 ]
  %resume.val491 = phi i8* [ %call2, %for.body.lr.ph ], [ %call2, %vector.memcheck488 ], [ %ptr.ind.end492, %vector.body473 ]
  %resume.val493 = phi i64 [ 0, %for.body.lr.ph ], [ 0, %vector.memcheck488 ], [ %n.vec479, %vector.body473 ]
  %trunc.resume.val494 = phi i32 [ 0, %for.body.lr.ph ], [ 0, %vector.memcheck488 ], [ %15, %vector.body473 ]
  %cmp.n495 = icmp eq i64 %end.idx477, %resume.val493
  br i1 %cmp.n495, label %for.cond.for.end_crit_edge, label %for.body

for.body:                                         ; preds = %for.body, %middle.block474
  %p.1263 = phi i8* [ %incdec.ptr27, %for.body ], [ %resume.val489, %middle.block474 ]
  %comp_dn.0262 = phi i8* [ %incdec.ptr26, %for.body ], [ %resume.val491, %middle.block474 ]
  %i.0261 = phi i32 [ %inc, %for.body ], [ %trunc.resume.val494, %middle.block474 ]
  %incdec.ptr26 = getelementptr inbounds i8* %comp_dn.0262, i64 1, !dbg !379
  %23 = load i8* %comp_dn.0262, align 1, !dbg !379, !tbaa !283
  %incdec.ptr27 = getelementptr inbounds i8* %p.1263, i64 1, !dbg !379
  store i8 %23, i8* %p.1263, align 1, !dbg !379, !tbaa !283
  %inc = add nsw i32 %i.0261, 1, !dbg !377
  %exitcond271 = icmp eq i32 %inc, %call17, !dbg !377
  br i1 %exitcond271, label %for.cond.for.end_crit_edge, label %for.body, !dbg !377, !llvm.loop !383

for.cond.for.end_crit_edge:                       ; preds = %for.body, %middle.block474
  %incdec.ptr10.sum = add i64 %10, 2
  %scevgep270 = getelementptr i8* %p.0267, i64 %incdec.ptr10.sum
  br label %for.end, !dbg !377

for.end:                                          ; preds = %for.cond.for.end_crit_edge, %while.end
  %p.1.lcssa = phi i8* [ %scevgep270, %for.cond.for.end_crit_edge ], [ %incdec.ptr10, %while.end ]
  %incdec.ptr31 = getelementptr inbounds i8* %p.1.lcssa, i64 1, !dbg !384
  store i8 0, i8* %p.1.lcssa, align 1, !dbg !384, !tbaa !283
  store i8 30, i8* %incdec.ptr31, align 1, !dbg !384, !tbaa !283
  %add.ptr33 = getelementptr inbounds i8* %p.1.lcssa, i64 4, !dbg !385
  %incdec.ptr40 = getelementptr inbounds i8* %p.1.lcssa, i64 5, !dbg !386
  store i8 0, i8* %add.ptr33, align 1, !dbg !386, !tbaa !283
  store i8 -1, i8* %incdec.ptr40, align 1, !dbg !386, !tbaa !283
  %add.ptr45 = getelementptr inbounds i8* %p.1.lcssa, i64 8, !dbg !387
  %incdec.ptr50 = getelementptr inbounds i8* %p.1.lcssa, i64 9, !dbg !388
  store i8 0, i8* %add.ptr45, align 1, !dbg !388, !tbaa !283
  %incdec.ptr53 = getelementptr inbounds i8* %p.1.lcssa, i64 10, !dbg !388
  store i8 0, i8* %incdec.ptr50, align 1, !dbg !388, !tbaa !283
  %incdec.ptr56 = getelementptr inbounds i8* %p.1.lcssa, i64 11, !dbg !388
  store i8 0, i8* %incdec.ptr53, align 1, !dbg !388, !tbaa !283
  store i8 -1, i8* %incdec.ptr56, align 1, !dbg !388, !tbaa !283
  %add.ptr61 = getelementptr inbounds i8* %p.1.lcssa, i64 16, !dbg !389
  %incdec.ptr68 = getelementptr inbounds i8* %p.1.lcssa, i64 17, !dbg !390
  store i8 0, i8* %add.ptr61, align 1, !dbg !390, !tbaa !283
  store i8 16, i8* %incdec.ptr68, align 1, !dbg !390, !tbaa !283
  %add.ptr73 = getelementptr inbounds i8* %p.1.lcssa, i64 20, !dbg !391
  %24 = call i8* @memcpy(i8* %1, i8* getelementptr inbounds ([16 x i8]* @.str14, i64 0, i64 0), i64 16)
  %incdec.ptr78 = getelementptr inbounds i8* %call1, i64 8, !dbg !392
  %25 = bitcast i8* %incdec.ptr78 to i8**, !dbg !392
  store i8* %1, i8** %3, align 8, !dbg !392, !tbaa !370
  store i8* null, i8** %25, align 8, !dbg !393, !tbaa !370
  %puts255 = call i32 @puts(i8* getelementptr inbounds ([18 x i8]* @str41, i64 0, i64 0)), !dbg !394
  %call82 = call i32 @__dn_comp(i8* %1, i8* %call3, i32 200, i8** %3, i8** null) #6, !dbg !395
  %call84 = call i64 @strlen(i8* %1) #9, !dbg !396
  %call85 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([18 x i8]* @.str11, i64 0, i64 0), i64 %call84) #6, !dbg !396
  %call86 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([16 x i8]* @.str12, i64 0, i64 0), i32 %call82) #6, !dbg !397
  %call88 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str15, i64 0, i64 0), i8* %1, i8* %call3) #6, !dbg !398
  %cmp91256 = icmp sgt i32 %call82, 0, !dbg !399
  br i1 %cmp91256, label %for.body93.lr.ph, label %do.body99, !dbg !399

for.body93.lr.ph:                                 ; preds = %for.end
  %26 = add i32 %call82, -1, !dbg !399
  %27 = zext i32 %26 to i64
  %28 = add i64 %27, 21, !dbg !399
  %29 = zext i32 %26 to i64
  %30 = add i64 %29, 1, !dbg !399
  %end.idx = add i64 %29, 1, !dbg !399
  %n.vec = and i64 %30, 8589934560, !dbg !399
  %cmp.zero = icmp eq i64 %n.vec, 0, !dbg !399
  %31 = add i32 %call82, -1
  %32 = zext i32 %31 to i64
  br i1 %cmp.zero, label %middle.block, label %vector.memcheck

vector.memcheck:                                  ; preds = %for.body93.lr.ph
  %33 = add i64 %32, 20
  %scevgep274 = getelementptr i8* %call3, i64 %32
  %scevgep273 = getelementptr i8* %p.1.lcssa, i64 %33
  %scevgep272 = getelementptr i8* %p.1.lcssa, i64 20
  %bound1 = icmp ule i8* %call3, %scevgep273
  %bound0 = icmp ule i8* %scevgep272, %scevgep274
  %memcheck.conflict = and i1 %bound0, %bound1
  %add.ptr73.sum699 = or i64 %n.vec, 20
  %ptr.ind.end = getelementptr i8* %p.1.lcssa, i64 %add.ptr73.sum699
  %ptr.ind.end276 = getelementptr i8* %call3, i64 %n.vec
  %34 = trunc i64 %n.vec to i32
  br i1 %memcheck.conflict, label %middle.block, label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.memcheck
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.memcheck ], !dbg !399
  %add.ptr73.sum700 = or i64 %index, 20
  %next.gep = getelementptr i8* %p.1.lcssa, i64 %add.ptr73.sum700
  %next.gep373 = getelementptr i8* %call3, i64 %index
  %35 = bitcast i8* %next.gep373 to <16 x i8>*, !dbg !401
  %wide.load = load <16 x i8>* %35, align 1, !dbg !401
  %next.gep373.sum813 = or i64 %index, 16, !dbg !401
  %36 = getelementptr i8* %call3, i64 %next.gep373.sum813, !dbg !401
  %37 = bitcast i8* %36 to <16 x i8>*, !dbg !401
  %wide.load469 = load <16 x i8>* %37, align 1, !dbg !401
  %38 = bitcast i8* %next.gep to <16 x i8>*, !dbg !401
  store <16 x i8> %wide.load, <16 x i8>* %38, align 1, !dbg !401
  %next.gep.sum = add i64 %add.ptr73.sum700, 16, !dbg !401
  %39 = getelementptr i8* %p.1.lcssa, i64 %next.gep.sum, !dbg !401
  %40 = bitcast i8* %39 to <16 x i8>*, !dbg !401
  store <16 x i8> %wide.load469, <16 x i8>* %40, align 1, !dbg !401
  %index.next = add i64 %index, 32, !dbg !399
  %41 = icmp eq i64 %index.next, %n.vec, !dbg !399
  br i1 %41, label %middle.block, label %vector.body, !dbg !399, !llvm.loop !402

middle.block:                                     ; preds = %vector.body, %vector.memcheck, %for.body93.lr.ph
  %resume.val = phi i8* [ %add.ptr73, %for.body93.lr.ph ], [ %add.ptr73, %vector.memcheck ], [ %ptr.ind.end, %vector.body ]
  %resume.val275 = phi i8* [ %call3, %for.body93.lr.ph ], [ %call3, %vector.memcheck ], [ %ptr.ind.end276, %vector.body ]
  %resume.val277 = phi i64 [ 0, %for.body93.lr.ph ], [ 0, %vector.memcheck ], [ %n.vec, %vector.body ]
  %trunc.resume.val = phi i32 [ 0, %for.body93.lr.ph ], [ 0, %vector.memcheck ], [ %34, %vector.body ]
  %cmp.n = icmp eq i64 %end.idx, %resume.val277
  br i1 %cmp.n, label %for.cond90.do.body99_crit_edge, label %for.body93

for.body93:                                       ; preds = %for.body93, %middle.block
  %p.2259 = phi i8* [ %incdec.ptr95, %for.body93 ], [ %resume.val, %middle.block ]
  %comp_dn2.0258 = phi i8* [ %incdec.ptr94, %for.body93 ], [ %resume.val275, %middle.block ]
  %i.1257 = phi i32 [ %inc97, %for.body93 ], [ %trunc.resume.val, %middle.block ]
  %incdec.ptr94 = getelementptr inbounds i8* %comp_dn2.0258, i64 1, !dbg !401
  %42 = load i8* %comp_dn2.0258, align 1, !dbg !401, !tbaa !283
  %incdec.ptr95 = getelementptr inbounds i8* %p.2259, i64 1, !dbg !401
  store i8 %42, i8* %p.2259, align 1, !dbg !401, !tbaa !283
  %inc97 = add nsw i32 %i.1257, 1, !dbg !399
  %exitcond = icmp eq i32 %inc97, %call82, !dbg !399
  br i1 %exitcond, label %for.cond90.do.body99_crit_edge, label %for.body93, !dbg !399, !llvm.loop !403

for.cond90.do.body99_crit_edge:                   ; preds = %for.body93, %middle.block
  %scevgep = getelementptr i8* %p.1.lcssa, i64 %28
  br label %do.body99, !dbg !399

do.body99:                                        ; preds = %for.cond90.do.body99_crit_edge, %for.end
  %p.2.lcssa = phi i8* [ %scevgep, %for.cond90.do.body99_crit_edge ], [ %add.ptr73, %for.end ]
  %incdec.ptr104 = getelementptr inbounds i8* %p.2.lcssa, i64 1, !dbg !404
  store i8 1, i8* %p.2.lcssa, align 1, !dbg !404, !tbaa !283
  %incdec.ptr107 = getelementptr inbounds i8* %p.2.lcssa, i64 2, !dbg !404
  store i8 0, i8* %incdec.ptr104, align 1, !dbg !404, !tbaa !283
  %incdec.ptr110 = getelementptr inbounds i8* %p.2.lcssa, i64 3, !dbg !404
  store i8 0, i8* %incdec.ptr107, align 1, !dbg !404, !tbaa !283
  store i8 0, i8* %incdec.ptr110, align 1, !dbg !404, !tbaa !283
  %add.ptr115 = getelementptr inbounds i8* %p.2.lcssa, i64 8, !dbg !405
  %add.ptr132 = getelementptr inbounds i8* %p.2.lcssa, i64 16, !dbg !406
  %add.ptr149 = getelementptr inbounds i8* %p.2.lcssa, i64 24, !dbg !407
  %add74 = add i32 %conv7, 26, !dbg !408
  %add89 = add i32 %add74, %call17, !dbg !409
  %add167 = add i32 %add89, %call82, !dbg !410
  %43 = bitcast i8* %add.ptr115 to i32*, !dbg !411
  store i32 0, i32* %43, align 1, !dbg !411
  %44 = bitcast i8* %add.ptr132 to i32*, !dbg !412
  store i32 0, i32* %44, align 1, !dbg !412
  %45 = bitcast i8* %add.ptr149 to i32*, !dbg !413
  store i32 0, i32* %45, align 1, !dbg !413
  ret i32 %add167, !dbg !414
}

; Function Attrs: nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #6

; Function Attrs: nounwind readonly
declare i64 @strlen(i8* nocapture) #7

; Function Attrs: nounwind
declare i32 @__dn_comp(i8*, i8*, i32, i8**, i8**) #3

; Function Attrs: nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #6

; Function Attrs: nounwind uwtable
define i32 @main() #2 {
entry:
  %data.i = alloca [4140 x i8], align 16
  %call = call noalias i8* @malloc(i64 100) #6, !dbg !415
  %call1 = call noalias i8* @malloc(i64 1000) #6, !dbg !416
  %puts = call i32 @puts(i8* getelementptr inbounds ([20 x i8]* @str42, i64 0, i64 0)), !dbg !417
  %call3 = call i32 @create_msg(i8* %call1), !dbg !418
  %call4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str17, i64 0, i64 0), i32 %call3) #6, !dbg !419
  %add.ptr = getelementptr inbounds i8* %call1, i64 12, !dbg !420
  %puts12 = call i32 @puts(i8* getelementptr inbounds ([19 x i8]* @str43, i64 0, i64 0)), !dbg !421
  %call6 = call i32 @__res_init() #6, !dbg !422
  %0 = getelementptr inbounds [4140 x i8]* %data.i, i64 0, i64 0, !dbg !423
  %idx.ext.i = sext i32 %call3 to i64, !dbg !425
  %add.ptr.i = getelementptr inbounds i8* %call1, i64 %idx.ext.i, !dbg !425
  %puts.i = call i32 @puts(i8* getelementptr inbounds ([25 x i8]* @str44, i64 0, i64 0)) #6, !dbg !426
  %call1.i = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([47 x i8]* @.str21, i64 0, i64 0), i8* %call1, i32 %call3, i8* %add.ptr, i32 100) #6, !dbg !427
  %call2.i = call i32 @__dn_expand(i8* %call1, i8* %add.ptr.i, i8* %add.ptr, i8* %call, i32 100) #6, !dbg !428
  %cmp.i = icmp slt i32 %call2.i, 0, !dbg !428
  br i1 %cmp.i, label %if.then.i, label %if.end.i, !dbg !428

if.then.i:                                        ; preds = %entry
  %call3.i = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str22, i64 0, i64 0), i32 %call2.i) #6, !dbg !430
  %1 = bitcast i8* %call1 to i96*, !dbg !432
  %bf.load.i = load i96* %1, align 4, !dbg !432
  %bf.clear.i = and i96 %bf.load.i, -251658241, !dbg !432
  %bf.set.i = or i96 %bf.clear.i, 16777216, !dbg !432
  store i96 %bf.set.i, i96* %1, align 4, !dbg !432
  br label %rrextract.exit, !dbg !433

if.end.i:                                         ; preds = %entry
  %call4.i = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([33 x i8]* @.str23, i64 0, i64 0), i32 %call2.i) #6, !dbg !434
  %idx.ext5.i = sext i32 %call2.i to i64, !dbg !435
  %add.ptr.sum = add i64 %idx.ext5.i, 22, !dbg !436
  %add.ptr9.i = getelementptr inbounds i8* %call1, i64 %add.ptr.sum, !dbg !436
  %cmp10.i = icmp sgt i64 %add.ptr.sum, %idx.ext.i, !dbg !436
  br i1 %cmp10.i, label %if.then12.i, label %do.body17.i, !dbg !436

if.then12.i:                                      ; preds = %if.end.i
  %2 = bitcast i8* %call1 to i96*, !dbg !439
  %bf.load13.i = load i96* %2, align 4, !dbg !439
  %bf.clear14.i = and i96 %bf.load13.i, -251658241, !dbg !439
  %bf.set15.i = or i96 %bf.clear14.i, 16777216, !dbg !439
  store i96 %bf.set15.i, i96* %2, align 4, !dbg !439
  br label %rrextract.exit, !dbg !439

do.body17.i:                                      ; preds = %if.end.i
  %add.ptr.sum13 = add i64 %idx.ext5.i, 12, !dbg !435
  %add.ptr6.i = getelementptr inbounds i8* %call1, i64 %add.ptr.sum13, !dbg !435
  %3 = load i8* %add.ptr6.i, align 1, !dbg !441, !tbaa !283
  %conv19.i = zext i8 %3 to i32, !dbg !441
  %shl.i = shl nuw nsw i32 %conv19.i, 8, !dbg !441
  %add.ptr.sum14 = add i64 %idx.ext5.i, 13, !dbg !441
  %arrayidx20.i = getelementptr inbounds i8* %call1, i64 %add.ptr.sum14, !dbg !441
  %4 = load i8* %arrayidx20.i, align 1, !dbg !441, !tbaa !283
  %conv22.i = zext i8 %4 to i32, !dbg !441
  %or.i = or i32 %shl.i, %conv22.i, !dbg !441
  %add.ptr.sum15 = add i64 %idx.ext5.i, 16, !dbg !442
  %add.ptr26.i = getelementptr inbounds i8* %call1, i64 %add.ptr.sum15, !dbg !442
  %call28.i = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str24, i64 0, i64 0), i32 %or.i) #6, !dbg !443
  %5 = load i8* %add.ptr26.i, align 1, !dbg !444, !tbaa !283
  %conv33.i = zext i8 %5 to i32, !dbg !444
  %shl34.i = shl nuw nsw i32 %conv33.i, 8, !dbg !444
  %add.ptr.sum16 = add i64 %idx.ext5.i, 17, !dbg !444
  %arrayidx35.i = getelementptr inbounds i8* %call1, i64 %add.ptr.sum16, !dbg !444
  %6 = load i8* %arrayidx35.i, align 1, !dbg !444, !tbaa !283
  %conv37.i = zext i8 %6 to i32, !dbg !444
  %or38.i = or i32 %shl34.i, %conv37.i, !dbg !444
  %cmp44.i = icmp ugt i32 %or38.i, 255, !dbg !445
  br i1 %cmp44.i, label %if.then46.i, label %do.body52.i, !dbg !445

if.then46.i:                                      ; preds = %do.body17.i
  %call47.i = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str25, i64 0, i64 0)) #6, !dbg !447
  %7 = bitcast i8* %call1 to i96*, !dbg !449
  %bf.load48.i = load i96* %7, align 4, !dbg !449
  %bf.clear49.i = and i96 %bf.load48.i, -251658241, !dbg !449
  %bf.set50.i = or i96 %bf.clear49.i, 16777216, !dbg !449
  store i96 %bf.set50.i, i96* %7, align 4, !dbg !449
  br label %rrextract.exit, !dbg !450

do.body52.i:                                      ; preds = %do.body17.i
  %add.ptr.sum17 = add i64 %idx.ext5.i, 20, !dbg !451
  %add.ptr42.i = getelementptr inbounds i8* %call1, i64 %add.ptr.sum17, !dbg !451
  %8 = load i8* %add.ptr42.i, align 1, !dbg !452, !tbaa !283
  %conv55.i = zext i8 %8 to i32, !dbg !452
  %shl56.i = shl nuw i32 %conv55.i, 24, !dbg !452
  %add.ptr.sum18 = add i64 %idx.ext5.i, 21, !dbg !452
  %arrayidx57.i = getelementptr inbounds i8* %call1, i64 %add.ptr.sum18, !dbg !452
  %9 = load i8* %arrayidx57.i, align 1, !dbg !452, !tbaa !283
  %conv58.i = zext i8 %9 to i32, !dbg !452
  %shl59.i = shl nuw nsw i32 %conv58.i, 16, !dbg !452
  %or60.i = or i32 %shl59.i, %shl56.i, !dbg !452
  %10 = load i8* %add.ptr9.i, align 1, !dbg !452, !tbaa !283
  %conv62.i = zext i8 %10 to i32, !dbg !452
  %shl63.i = shl nuw nsw i32 %conv62.i, 8, !dbg !452
  %or64.i = or i32 %or60.i, %shl63.i, !dbg !452
  %add.ptr.sum19 = add i64 %idx.ext5.i, 23, !dbg !452
  %arrayidx65.i = getelementptr inbounds i8* %call1, i64 %add.ptr.sum19, !dbg !452
  %11 = load i8* %arrayidx65.i, align 1, !dbg !452, !tbaa !283
  %conv66.i = zext i8 %11 to i32, !dbg !452
  %or67.i = or i32 %or64.i, %conv66.i, !dbg !452
  %call71.i = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str26, i64 0, i64 0), i32 %or67.i) #6, !dbg !453
  %add.ptr.sum20 = add i64 %idx.ext5.i, 28, !dbg !454
  %add.ptr72.i = getelementptr inbounds i8* %call1, i64 %add.ptr.sum20, !dbg !454
  %cmp74.i = icmp slt i32 %or67.i, 0, !dbg !455
  br i1 %cmp74.i, label %if.then76.i, label %do.body79.i, !dbg !455

if.then76.i:                                      ; preds = %do.body52.i
  %call77.i = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str27, i64 0, i64 0), i8* %call, i32 2147483647) #6, !dbg !457
  br label %do.body79.i, !dbg !459

do.body79.i:                                      ; preds = %if.then76.i, %do.body52.i
  %ttl.0.i = phi i32 [ 0, %if.then76.i ], [ %or67.i, %do.body52.i ]
  %12 = load i8* %add.ptr72.i, align 1, !dbg !460, !tbaa !283
  %conv83.i = zext i8 %12 to i32, !dbg !460
  %shl84.i = shl nuw nsw i32 %conv83.i, 8, !dbg !460
  %add.ptr.sum21 = add i64 %idx.ext5.i, 29, !dbg !460
  %arrayidx85.i = getelementptr inbounds i8* %call1, i64 %add.ptr.sum21, !dbg !460
  %13 = load i8* %arrayidx85.i, align 1, !dbg !460, !tbaa !283
  %conv87.i = zext i8 %13 to i32, !dbg !460
  %or88.i = or i32 %shl84.i, %conv87.i, !dbg !460
  %add.ptr.sum22 = add i64 %idx.ext5.i, 32, !dbg !461
  %add.ptr92.i = getelementptr inbounds i8* %call1, i64 %add.ptr.sum22, !dbg !461
  %sub.i = add i32 %call3, -34, !dbg !462
  %sub94.i = sub i32 %sub.i, %call2.i, !dbg !462
  %call95.i = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([35 x i8]* @.str28, i64 0, i64 0), i32 %sub94.i, i32 %or88.i) #6, !dbg !462
  %idx.ext97.i = zext i32 %or88.i to i64, !dbg !463
  %add.ptr.sum23 = add i64 %add.ptr.sum22, %idx.ext97.i, !dbg !463
  %cmp99.i = icmp sgt i64 %add.ptr.sum23, %idx.ext.i, !dbg !463
  br i1 %cmp99.i, label %if.then101.i, label %do.end107.i, !dbg !463

if.then101.i:                                     ; preds = %do.body79.i
  %14 = bitcast i8* %call1 to i96*, !dbg !466
  %bf.load102.i = load i96* %14, align 4, !dbg !466
  %bf.clear103.i = and i96 %bf.load102.i, -251658241, !dbg !466
  %bf.set104.i = or i96 %bf.clear103.i, 16777216, !dbg !466
  store i96 %bf.set104.i, i96* %14, align 4, !dbg !466
  br label %rrextract.exit, !dbg !466

do.end107.i:                                      ; preds = %do.body79.i
  %puts8.i = call i32 @puts(i8* getelementptr inbounds ([23 x i8]* @str45, i64 0, i64 0)) #6, !dbg !468
  switch i32 %or.i, label %sw.bb.i17.i [
    i32 1, label %sw.bb5.i.i
    i32 11, label %sw.bb5.i.i
    i32 15, label %sw.bb5.i.i
    i32 7, label %sw.default.i.i
    i32 8, label %sw.default.i.i
  ], !dbg !469

sw.bb.i17.i:                                      ; preds = %do.end107.i
  %cmp4.i16.i = icmp eq i32 %or38.i, 1, !dbg !472
  br i1 %cmp4.i16.i, label %while.cond.i.i20.i, label %if.end115.i, !dbg !472

while.cond.i.i20.i:                               ; preds = %while.body.i.i25.i, %sw.bb.i17.i
  %dn.addr.0.i.i18.i = phi i8* [ %incdec.ptr.i.i21.i, %while.body.i.i25.i ], [ %call, %sw.bb.i17.i ]
  %15 = load i8* %dn.addr.0.i.i18.i, align 1, !dbg !474, !tbaa !283
  %cmp.i.i19.i = icmp eq i8 %15, 0, !dbg !474
  br i1 %cmp.i.i19.i, label %if.end115.i, label %while.body.i.i25.i, !dbg !474

while.body.i.i25.i:                               ; preds = %while.cond.i.i20.i
  %incdec.ptr.i.i21.i = getelementptr inbounds i8* %dn.addr.0.i.i18.i, i64 1, !dbg !474
  %cmp2.i.i22.i = icmp sgt i8 %15, 32, !dbg !475
  %cmp4.i.i23.i = icmp ne i8 %15, 127, !dbg !475
  %or.cond.i.i24.i = and i1 %cmp2.i.i22.i, %cmp4.i.i23.i, !dbg !475
  br i1 %or.cond.i.i24.i, label %while.cond.i.i20.i, label %if.then111.i, !dbg !475

sw.bb5.i.i:                                       ; preds = %do.end107.i, %do.end107.i, %do.end107.i
  %16 = load i8* %call, align 1, !dbg !476, !tbaa !283
  %cmp128.i.i.i = icmp eq i8 %16, 0, !dbg !478
  br i1 %cmp128.i.i.i, label %if.end115.i, label %while.body.i12.i.i, !dbg !478

while.body.i12.i.i:                               ; preds = %if.else51.i.i.i, %while.cond.backedge.i.i.i, %sw.bb5.i.i
  %dn.pn.i.i.i = phi i8* [ %call, %sw.bb5.i.i ], [ %dn.addr.0132.i.i.i, %while.cond.backedge.i.i.i ], [ %dn.addr.0132.i.i.i, %if.else51.i.i.i ]
  %ch.0131.in.i.i.i = phi i8 [ %16, %sw.bb5.i.i ], [ %17, %while.cond.backedge.i.i.i ], [ %17, %if.else51.i.i.i ]
  %pch.0129.i.i.i = phi i32 [ 46, %sw.bb5.i.i ], [ %ch.0131.i.i.i, %while.cond.backedge.i.i.i ], [ %ch.0131.i.i.i, %if.else51.i.i.i ]
  %ch.0131.i.i.i = sext i8 %ch.0131.in.i.i.i to i32, !dbg !476
  %dn.addr.0132.i.i.i = getelementptr inbounds i8* %dn.pn.i.i.i, i64 1, !dbg !476
  %17 = load i8* %dn.addr.0132.i.i.i, align 1, !dbg !479, !tbaa !283
  %cmp4.i11.i.i = icmp eq i8 %ch.0131.in.i.i.i, 46, !dbg !480
  br i1 %cmp4.i11.i.i, label %while.cond.backedge.i.i.i, label %if.else.i.i.i, !dbg !480

if.else.i.i.i:                                    ; preds = %while.body.i12.i.i
  %cmp6.i.i.i = icmp eq i32 %pch.0129.i.i.i, 46, !dbg !481
  %ch.0.in.off114.i.i.i = add i8 %ch.0131.in.i.i.i, -65, !dbg !482
  %18 = icmp ult i8 %ch.0.in.off114.i.i.i, 26, !dbg !482
  br i1 %cmp6.i.i.i, label %if.then8.i.i.i, label %if.else25.i.i.i, !dbg !481

if.then8.i.i.i:                                   ; preds = %if.else.i.i.i
  %ch.0.in.off115.i.i.i = add i8 %ch.0131.in.i.i.i, -97, !dbg !482
  %19 = icmp ult i8 %ch.0.in.off115.i.i.i, 26, !dbg !482
  %or.cond.i13.i.i = or i1 %18, %19, !dbg !482
  %ch.0.in.off116.i.i.i = add i8 %ch.0131.in.i.i.i, -48, !dbg !482
  %20 = icmp ult i8 %ch.0.in.off116.i.i.i, 10, !dbg !482
  %or.cond119.i.i.i = or i1 %or.cond.i13.i.i, %20, !dbg !482
  br i1 %or.cond119.i.i.i, label %while.cond.backedge.i.i.i, label %if.then111.i, !dbg !482

while.cond.backedge.i.i.i:                        ; preds = %lor.lhs.false63.i.i.i, %if.then31.i.i.i, %if.then8.i.i.i, %while.body.i12.i.i
  %cmp.i14.i.i = icmp eq i8 %17, 0, !dbg !478
  br i1 %cmp.i14.i.i, label %if.end115.i, label %while.body.i12.i.i, !dbg !478

if.else25.i.i.i:                                  ; preds = %if.else.i.i.i
  switch i8 %17, label %if.else51.i.i.i [
    i8 46, label %if.then31.i.i.i
    i8 0, label %if.then31.i.i.i
  ], !dbg !483

if.then31.i.i.i:                                  ; preds = %if.else25.i.i.i, %if.else25.i.i.i
  %ch.0.in.off112.i.i.i = add i8 %ch.0131.in.i.i.i, -97, !dbg !484
  %21 = icmp ult i8 %ch.0.in.off112.i.i.i, 26, !dbg !484
  %or.cond121.i.i.i = or i1 %18, %21, !dbg !484
  %ch.0.in.off113.i.i.i = add i8 %ch.0131.in.i.i.i, -48, !dbg !484
  %22 = icmp ult i8 %ch.0.in.off113.i.i.i, 10, !dbg !484
  %or.cond123.i.i.i = or i1 %or.cond121.i.i.i, %22, !dbg !484
  br i1 %or.cond123.i.i.i, label %while.cond.backedge.i.i.i, label %if.then111.i, !dbg !484

if.else51.i.i.i:                                  ; preds = %if.else25.i.i.i
  %ch.0.in.off110.i.i.i = add i8 %ch.0131.in.i.i.i, -97, !dbg !485
  %23 = icmp ult i8 %ch.0.in.off110.i.i.i, 26, !dbg !485
  %or.cond125.i.i.i = or i1 %18, %23, !dbg !485
  br i1 %or.cond125.i.i.i, label %while.body.i12.i.i, label %lor.lhs.false63.i.i.i, !dbg !485

lor.lhs.false63.i.i.i:                            ; preds = %if.else51.i.i.i
  %ch.0.in.off111.i.i.i = add i8 %ch.0131.in.i.i.i, -48, !dbg !485
  %24 = icmp ult i8 %ch.0.in.off111.i.i.i, 10, !dbg !485
  %cmp70.i.i.i = icmp eq i8 %ch.0131.in.i.i.i, 45, !dbg !485
  %or.cond86.i.i.i = or i1 %24, %cmp70.i.i.i, !dbg !485
  br i1 %or.cond86.i.i.i, label %while.cond.backedge.i.i.i, label %if.then111.i, !dbg !485

sw.default.i.i:                                   ; preds = %do.end107.i, %do.end107.i
  %call7.i.i = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([35 x i8]* @.str7, i64 0, i64 0), i32 2) #6, !dbg !486
  br label %if.then111.i, !dbg !487

if.then111.i:                                     ; preds = %sw.default.i.i, %lor.lhs.false63.i.i.i, %if.then31.i.i.i, %if.then8.i.i.i, %while.body.i.i25.i
  %25 = bitcast i8* %call1 to i96*, !dbg !488
  %bf.load112.i = load i96* %25, align 4, !dbg !488
  %bf.clear113.i = and i96 %bf.load112.i, -251658241, !dbg !488
  %bf.set114.i = or i96 %bf.clear113.i, 83886080, !dbg !488
  store i96 %bf.set114.i, i96* %25, align 4, !dbg !488
  br label %rrextract.exit, !dbg !490

if.end115.i:                                      ; preds = %while.cond.backedge.i.i.i, %sw.bb5.i.i, %while.cond.i.i20.i, %sw.bb.i17.i
  %call116.i = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([45 x i8]* @.str30, i64 0, i64 0), i8* %call, i32 %or.i, i32 %or38.i, i32 %ttl.0.i) #6, !dbg !491
  switch i32 %or.i, label %sw.default.i [
    i32 1, label %sw.bb.i
    i32 35, label %sw.bb124.i
    i32 15, label %sw.bb126.i
    i32 18, label %sw.bb126.i
    i32 21, label %sw.bb126.i
    i32 33, label %sw.bb126.i
    i32 26, label %sw.bb128.i
    i32 30, label %sw.bb130.i
  ], !dbg !492

sw.bb.i:                                          ; preds = %if.end115.i
  %cmp117.i = icmp eq i32 %or88.i, 4, !dbg !493
  br i1 %cmp117.i, label %sw.epilog.i, label %if.then119.i, !dbg !493

if.then119.i:                                     ; preds = %sw.bb.i
  %26 = bitcast i8* %call1 to i96*, !dbg !496
  %bf.load120.i = load i96* %26, align 4, !dbg !496
  %bf.clear121.i = and i96 %bf.load120.i, -251658241, !dbg !496
  %bf.set122.i = or i96 %bf.clear121.i, 16777216, !dbg !496
  store i96 %bf.set122.i, i96* %26, align 4, !dbg !496
  br label %rrextract.exit, !dbg !498

sw.bb124.i:                                       ; preds = %if.end115.i
  %puts14.i = call i32 @puts(i8* getelementptr inbounds ([29 x i8]* @str50, i64 0, i64 0)) #6, !dbg !499
  br label %sw.epilog.i, !dbg !500

sw.bb126.i:                                       ; preds = %if.end115.i, %if.end115.i, %if.end115.i, %if.end115.i
  %puts13.i = call i32 @puts(i8* getelementptr inbounds ([27 x i8]* @str49, i64 0, i64 0)) #6, !dbg !501
  br label %sw.epilog.i, !dbg !502

sw.bb128.i:                                       ; preds = %if.end115.i
  %puts12.i = call i32 @puts(i8* getelementptr inbounds ([26 x i8]* @str48, i64 0, i64 0)) #6, !dbg !503
  br label %sw.epilog.i, !dbg !504

sw.bb130.i:                                       ; preds = %if.end115.i
  %call131.i = call i32 @__dn_expand(i8* %call1, i8* %add.ptr.i, i8* %add.ptr92.i, i8* %0, i32 4140) #6, !dbg !505
  %call132.i = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str34, i64 0, i64 0), i32 %call131.i) #6, !dbg !506
  %cmp133.i = icmp slt i32 %call131.i, 0, !dbg !507
  br i1 %cmp133.i, label %if.then135.i, label %if.end140.i, !dbg !507

if.then135.i:                                     ; preds = %sw.bb130.i
  %puts11.i = call i32 @puts(i8* getelementptr inbounds ([6 x i8]* @str47, i64 0, i64 0)) #6, !dbg !509
  %27 = bitcast i8* %call1 to i96*, !dbg !511
  %bf.load137.i = load i96* %27, align 4, !dbg !511
  %bf.clear138.i = and i96 %bf.load137.i, -251658241, !dbg !511
  %bf.set139.i = or i96 %bf.clear138.i, 16777216, !dbg !511
  store i96 %bf.set139.i, i96* %27, align 4, !dbg !511
  br label %rrextract.exit, !dbg !512

if.end140.i:                                      ; preds = %sw.bb130.i
  %cmp4.i.i = icmp eq i32 %or38.i, 1, !dbg !513
  br i1 %cmp4.i.i, label %while.cond.i.i.i, label %if.end149.i, !dbg !513

while.cond.i.i.i:                                 ; preds = %while.body.i.i.i, %if.end140.i
  %dn.addr.0.i.i.i = phi i8* [ %incdec.ptr.i.i.i, %while.body.i.i.i ], [ %0, %if.end140.i ]
  %28 = load i8* %dn.addr.0.i.i.i, align 1, !dbg !516, !tbaa !283
  %cmp.i.i.i = icmp eq i8 %28, 0, !dbg !516
  br i1 %cmp.i.i.i, label %if.end149.i, label %while.body.i.i.i, !dbg !516

while.body.i.i.i:                                 ; preds = %while.cond.i.i.i
  %incdec.ptr.i.i.i = getelementptr inbounds i8* %dn.addr.0.i.i.i, i64 1, !dbg !516
  %cmp2.i.i.i = icmp sgt i8 %28, 32, !dbg !517
  %cmp4.i.i.i = icmp ne i8 %28, 127, !dbg !517
  %or.cond.i.i.i = and i1 %cmp2.i.i.i, %cmp4.i.i.i, !dbg !517
  br i1 %or.cond.i.i.i, label %while.cond.i.i.i, label %if.then144.i, !dbg !517

if.then144.i:                                     ; preds = %while.body.i.i.i
  %puts9.i = call i32 @puts(i8* getelementptr inbounds ([13 x i8]* @str46, i64 0, i64 0)) #6, !dbg !518
  %29 = bitcast i8* %call1 to i96*, !dbg !520
  %bf.load146.i = load i96* %29, align 4, !dbg !520
  %bf.clear147.i = and i96 %bf.load146.i, -251658241, !dbg !520
  %bf.set148.i = or i96 %bf.clear147.i, 16777216, !dbg !520
  store i96 %bf.set148.i, i96* %29, align 4, !dbg !520
  br label %rrextract.exit, !dbg !521

if.end149.i:                                      ; preds = %while.cond.i.i.i, %if.end140.i
  %idx.ext150.i = sext i32 %call131.i to i64, !dbg !522
  %add.ptr92.sum10.i = add i64 %idx.ext150.i, %add.ptr.sum17, !dbg !522
  %add.ptr.sum24 = add i64 %add.ptr92.sum10.i, 12, !dbg !522
  %add.ptr151.i = getelementptr inbounds i8* %call1, i64 %add.ptr.sum24, !dbg !522
  %call154.i = call i64 @strlen(i8* %0) #9, !dbg !523
  %add.ptr155.sum.i = add i64 %call154.i, 1, !dbg !523
  %add.ptr156.i = getelementptr inbounds [4140 x i8]* %data.i, i64 0, i64 %add.ptr155.sum.i, !dbg !523
  %sub157.i = sub i32 %or88.i, %call131.i, !dbg !524
  %call158.i = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([50 x i8]* @.str37, i64 0, i64 0), i32 %sub157.i) #6, !dbg !524
  %conv160.i = zext i32 %sub157.i to i64, !dbg !525
  %30 = call i8* @memcpy(i8* %add.ptr156.i, i8* %add.ptr151.i, i64 %conv160.i)
  %add.ptr151.sum.i = add i64 %conv160.i, 12, !dbg !526
  %add.ptr.sum25 = add i64 %add.ptr151.sum.i, %add.ptr92.sum10.i, !dbg !526
  %add.ptr163.i = getelementptr inbounds i8* %call1, i64 %add.ptr.sum25, !dbg !526
  %add.ptr166.offs.i = add i64 %add.ptr155.sum.i, %conv160.i, !dbg !527
  %conv168.i = trunc i64 %add.ptr166.offs.i to i32, !dbg !527
  br label %sw.epilog.i, !dbg !528

sw.default.i:                                     ; preds = %if.end115.i
  %call170.i = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([16 x i8]* @.str38, i64 0, i64 0), i32 %or.i) #6, !dbg !529
  %add.ptr92.offs.i = add i32 %call2.i, 20, !dbg !530
  %add175.i = add i32 %add.ptr92.offs.i, %or88.i, !dbg !530
  br label %rrextract.exit, !dbg !530

sw.epilog.i:                                      ; preds = %if.end149.i, %sw.bb128.i, %sw.bb126.i, %sw.bb124.i, %sw.bb.i
  %n.0.i = phi i32 [ %conv168.i, %if.end149.i ], [ %call2.i, %sw.bb128.i ], [ %call2.i, %sw.bb126.i ], [ %call2.i, %sw.bb124.i ], [ %call2.i, %sw.bb.i ]
  %cp.0.i = phi i8* [ %add.ptr163.i, %if.end149.i ], [ %add.ptr92.i, %sw.bb128.i ], [ %add.ptr92.i, %sw.bb126.i ], [ %add.ptr92.i, %sw.bb124.i ], [ %add.ptr92.i, %sw.bb.i ]
  %cmp177.i = icmp ugt i8* %cp.0.i, %add.ptr.i, !dbg !531
  br i1 %cmp177.i, label %if.then179.i, label %if.end183.i, !dbg !531

if.then179.i:                                     ; preds = %sw.epilog.i
  %31 = bitcast i8* %call1 to i96*, !dbg !533
  %bf.load180.i = load i96* %31, align 4, !dbg !533
  %bf.clear181.i = and i96 %bf.load180.i, -251658241, !dbg !533
  %bf.set182.i = or i96 %bf.clear181.i, 16777216, !dbg !533
  store i96 %bf.set182.i, i96* %31, align 4, !dbg !533
  br label %rrextract.exit, !dbg !535

if.end183.i:                                      ; preds = %sw.epilog.i
  %sub.ptr.lhs.cast184.i = ptrtoint i8* %cp.0.i to i64, !dbg !536
  %sub.ptr.rhs.cast185.i = ptrtoint i8* %add.ptr92.i to i64, !dbg !536
  %sub.ptr.sub186.i = sub i64 %sub.ptr.lhs.cast184.i, %sub.ptr.rhs.cast185.i, !dbg !536
  %conv187.i = trunc i64 %sub.ptr.sub186.i to i32, !dbg !536
  %cmp188.i = icmp eq i32 %conv187.i, %or88.i, !dbg !536
  br i1 %cmp188.i, label %if.end199.i, label %if.then190.i, !dbg !536

if.then190.i:                                     ; preds = %if.end183.i
  %call195.i = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([53 x i8]* @.str39, i64 0, i64 0), i32 %or88.i, i32 %conv187.i) #6, !dbg !538
  %32 = bitcast i8* %call1 to i96*, !dbg !540
  %bf.load196.i = load i96* %32, align 4, !dbg !540
  %bf.clear197.i = and i96 %bf.load196.i, -251658241, !dbg !540
  %bf.set198.i = or i96 %bf.clear197.i, 16777216, !dbg !540
  store i96 %bf.set198.i, i96* %32, align 4, !dbg !540
  br label %rrextract.exit, !dbg !541

if.end199.i:                                      ; preds = %if.end183.i
  %cmp200.i = icmp sgt i32 %n.0.i, 2070, !dbg !542
  br i1 %cmp200.i, label %if.then202.i, label %if.end207.i, !dbg !542

if.then202.i:                                     ; preds = %if.end199.i
  %call203.i = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([42 x i8]* @.str40, i64 0, i64 0), i32 %or.i, i32 %n.0.i) #6, !dbg !544
  %33 = bitcast i8* %call1 to i96*, !dbg !546
  %bf.load204.i = load i96* %33, align 4, !dbg !546
  %bf.clear205.i = and i96 %bf.load204.i, -251658241, !dbg !546
  %bf.set206.i = or i96 %bf.clear205.i, 16777216, !dbg !546
  store i96 %bf.set206.i, i96* %33, align 4, !dbg !546
  br label %rrextract.exit, !dbg !547

if.end207.i:                                      ; preds = %if.end199.i
  %sub.ptr.rhs.cast209.i = ptrtoint i8* %add.ptr to i64, !dbg !548
  %sub.ptr.sub210.i = sub i64 %sub.ptr.lhs.cast184.i, %sub.ptr.rhs.cast209.i, !dbg !548
  %conv211.i = trunc i64 %sub.ptr.sub210.i to i32, !dbg !548
  br label %rrextract.exit, !dbg !548

rrextract.exit:                                   ; preds = %if.end207.i, %if.then202.i, %if.then190.i, %if.then179.i, %sw.default.i, %if.then144.i, %if.then135.i, %if.then119.i, %if.then111.i, %if.then101.i, %if.then46.i, %if.then12.i, %if.then.i
  %retval.0.i = phi i32 [ -1, %if.then.i ], [ -1, %if.then12.i ], [ -1, %if.then46.i ], [ -1, %if.then101.i ], [ %add175.i, %sw.default.i ], [ -1, %if.then135.i ], [ -1, %if.then179.i ], [ -1, %if.then190.i ], [ -1, %if.then202.i ], [ %conv211.i, %if.end207.i ], [ -1, %if.then144.i ], [ -1, %if.then119.i ], [ -1, %if.then111.i ]
  %call8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str19, i64 0, i64 0), i32 %retval.0.i) #6, !dbg !549
  ret i32 0, !dbg !550
}

; Function Attrs: nounwind
declare i32 @__res_init() #3

; Function Attrs: nounwind
declare i32 @__dn_expand(i8*, i8*, i8*, i8*, i32) #3

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #6

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) #6

declare i8* @memcpy(i8*, i8*, i64)

attributes #0 = { nounwind readonly uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readnone "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind readonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!279, !280}
!llvm.ident = !{!281}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !2, metadata !51, metadata !52, metadata !274, metadata !51, metadata !""} ; [ DW_TAG_compile_unit ] [/home/czuo/locabug/tests/nxt-bad.c] [DW_LANG_C99]
!1 = metadata !{metadata !"nxt-bad.c", metadata !"/home/czuo/locabug/tests"}
!2 = metadata !{metadata !3, metadata !9, metadata !16, metadata !22, metadata !33}
!3 = metadata !{i32 786436, metadata !1, null, metadata !"context", i32 163, i64 32, i64 32, i32 0, i32 0, null, metadata !4, i32 0, null, null, null} ; [ DW_TAG_enumeration_type ] [context] [line 163, size 32, align 32, offset 0] [def] [from ]
!4 = metadata !{metadata !5, metadata !6, metadata !7, metadata !8}
!5 = metadata !{i32 786472, metadata !"domain_ctx", i64 0} ; [ DW_TAG_enumerator ] [domain_ctx :: 0]
!6 = metadata !{i32 786472, metadata !"owner_ctx", i64 1} ; [ DW_TAG_enumerator ] [owner_ctx :: 1]
!7 = metadata !{i32 786472, metadata !"mailname_ctx", i64 2} ; [ DW_TAG_enumerator ] [mailname_ctx :: 2]
!8 = metadata !{i32 786472, metadata !"hostname_ctx", i64 3} ; [ DW_TAG_enumerator ] [hostname_ctx :: 3]
!9 = metadata !{i32 786436, metadata !1, null, metadata !"transport", i32 154, i64 32, i64 32, i32 0, i32 0, null, metadata !10, i32 0, null, null, null} ; [ DW_TAG_enumeration_type ] [transport] [line 154, size 32, align 32, offset 0] [def] [from ]
!10 = metadata !{metadata !11, metadata !12, metadata !13, metadata !14, metadata !15}
!11 = metadata !{i32 786472, metadata !"primary_trans", i64 0} ; [ DW_TAG_enumerator ] [primary_trans :: 0]
!12 = metadata !{i32 786472, metadata !"secondary_trans", i64 1} ; [ DW_TAG_enumerator ] [secondary_trans :: 1]
!13 = metadata !{i32 786472, metadata !"response_trans", i64 2} ; [ DW_TAG_enumerator ] [response_trans :: 2]
!14 = metadata !{i32 786472, metadata !"update_trans", i64 3} ; [ DW_TAG_enumerator ] [update_trans :: 3]
!15 = metadata !{i32 786472, metadata !"num_trans", i64 4} ; [ DW_TAG_enumerator ] [num_trans :: 4]
!16 = metadata !{i32 786436, metadata !1, null, metadata !"severity", i32 93, i64 32, i64 32, i32 0, i32 0, null, metadata !17, i32 0, null, null, null} ; [ DW_TAG_enumeration_type ] [severity] [line 93, size 32, align 32, offset 0] [def] [from ]
!17 = metadata !{metadata !18, metadata !19, metadata !20, metadata !21}
!18 = metadata !{i32 786472, metadata !"ignore", i64 0} ; [ DW_TAG_enumerator ] [ignore :: 0]
!19 = metadata !{i32 786472, metadata !"warn", i64 1} ; [ DW_TAG_enumerator ] [warn :: 1]
!20 = metadata !{i32 786472, metadata !"fail", i64 2} ; [ DW_TAG_enumerator ] [fail :: 2]
!21 = metadata !{i32 786472, metadata !"not_set", i64 3} ; [ DW_TAG_enumerator ] [not_set :: 3]
!22 = metadata !{i32 786436, metadata !23, null, metadata !"__ns_class", i32 321, i64 32, i64 32, i32 0, i32 0, null, metadata !24, i32 0, null, null, null} ; [ DW_TAG_enumeration_type ] [__ns_class] [line 321, size 32, align 32, offset 0] [def] [from ]
!23 = metadata !{metadata !"/usr/include/arpa/nameser.h", metadata !"/home/czuo/locabug/tests"}
!24 = metadata !{metadata !25, metadata !26, metadata !27, metadata !28, metadata !29, metadata !30, metadata !31, metadata !32}
!25 = metadata !{i32 786472, metadata !"ns_c_invalid", i64 0} ; [ DW_TAG_enumerator ] [ns_c_invalid :: 0]
!26 = metadata !{i32 786472, metadata !"ns_c_in", i64 1} ; [ DW_TAG_enumerator ] [ns_c_in :: 1]
!27 = metadata !{i32 786472, metadata !"ns_c_2", i64 2} ; [ DW_TAG_enumerator ] [ns_c_2 :: 2]
!28 = metadata !{i32 786472, metadata !"ns_c_chaos", i64 3} ; [ DW_TAG_enumerator ] [ns_c_chaos :: 3]
!29 = metadata !{i32 786472, metadata !"ns_c_hs", i64 4} ; [ DW_TAG_enumerator ] [ns_c_hs :: 4]
!30 = metadata !{i32 786472, metadata !"ns_c_none", i64 254} ; [ DW_TAG_enumerator ] [ns_c_none :: 254]
!31 = metadata !{i32 786472, metadata !"ns_c_any", i64 255} ; [ DW_TAG_enumerator ] [ns_c_any :: 255]
!32 = metadata !{i32 786472, metadata !"ns_c_max", i64 65536} ; [ DW_TAG_enumerator ] [ns_c_max :: 65536]
!33 = metadata !{i32 786436, metadata !23, null, metadata !"__ns_rcode", i32 190, i64 32, i64 32, i32 0, i32 0, null, metadata !34, i32 0, null, null, null} ; [ DW_TAG_enumeration_type ] [__ns_rcode] [line 190, size 32, align 32, offset 0] [def] [from ]
!34 = metadata !{metadata !35, metadata !36, metadata !37, metadata !38, metadata !39, metadata !40, metadata !41, metadata !42, metadata !43, metadata !44, metadata !45, metadata !46, metadata !47, metadata !48, metadata !49, metadata !50}
!35 = metadata !{i32 786472, metadata !"ns_r_noerror", i64 0} ; [ DW_TAG_enumerator ] [ns_r_noerror :: 0]
!36 = metadata !{i32 786472, metadata !"ns_r_formerr", i64 1} ; [ DW_TAG_enumerator ] [ns_r_formerr :: 1]
!37 = metadata !{i32 786472, metadata !"ns_r_servfail", i64 2} ; [ DW_TAG_enumerator ] [ns_r_servfail :: 2]
!38 = metadata !{i32 786472, metadata !"ns_r_nxdomain", i64 3} ; [ DW_TAG_enumerator ] [ns_r_nxdomain :: 3]
!39 = metadata !{i32 786472, metadata !"ns_r_notimpl", i64 4} ; [ DW_TAG_enumerator ] [ns_r_notimpl :: 4]
!40 = metadata !{i32 786472, metadata !"ns_r_refused", i64 5} ; [ DW_TAG_enumerator ] [ns_r_refused :: 5]
!41 = metadata !{i32 786472, metadata !"ns_r_yxdomain", i64 6} ; [ DW_TAG_enumerator ] [ns_r_yxdomain :: 6]
!42 = metadata !{i32 786472, metadata !"ns_r_yxrrset", i64 7} ; [ DW_TAG_enumerator ] [ns_r_yxrrset :: 7]
!43 = metadata !{i32 786472, metadata !"ns_r_nxrrset", i64 8} ; [ DW_TAG_enumerator ] [ns_r_nxrrset :: 8]
!44 = metadata !{i32 786472, metadata !"ns_r_notauth", i64 9} ; [ DW_TAG_enumerator ] [ns_r_notauth :: 9]
!45 = metadata !{i32 786472, metadata !"ns_r_notzone", i64 10} ; [ DW_TAG_enumerator ] [ns_r_notzone :: 10]
!46 = metadata !{i32 786472, metadata !"ns_r_max", i64 11} ; [ DW_TAG_enumerator ] [ns_r_max :: 11]
!47 = metadata !{i32 786472, metadata !"ns_r_badvers", i64 16} ; [ DW_TAG_enumerator ] [ns_r_badvers :: 16]
!48 = metadata !{i32 786472, metadata !"ns_r_badsig", i64 16} ; [ DW_TAG_enumerator ] [ns_r_badsig :: 16]
!49 = metadata !{i32 786472, metadata !"ns_r_badkey", i64 17} ; [ DW_TAG_enumerator ] [ns_r_badkey :: 17]
!50 = metadata !{i32 786472, metadata !"ns_r_badtime", i64 18} ; [ DW_TAG_enumerator ] [ns_r_badtime :: 18]
!51 = metadata !{i32 0}
!52 = metadata !{metadata !53, metadata !64, metadata !72, metadata !79, metadata !99, metadata !162, metadata !211, metadata !220}
!53 = metadata !{i32 786478, metadata !1, metadata !54, metadata !"__res_dnok", metadata !"__res_dnok", metadata !"", i32 200, metadata !55, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @__res_dnok, null, null, metadata !61, i32 200} ; [ DW_TAG_subprogram ] [line 200] [def] [__res_dnok]
!54 = metadata !{i32 786473, metadata !1}         ; [ DW_TAG_file_type ] [/home/czuo/locabug/tests/nxt-bad.c]
!55 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !56, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!56 = metadata !{metadata !57, metadata !58}
!57 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!58 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !59} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!59 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !60} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!60 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!61 = metadata !{metadata !62, metadata !63}
!62 = metadata !{i32 786689, metadata !53, metadata !"dn", metadata !54, i32 16777416, metadata !58, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dn] [line 200]
!63 = metadata !{i32 786688, metadata !53, metadata !"ch", metadata !54, i32 201, metadata !57, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ch] [line 201]
!64 = metadata !{i32 786478, metadata !1, metadata !54, metadata !"__res_hnok", metadata !"__res_hnok", metadata !"", i32 210, metadata !55, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @__res_hnok, null, null, metadata !65, i32 210} ; [ DW_TAG_subprogram ] [line 210] [def] [__res_hnok]
!65 = metadata !{metadata !66, metadata !67, metadata !68, metadata !69, metadata !70}
!66 = metadata !{i32 786689, metadata !64, metadata !"dn", metadata !54, i32 16777426, metadata !58, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dn] [line 210]
!67 = metadata !{i32 786688, metadata !64, metadata !"ppch", metadata !54, i32 211, metadata !57, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ppch] [line 211]
!68 = metadata !{i32 786688, metadata !64, metadata !"pch", metadata !54, i32 211, metadata !57, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [pch] [line 211]
!69 = metadata !{i32 786688, metadata !64, metadata !"ch", metadata !54, i32 211, metadata !57, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ch] [line 211]
!70 = metadata !{i32 786688, metadata !71, metadata !"nch", metadata !54, i32 214, metadata !57, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [nch] [line 214]
!71 = metadata !{i32 786443, metadata !1, metadata !64, i32 213, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/czuo/locabug/tests/nxt-bad.c]
!72 = metadata !{i32 786478, metadata !1, metadata !54, metadata !"ns_ownercontext", metadata !"ns_ownercontext", metadata !"", i32 235, metadata !73, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 true, i32 (i32, i32)* @ns_ownercontext, null, null, metadata !75, i32 238} ; [ DW_TAG_subprogram ] [line 235] [def] [scope 238] [ns_ownercontext]
!73 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !74, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!74 = metadata !{metadata !3, metadata !57, metadata !9}
!75 = metadata !{metadata !76, metadata !77, metadata !78}
!76 = metadata !{i32 786689, metadata !72, metadata !"type", metadata !54, i32 16777452, metadata !57, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [type] [line 236]
!77 = metadata !{i32 786689, metadata !72, metadata !"transport", metadata !54, i32 33554669, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [transport] [line 237]
!78 = metadata !{i32 786688, metadata !72, metadata !"context", metadata !54, i32 239, metadata !3, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [context] [line 239]
!79 = metadata !{i32 786478, metadata !1, metadata !54, metadata !"newstr", metadata !"newstr", metadata !"", i32 279, metadata !80, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i64, i32)* @newstr, null, null, metadata !85, i32 279} ; [ DW_TAG_subprogram ] [line 279] [def] [newstr]
!80 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !81, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!81 = metadata !{metadata !82, metadata !83, metadata !57}
!82 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !60} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!83 = metadata !{i32 786454, metadata !1, null, metadata !"size_t", i32 42, i64 0, i64 0, i64 0, i32 0, metadata !84} ; [ DW_TAG_typedef ] [size_t] [line 42, size 0, align 0, offset 0] [from long unsigned int]
!84 = metadata !{i32 786468, null, null, metadata !"long unsigned int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!85 = metadata !{metadata !86, metadata !87, metadata !88, metadata !93, metadata !94, metadata !98}
!86 = metadata !{i32 786689, metadata !79, metadata !"len", metadata !54, i32 16777495, metadata !83, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [len] [line 279]
!87 = metadata !{i32 786689, metadata !79, metadata !"needpanic", metadata !54, i32 33554711, metadata !57, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [needpanic] [line 279]
!88 = metadata !{i32 786688, metadata !79, metadata !"buf", metadata !54, i32 280, metadata !89, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [buf] [line 280]
!89 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !90} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from u_char]
!90 = metadata !{i32 786454, metadata !1, null, metadata !"u_char", i32 34, i64 0, i64 0, i64 0, i32 0, metadata !91} ; [ DW_TAG_typedef ] [u_char] [line 34, size 0, align 0, offset 0] [from __u_char]
!91 = metadata !{i32 786454, metadata !1, null, metadata !"__u_char", i32 31, i64 0, i64 0, i64 0, i32 0, metadata !92} ; [ DW_TAG_typedef ] [__u_char] [line 31, size 0, align 0, offset 0] [from unsigned char]
!92 = metadata !{i32 786468, null, null, metadata !"unsigned char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 8} ; [ DW_TAG_base_type ] [unsigned char] [line 0, size 8, align 8, offset 0, enc DW_ATE_unsigned_char]
!93 = metadata !{i32 786688, metadata !79, metadata !"bp", metadata !54, i32 280, metadata !89, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [bp] [line 280]
!94 = metadata !{i32 786688, metadata !95, metadata !"t_s", metadata !54, i32 292, metadata !96, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [t_s] [line 292]
!95 = metadata !{i32 786443, metadata !1, metadata !79, i32 292, i32 0, i32 17} ; [ DW_TAG_lexical_block ] [/home/czuo/locabug/tests/nxt-bad.c]
!96 = metadata !{i32 786454, metadata !1, null, metadata !"u_int16_t", i32 202, i64 0, i64 0, i64 0, i32 0, metadata !97} ; [ DW_TAG_typedef ] [u_int16_t] [line 202, size 0, align 0, offset 0] [from unsigned short]
!97 = metadata !{i32 786468, null, null, metadata !"unsigned short", i32 0, i64 16, i64 16, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [unsigned short] [line 0, size 16, align 16, offset 0, enc DW_ATE_unsigned]
!98 = metadata !{i32 786688, metadata !95, metadata !"t_cp", metadata !54, i32 292, metadata !89, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [t_cp] [line 292]
!99 = metadata !{i32 786478, metadata !1, metadata !54, metadata !"ns_nameok", metadata !"ns_nameok", metadata !"", i32 300, metadata !100, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, %struct.zoneinfo*, i32, i32, i8*)* @ns_nameok, null, null, metadata !153, i32 304} ; [ DW_TAG_subprogram ] [line 300] [def] [scope 304] [ns_nameok]
!100 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !101, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!101 = metadata !{metadata !57, metadata !58, metadata !57, metadata !102, metadata !9, metadata !3, metadata !58}
!102 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !103} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from zoneinfo]
!103 = metadata !{i32 786451, metadata !1, null, metadata !"zoneinfo", i32 102, i64 1728, i64 64, i32 0, i32 0, null, metadata !104, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [zoneinfo] [line 102, size 1728, align 64, offset 0] [def] [from ]
!104 = metadata !{metadata !105, metadata !106, metadata !110, metadata !111, metadata !114, metadata !115, metadata !116, metadata !117, metadata !118, metadata !119, metadata !120, metadata !127, metadata !128, metadata !132, metadata !133, metadata !134, metadata !135, metadata !138, metadata !141, metadata !142, metadata !143, metadata !144, metadata !145, metadata !147, metadata !148, metadata !149, metadata !150, metadata !151, metadata !152}
!105 = metadata !{i32 786445, metadata !1, metadata !103, metadata !"z_origin", i32 103, i64 64, i64 64, i64 0, i32 0, metadata !82} ; [ DW_TAG_member ] [z_origin] [line 103, size 64, align 64, offset 0] [from ]
!106 = metadata !{i32 786445, metadata !1, metadata !103, metadata !"z_time", i32 104, i64 64, i64 64, i64 64, i32 0, metadata !107} ; [ DW_TAG_member ] [z_time] [line 104, size 64, align 64, offset 64] [from time_t]
!107 = metadata !{i32 786454, metadata !1, null, metadata !"time_t", i32 76, i64 0, i64 0, i64 0, i32 0, metadata !108} ; [ DW_TAG_typedef ] [time_t] [line 76, size 0, align 0, offset 0] [from __time_t]
!108 = metadata !{i32 786454, metadata !1, null, metadata !"__time_t", i32 149, i64 0, i64 0, i64 0, i32 0, metadata !109} ; [ DW_TAG_typedef ] [__time_t] [line 149, size 0, align 0, offset 0] [from long int]
!109 = metadata !{i32 786468, null, null, metadata !"long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!110 = metadata !{i32 786445, metadata !1, metadata !103, metadata !"z_lastupdate", i32 105, i64 64, i64 64, i64 128, i32 0, metadata !107} ; [ DW_TAG_member ] [z_lastupdate] [line 105, size 64, align 64, offset 128] [from time_t]
!111 = metadata !{i32 786445, metadata !1, metadata !103, metadata !"z_refresh", i32 106, i64 32, i64 32, i64 192, i32 0, metadata !112} ; [ DW_TAG_member ] [z_refresh] [line 106, size 32, align 32, offset 192] [from u_int32_t]
!112 = metadata !{i32 786454, metadata !1, null, metadata !"u_int32_t", i32 203, i64 0, i64 0, i64 0, i32 0, metadata !113} ; [ DW_TAG_typedef ] [u_int32_t] [line 203, size 0, align 0, offset 0] [from unsigned int]
!113 = metadata !{i32 786468, null, null, metadata !"unsigned int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!114 = metadata !{i32 786445, metadata !1, metadata !103, metadata !"z_retry", i32 107, i64 32, i64 32, i64 224, i32 0, metadata !112} ; [ DW_TAG_member ] [z_retry] [line 107, size 32, align 32, offset 224] [from u_int32_t]
!115 = metadata !{i32 786445, metadata !1, metadata !103, metadata !"z_expire", i32 108, i64 32, i64 32, i64 256, i32 0, metadata !112} ; [ DW_TAG_member ] [z_expire] [line 108, size 32, align 32, offset 256] [from u_int32_t]
!116 = metadata !{i32 786445, metadata !1, metadata !103, metadata !"z_minimum", i32 109, i64 32, i64 32, i64 288, i32 0, metadata !112} ; [ DW_TAG_member ] [z_minimum] [line 109, size 32, align 32, offset 288] [from u_int32_t]
!117 = metadata !{i32 786445, metadata !1, metadata !103, metadata !"z_serial", i32 110, i64 32, i64 32, i64 320, i32 0, metadata !112} ; [ DW_TAG_member ] [z_serial] [line 110, size 32, align 32, offset 320] [from u_int32_t]
!118 = metadata !{i32 786445, metadata !1, metadata !103, metadata !"z_source", i32 111, i64 64, i64 64, i64 384, i32 0, metadata !82} ; [ DW_TAG_member ] [z_source] [line 111, size 64, align 64, offset 384] [from ]
!119 = metadata !{i32 786445, metadata !1, metadata !103, metadata !"z_ftime", i32 112, i64 64, i64 64, i64 448, i32 0, metadata !107} ; [ DW_TAG_member ] [z_ftime] [line 112, size 64, align 64, offset 448] [from time_t]
!120 = metadata !{i32 786445, metadata !1, metadata !103, metadata !"z_axfr_src", i32 113, i64 32, i64 32, i64 512, i32 0, metadata !121} ; [ DW_TAG_member ] [z_axfr_src] [line 113, size 32, align 32, offset 512] [from in_addr]
!121 = metadata !{i32 786451, metadata !122, null, metadata !"in_addr", i32 142, i64 32, i64 32, i32 0, i32 0, null, metadata !123, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [in_addr] [line 142, size 32, align 32, offset 0] [def] [from ]
!122 = metadata !{metadata !"/usr/include/netinet/in.h", metadata !"/home/czuo/locabug/tests"}
!123 = metadata !{metadata !124}
!124 = metadata !{i32 786445, metadata !122, metadata !121, metadata !"s_addr", i32 144, i64 32, i64 32, i64 0, i32 0, metadata !125} ; [ DW_TAG_member ] [s_addr] [line 144, size 32, align 32, offset 0] [from in_addr_t]
!125 = metadata !{i32 786454, metadata !122, null, metadata !"in_addr_t", i32 141, i64 0, i64 0, i64 0, i32 0, metadata !126} ; [ DW_TAG_typedef ] [in_addr_t] [line 141, size 0, align 0, offset 0] [from uint32_t]
!126 = metadata !{i32 786454, metadata !122, null, metadata !"uint32_t", i32 52, i64 0, i64 0, i64 0, i32 0, metadata !113} ; [ DW_TAG_typedef ] [uint32_t] [line 52, size 0, align 0, offset 0] [from unsigned int]
!127 = metadata !{i32 786445, metadata !1, metadata !103, metadata !"z_xaddr", i32 114, i64 32, i64 32, i64 544, i32 0, metadata !121} ; [ DW_TAG_member ] [z_xaddr] [line 114, size 32, align 32, offset 544] [from in_addr]
!128 = metadata !{i32 786445, metadata !1, metadata !103, metadata !"z_addr", i32 115, i64 512, i64 32, i64 576, i32 0, metadata !129} ; [ DW_TAG_member ] [z_addr] [line 115, size 512, align 32, offset 576] [from ]
!129 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 512, i64 32, i32 0, i32 0, metadata !121, metadata !130, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 512, align 32, offset 0] [from in_addr]
!130 = metadata !{metadata !131}
!131 = metadata !{i32 786465, i64 0, i64 16}      ; [ DW_TAG_subrange_type ] [0, 15]
!132 = metadata !{i32 786445, metadata !1, metadata !103, metadata !"z_addrcnt", i32 116, i64 8, i64 8, i64 1088, i32 0, metadata !90} ; [ DW_TAG_member ] [z_addrcnt] [line 116, size 8, align 8, offset 1088] [from u_char]
!133 = metadata !{i32 786445, metadata !1, metadata !103, metadata !"z_type", i32 117, i64 8, i64 8, i64 1096, i32 0, metadata !90} ; [ DW_TAG_member ] [z_type] [line 117, size 8, align 8, offset 1096] [from u_char]
!134 = metadata !{i32 786445, metadata !1, metadata !103, metadata !"z_flags", i32 118, i64 32, i64 32, i64 1120, i32 0, metadata !112} ; [ DW_TAG_member ] [z_flags] [line 118, size 32, align 32, offset 1120] [from u_int32_t]
!135 = metadata !{i32 786445, metadata !1, metadata !103, metadata !"z_xferpid", i32 119, i64 32, i64 32, i64 1152, i32 0, metadata !136} ; [ DW_TAG_member ] [z_xferpid] [line 119, size 32, align 32, offset 1152] [from pid_t]
!136 = metadata !{i32 786454, metadata !1, null, metadata !"pid_t", i32 99, i64 0, i64 0, i64 0, i32 0, metadata !137} ; [ DW_TAG_typedef ] [pid_t] [line 99, size 0, align 0, offset 0] [from __pid_t]
!137 = metadata !{i32 786454, metadata !1, null, metadata !"__pid_t", i32 143, i64 0, i64 0, i64 0, i32 0, metadata !57} ; [ DW_TAG_typedef ] [__pid_t] [line 143, size 0, align 0, offset 0] [from int]
!138 = metadata !{i32 786445, metadata !1, metadata !103, metadata !"z_options", i32 120, i64 32, i64 32, i64 1184, i32 0, metadata !139} ; [ DW_TAG_member ] [z_options] [line 120, size 32, align 32, offset 1184] [from u_int]
!139 = metadata !{i32 786454, metadata !1, null, metadata !"u_int", i32 36, i64 0, i64 0, i64 0, i32 0, metadata !140} ; [ DW_TAG_typedef ] [u_int] [line 36, size 0, align 0, offset 0] [from __u_int]
!140 = metadata !{i32 786454, metadata !1, null, metadata !"__u_int", i32 33, i64 0, i64 0, i64 0, i32 0, metadata !113} ; [ DW_TAG_typedef ] [__u_int] [line 33, size 0, align 0, offset 0] [from unsigned int]
!141 = metadata !{i32 786445, metadata !1, metadata !103, metadata !"z_optset", i32 121, i64 32, i64 32, i64 1216, i32 0, metadata !139} ; [ DW_TAG_member ] [z_optset] [line 121, size 32, align 32, offset 1216] [from u_int]
!142 = metadata !{i32 786445, metadata !1, metadata !103, metadata !"z_class", i32 122, i64 32, i64 32, i64 1248, i32 0, metadata !57} ; [ DW_TAG_member ] [z_class] [line 122, size 32, align 32, offset 1248] [from int]
!143 = metadata !{i32 786445, metadata !1, metadata !103, metadata !"z_numxfrs", i32 123, i64 32, i64 32, i64 1280, i32 0, metadata !57} ; [ DW_TAG_member ] [z_numxfrs] [line 123, size 32, align 32, offset 1280] [from int]
!144 = metadata !{i32 786445, metadata !1, metadata !103, metadata !"z_checknames", i32 124, i64 32, i64 32, i64 1312, i32 0, metadata !16} ; [ DW_TAG_member ] [z_checknames] [line 124, size 32, align 32, offset 1312] [from severity]
!145 = metadata !{i32 786445, metadata !1, metadata !103, metadata !"z_also_notify", i32 138, i64 64, i64 64, i64 1344, i32 0, metadata !146} ; [ DW_TAG_member ] [z_also_notify] [line 138, size 64, align 64, offset 1344] [from ]
!146 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !121} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from in_addr]
!147 = metadata !{i32 786445, metadata !1, metadata !103, metadata !"z_notify_count", i32 139, i64 32, i64 32, i64 1408, i32 0, metadata !57} ; [ DW_TAG_member ] [z_notify_count] [line 139, size 32, align 32, offset 1408] [from int]
!148 = metadata !{i32 786445, metadata !1, metadata !103, metadata !"z_ixfr_base", i32 140, i64 64, i64 64, i64 1472, i32 0, metadata !82} ; [ DW_TAG_member ] [z_ixfr_base] [line 140, size 64, align 64, offset 1472] [from ]
!149 = metadata !{i32 786445, metadata !1, metadata !103, metadata !"z_ixfr_tmp", i32 141, i64 64, i64 64, i64 1536, i32 0, metadata !82} ; [ DW_TAG_member ] [z_ixfr_tmp] [line 141, size 64, align 64, offset 1536] [from ]
!150 = metadata !{i32 786445, metadata !1, metadata !103, metadata !"z_maintain_ixfr_base", i32 142, i64 32, i64 32, i64 1600, i32 0, metadata !57} ; [ DW_TAG_member ] [z_maintain_ixfr_base] [line 142, size 32, align 32, offset 1600] [from int]
!151 = metadata !{i32 786445, metadata !1, metadata !103, metadata !"z_log_size_ixfr", i32 143, i64 32, i64 32, i64 1632, i32 0, metadata !57} ; [ DW_TAG_member ] [z_log_size_ixfr] [line 143, size 32, align 32, offset 1632] [from int]
!152 = metadata !{i32 786445, metadata !1, metadata !103, metadata !"z_max_log_size_ixfr", i32 144, i64 32, i64 32, i64 1664, i32 0, metadata !57} ; [ DW_TAG_member ] [z_max_log_size_ixfr] [line 144, size 32, align 32, offset 1664] [from int]
!153 = metadata !{metadata !154, metadata !155, metadata !156, metadata !157, metadata !158, metadata !159, metadata !160, metadata !161}
!154 = metadata !{i32 786689, metadata !99, metadata !"name", metadata !54, i32 16777516, metadata !58, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [name] [line 300]
!155 = metadata !{i32 786689, metadata !99, metadata !"class", metadata !54, i32 33554732, metadata !57, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [class] [line 300]
!156 = metadata !{i32 786689, metadata !99, metadata !"zp", metadata !54, i32 50331948, metadata !102, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [zp] [line 300]
!157 = metadata !{i32 786689, metadata !99, metadata !"transport", metadata !54, i32 67109165, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [transport] [line 301]
!158 = metadata !{i32 786689, metadata !99, metadata !"context", metadata !54, i32 83886382, metadata !3, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [context] [line 302]
!159 = metadata !{i32 786689, metadata !99, metadata !"owner", metadata !54, i32 100663599, metadata !58, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [owner] [line 303]
!160 = metadata !{i32 786688, metadata !99, metadata !"severity", metadata !54, i32 306, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [severity] [line 306]
!161 = metadata !{i32 786688, metadata !99, metadata !"ok", metadata !54, i32 307, metadata !57, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ok] [line 307]
!162 = metadata !{i32 786478, metadata !1, metadata !54, metadata !"create_msg", metadata !"create_msg", metadata !"", i32 527, metadata !163, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @create_msg, null, null, metadata !165, i32 527} ; [ DW_TAG_subprogram ] [line 527] [def] [create_msg]
!163 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !164, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!164 = metadata !{metadata !57, metadata !89}
!165 = metadata !{metadata !166, metadata !167, metadata !168, metadata !169, metadata !170, metadata !171, metadata !172, metadata !176, metadata !177, metadata !179, metadata !180, metadata !181, metadata !182, metadata !183, metadata !184, metadata !187, metadata !189, metadata !190, metadata !192, metadata !193, metadata !195, metadata !196, metadata !198, metadata !199, metadata !201, metadata !202, metadata !204, metadata !205, metadata !207, metadata !208, metadata !210}
!166 = metadata !{i32 786689, metadata !162, metadata !"buf", metadata !54, i32 16777743, metadata !89, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [buf] [line 527]
!167 = metadata !{i32 786688, metadata !162, metadata !"p", metadata !54, i32 529, metadata !89, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [p] [line 529]
!168 = metadata !{i32 786688, metadata !162, metadata !"temp", metadata !54, i32 530, metadata !82, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [temp] [line 530]
!169 = metadata !{i32 786688, metadata !162, metadata !"temp1", metadata !54, i32 530, metadata !82, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [temp1] [line 530]
!170 = metadata !{i32 786688, metadata !162, metadata !"comp_dn", metadata !54, i32 531, metadata !89, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [comp_dn] [line 531]
!171 = metadata !{i32 786688, metadata !162, metadata !"comp_dn2", metadata !54, i32 531, metadata !89, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [comp_dn2] [line 531]
!172 = metadata !{i32 786688, metadata !162, metadata !"exp_dn", metadata !54, i32 532, metadata !173, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [exp_dn] [line 532]
!173 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 1600, i64 8, i32 0, i32 0, metadata !60, metadata !174, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 1600, align 8, offset 0] [from char]
!174 = metadata !{metadata !175}
!175 = metadata !{i32 786465, i64 0, i64 200}     ; [ DW_TAG_subrange_type ] [0, 199]
!176 = metadata !{i32 786688, metadata !162, metadata !"exp_dn2", metadata !54, i32 532, metadata !173, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [exp_dn2] [line 532]
!177 = metadata !{i32 786688, metadata !162, metadata !"dnptrs", metadata !54, i32 533, metadata !178, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dnptrs] [line 533]
!178 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !89} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!179 = metadata !{i32 786688, metadata !162, metadata !"lastdnptr", metadata !54, i32 533, metadata !178, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [lastdnptr] [line 533]
!180 = metadata !{i32 786688, metadata !162, metadata !"dnptrs2", metadata !54, i32 533, metadata !178, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dnptrs2] [line 533]
!181 = metadata !{i32 786688, metadata !162, metadata !"i", metadata !54, i32 534, metadata !57, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 534]
!182 = metadata !{i32 786688, metadata !162, metadata !"len", metadata !54, i32 534, metadata !57, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [len] [line 534]
!183 = metadata !{i32 786688, metadata !162, metadata !"comp_size", metadata !54, i32 534, metadata !57, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [comp_size] [line 534]
!184 = metadata !{i32 786688, metadata !162, metadata !"now", metadata !54, i32 535, metadata !185, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [now] [line 535]
!185 = metadata !{i32 786454, metadata !1, null, metadata !"u_long", i32 37, i64 0, i64 0, i64 0, i32 0, metadata !186} ; [ DW_TAG_typedef ] [u_long] [line 37, size 0, align 0, offset 0] [from __u_long]
!186 = metadata !{i32 786454, metadata !1, null, metadata !"__u_long", i32 34, i64 0, i64 0, i64 0, i32 0, metadata !84} ; [ DW_TAG_typedef ] [__u_long] [line 34, size 0, align 0, offset 0] [from long unsigned int]
!187 = metadata !{i32 786688, metadata !188, metadata !"t_s", metadata !54, i32 574, metadata !96, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [t_s] [line 574]
!188 = metadata !{i32 786443, metadata !1, metadata !162, i32 574, i32 0, i32 23} ; [ DW_TAG_lexical_block ] [/home/czuo/locabug/tests/nxt-bad.c]
!189 = metadata !{i32 786688, metadata !188, metadata !"t_cp", metadata !54, i32 574, metadata !89, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [t_cp] [line 574]
!190 = metadata !{i32 786688, metadata !191, metadata !"t_s", metadata !54, i32 577, metadata !96, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [t_s] [line 577]
!191 = metadata !{i32 786443, metadata !1, metadata !162, i32 577, i32 0, i32 24} ; [ DW_TAG_lexical_block ] [/home/czuo/locabug/tests/nxt-bad.c]
!192 = metadata !{i32 786688, metadata !191, metadata !"t_cp", metadata !54, i32 577, metadata !89, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [t_cp] [line 577]
!193 = metadata !{i32 786688, metadata !194, metadata !"t_l", metadata !54, i32 580, metadata !112, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [t_l] [line 580]
!194 = metadata !{i32 786443, metadata !1, metadata !162, i32 580, i32 0, i32 25} ; [ DW_TAG_lexical_block ] [/home/czuo/locabug/tests/nxt-bad.c]
!195 = metadata !{i32 786688, metadata !194, metadata !"t_cp", metadata !54, i32 580, metadata !89, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [t_cp] [line 580]
!196 = metadata !{i32 786688, metadata !197, metadata !"t_s", metadata !54, i32 583, metadata !96, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [t_s] [line 583]
!197 = metadata !{i32 786443, metadata !1, metadata !162, i32 583, i32 0, i32 26} ; [ DW_TAG_lexical_block ] [/home/czuo/locabug/tests/nxt-bad.c]
!198 = metadata !{i32 786688, metadata !197, metadata !"t_cp", metadata !54, i32 583, metadata !89, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [t_cp] [line 583]
!199 = metadata !{i32 786688, metadata !200, metadata !"t_l", metadata !54, i32 607, metadata !112, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [t_l] [line 607]
!200 = metadata !{i32 786443, metadata !1, metadata !162, i32 607, i32 0, i32 28} ; [ DW_TAG_lexical_block ] [/home/czuo/locabug/tests/nxt-bad.c]
!201 = metadata !{i32 786688, metadata !200, metadata !"t_cp", metadata !54, i32 607, metadata !89, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [t_cp] [line 607]
!202 = metadata !{i32 786688, metadata !203, metadata !"t_l", metadata !54, i32 609, metadata !112, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [t_l] [line 609]
!203 = metadata !{i32 786443, metadata !1, metadata !162, i32 609, i32 0, i32 29} ; [ DW_TAG_lexical_block ] [/home/czuo/locabug/tests/nxt-bad.c]
!204 = metadata !{i32 786688, metadata !203, metadata !"t_cp", metadata !54, i32 609, metadata !89, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [t_cp] [line 609]
!205 = metadata !{i32 786688, metadata !206, metadata !"t_l", metadata !54, i32 611, metadata !112, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [t_l] [line 611]
!206 = metadata !{i32 786443, metadata !1, metadata !162, i32 611, i32 0, i32 30} ; [ DW_TAG_lexical_block ] [/home/czuo/locabug/tests/nxt-bad.c]
!207 = metadata !{i32 786688, metadata !206, metadata !"t_cp", metadata !54, i32 611, metadata !89, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [t_cp] [line 611]
!208 = metadata !{i32 786688, metadata !209, metadata !"t_l", metadata !54, i32 613, metadata !112, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [t_l] [line 613]
!209 = metadata !{i32 786443, metadata !1, metadata !162, i32 613, i32 0, i32 31} ; [ DW_TAG_lexical_block ] [/home/czuo/locabug/tests/nxt-bad.c]
!210 = metadata !{i32 786688, metadata !209, metadata !"t_cp", metadata !54, i32 613, metadata !89, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [t_cp] [line 613]
!211 = metadata !{i32 786478, metadata !1, metadata !54, metadata !"main", metadata !"main", metadata !"", i32 624, metadata !212, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 true, i32 ()* @main, null, null, metadata !214, i32 624} ; [ DW_TAG_subprogram ] [line 624] [def] [main]
!212 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !213, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!213 = metadata !{metadata !57}
!214 = metadata !{metadata !215, metadata !216, metadata !217, metadata !218, metadata !219}
!215 = metadata !{i32 786688, metadata !211, metadata !"msglen", metadata !54, i32 626, metadata !57, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [msglen] [line 626]
!216 = metadata !{i32 786688, metadata !211, metadata !"ret", metadata !54, i32 626, metadata !57, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ret] [line 626]
!217 = metadata !{i32 786688, metadata !211, metadata !"dp", metadata !54, i32 627, metadata !89, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dp] [line 627]
!218 = metadata !{i32 786688, metadata !211, metadata !"name", metadata !54, i32 628, metadata !89, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [name] [line 628]
!219 = metadata !{i32 786688, metadata !211, metadata !"msg", metadata !54, i32 629, metadata !89, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [msg] [line 629]
!220 = metadata !{i32 786478, metadata !1, metadata !54, metadata !"rrextract", metadata !"rrextract", metadata !"", i32 343, metadata !221, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !223, i32 344} ; [ DW_TAG_subprogram ] [line 343] [local] [def] [scope 344] [rrextract]
!221 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !222, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!222 = metadata !{metadata !57, metadata !89, metadata !57, metadata !89, metadata !89, metadata !57}
!223 = metadata !{metadata !224, metadata !225, metadata !226, metadata !227, metadata !228, metadata !229, metadata !230, metadata !231, metadata !232, metadata !233, metadata !234, metadata !235, metadata !236, metadata !237, metadata !238, metadata !239, metadata !243, metadata !264, metadata !268, metadata !270, metadata !272}
!224 = metadata !{i32 786689, metadata !220, metadata !"msg", metadata !54, i32 16777559, metadata !89, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [msg] [line 343]
!225 = metadata !{i32 786689, metadata !220, metadata !"msglen", metadata !54, i32 33554775, metadata !57, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [msglen] [line 343]
!226 = metadata !{i32 786689, metadata !220, metadata !"rrp", metadata !54, i32 50331991, metadata !89, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [rrp] [line 343]
!227 = metadata !{i32 786689, metadata !220, metadata !"dname", metadata !54, i32 67109207, metadata !89, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dname] [line 343]
!228 = metadata !{i32 786689, metadata !220, metadata !"namelen", metadata !54, i32 83886423, metadata !57, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [namelen] [line 343]
!229 = metadata !{i32 786688, metadata !220, metadata !"eom", metadata !54, i32 345, metadata !89, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [eom] [line 345]
!230 = metadata !{i32 786688, metadata !220, metadata !"cp", metadata !54, i32 345, metadata !89, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [cp] [line 345]
!231 = metadata !{i32 786688, metadata !220, metadata !"cp1", metadata !54, i32 345, metadata !89, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [cp1] [line 345]
!232 = metadata !{i32 786688, metadata !220, metadata !"rdatap", metadata !54, i32 345, metadata !89, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [rdatap] [line 345]
!233 = metadata !{i32 786688, metadata !220, metadata !"class", metadata !54, i32 346, metadata !139, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [class] [line 346]
!234 = metadata !{i32 786688, metadata !220, metadata !"type", metadata !54, i32 346, metadata !139, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [type] [line 346]
!235 = metadata !{i32 786688, metadata !220, metadata !"dlen", metadata !54, i32 346, metadata !139, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dlen] [line 346]
!236 = metadata !{i32 786688, metadata !220, metadata !"n", metadata !54, i32 347, metadata !57, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [n] [line 347]
!237 = metadata !{i32 786688, metadata !220, metadata !"len", metadata !54, i32 347, metadata !57, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [len] [line 347]
!238 = metadata !{i32 786688, metadata !220, metadata !"ttl", metadata !54, i32 348, metadata !112, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ttl] [line 348]
!239 = metadata !{i32 786688, metadata !220, metadata !"data", metadata !54, i32 349, metadata !240, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [data] [line 349]
!240 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 33120, i64 8, i32 0, i32 0, metadata !90, metadata !241, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 33120, align 8, offset 0] [from u_char]
!241 = metadata !{metadata !242}
!242 = metadata !{i32 786465, i64 0, i64 4140}    ; [ DW_TAG_subrange_type ] [0, 4139]
!243 = metadata !{i32 786688, metadata !220, metadata !"hp", metadata !54, i32 350, metadata !244, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [hp] [line 350]
!244 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !245} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from HEADER]
!245 = metadata !{i32 786454, metadata !1, null, metadata !"HEADER", i32 83, i64 0, i64 0, i64 0, i32 0, metadata !246} ; [ DW_TAG_typedef ] [HEADER] [line 83, size 0, align 0, offset 0] [from ]
!246 = metadata !{i32 786451, metadata !247, null, metadata !"", i32 48, i64 96, i64 32, i32 0, i32 0, null, metadata !248, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [line 48, size 96, align 32, offset 0] [def] [from ]
!247 = metadata !{metadata !"/usr/include/arpa/nameser_compat.h", metadata !"/home/czuo/locabug/tests"}
!248 = metadata !{metadata !249, metadata !250, metadata !251, metadata !252, metadata !253, metadata !254, metadata !255, metadata !256, metadata !257, metadata !258, metadata !259, metadata !260, metadata !261, metadata !262, metadata !263}
!249 = metadata !{i32 786445, metadata !247, metadata !246, metadata !"id", i32 49, i64 16, i64 32, i64 0, i32 0, metadata !113} ; [ DW_TAG_member ] [id] [line 49, size 16, align 32, offset 0] [from unsigned int]
!250 = metadata !{i32 786445, metadata !247, metadata !246, metadata !"rd", i32 66, i64 1, i64 32, i64 16, i32 0, metadata !113} ; [ DW_TAG_member ] [rd] [line 66, size 1, align 32, offset 16] [from unsigned int]
!251 = metadata !{i32 786445, metadata !247, metadata !246, metadata !"tc", i32 67, i64 1, i64 32, i64 17, i32 0, metadata !113} ; [ DW_TAG_member ] [tc] [line 67, size 1, align 32, offset 17] [from unsigned int]
!252 = metadata !{i32 786445, metadata !247, metadata !246, metadata !"aa", i32 68, i64 1, i64 32, i64 18, i32 0, metadata !113} ; [ DW_TAG_member ] [aa] [line 68, size 1, align 32, offset 18] [from unsigned int]
!253 = metadata !{i32 786445, metadata !247, metadata !246, metadata !"opcode", i32 69, i64 4, i64 32, i64 19, i32 0, metadata !113} ; [ DW_TAG_member ] [opcode] [line 69, size 4, align 32, offset 19] [from unsigned int]
!254 = metadata !{i32 786445, metadata !247, metadata !246, metadata !"qr", i32 70, i64 1, i64 32, i64 23, i32 0, metadata !113} ; [ DW_TAG_member ] [qr] [line 70, size 1, align 32, offset 23] [from unsigned int]
!255 = metadata !{i32 786445, metadata !247, metadata !246, metadata !"rcode", i32 72, i64 4, i64 32, i64 24, i32 0, metadata !113} ; [ DW_TAG_member ] [rcode] [line 72, size 4, align 32, offset 24] [from unsigned int]
!256 = metadata !{i32 786445, metadata !247, metadata !246, metadata !"cd", i32 73, i64 1, i64 32, i64 28, i32 0, metadata !113} ; [ DW_TAG_member ] [cd] [line 73, size 1, align 32, offset 28] [from unsigned int]
!257 = metadata !{i32 786445, metadata !247, metadata !246, metadata !"ad", i32 74, i64 1, i64 32, i64 29, i32 0, metadata !113} ; [ DW_TAG_member ] [ad] [line 74, size 1, align 32, offset 29] [from unsigned int]
!258 = metadata !{i32 786445, metadata !247, metadata !246, metadata !"unused", i32 75, i64 1, i64 32, i64 30, i32 0, metadata !113} ; [ DW_TAG_member ] [unused] [line 75, size 1, align 32, offset 30] [from unsigned int]
!259 = metadata !{i32 786445, metadata !247, metadata !246, metadata !"ra", i32 76, i64 1, i64 32, i64 31, i32 0, metadata !113} ; [ DW_TAG_member ] [ra] [line 76, size 1, align 32, offset 31] [from unsigned int]
!260 = metadata !{i32 786445, metadata !247, metadata !246, metadata !"qdcount", i32 79, i64 16, i64 32, i64 32, i32 0, metadata !113} ; [ DW_TAG_member ] [qdcount] [line 79, size 16, align 32, offset 32] [from unsigned int]
!261 = metadata !{i32 786445, metadata !247, metadata !246, metadata !"ancount", i32 80, i64 16, i64 32, i64 48, i32 0, metadata !113} ; [ DW_TAG_member ] [ancount] [line 80, size 16, align 32, offset 48] [from unsigned int]
!262 = metadata !{i32 786445, metadata !247, metadata !246, metadata !"nscount", i32 81, i64 16, i64 32, i64 64, i32 0, metadata !113} ; [ DW_TAG_member ] [nscount] [line 81, size 16, align 32, offset 64] [from unsigned int]
!263 = metadata !{i32 786445, metadata !247, metadata !246, metadata !"arcount", i32 82, i64 16, i64 32, i64 80, i32 0, metadata !113} ; [ DW_TAG_member ] [arcount] [line 82, size 16, align 32, offset 80] [from unsigned int]
!264 = metadata !{i32 786688, metadata !265, metadata !"t_cp", metadata !54, i32 371, metadata !266, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [t_cp] [line 371]
!265 = metadata !{i32 786443, metadata !1, metadata !220, i32 371, i32 0, i32 37} ; [ DW_TAG_lexical_block ] [/home/czuo/locabug/tests/nxt-bad.c]
!266 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !267} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!267 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !90} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from u_char]
!268 = metadata !{i32 786688, metadata !269, metadata !"t_cp", metadata !54, i32 375, metadata !266, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [t_cp] [line 375]
!269 = metadata !{i32 786443, metadata !1, metadata !220, i32 375, i32 0, i32 38} ; [ DW_TAG_lexical_block ] [/home/czuo/locabug/tests/nxt-bad.c]
!270 = metadata !{i32 786688, metadata !271, metadata !"t_cp", metadata !54, i32 384, metadata !266, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [t_cp] [line 384]
!271 = metadata !{i32 786443, metadata !1, metadata !220, i32 384, i32 0, i32 41} ; [ DW_TAG_lexical_block ] [/home/czuo/locabug/tests/nxt-bad.c]
!272 = metadata !{i32 786688, metadata !273, metadata !"t_cp", metadata !54, i32 395, metadata !266, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [t_cp] [line 395]
!273 = metadata !{i32 786443, metadata !1, metadata !220, i32 395, i32 0, i32 44} ; [ DW_TAG_lexical_block ] [/home/czuo/locabug/tests/nxt-bad.c]
!274 = metadata !{metadata !275}
!275 = metadata !{i32 786484, i32 0, null, metadata !"transport_strings", metadata !"transport_strings", metadata !"", metadata !54, i32 180, metadata !276, i32 0, i32 1, [4 x i8*]* @transport_strings, null} ; [ DW_TAG_variable ] [transport_strings] [line 180] [def]
!276 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 256, i64 64, i32 0, i32 0, metadata !58, metadata !277, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 256, align 64, offset 0] [from ]
!277 = metadata !{metadata !278}
!278 = metadata !{i32 786465, i64 0, i64 4}       ; [ DW_TAG_subrange_type ] [0, 3]
!279 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!280 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!281 = metadata !{metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)"}
!282 = metadata !{i32 203, i32 0, metadata !53, null}
!283 = metadata !{metadata !284, metadata !284, i64 0}
!284 = metadata !{metadata !"omnipotent char", metadata !285, i64 0}
!285 = metadata !{metadata !"Simple C/C++ TBAA"}
!286 = metadata !{i32 204, i32 0, metadata !287, null}
!287 = metadata !{i32 786443, metadata !1, metadata !53, i32 204, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/czuo/locabug/tests/nxt-bad.c]
!288 = metadata !{i32 207, i32 0, metadata !53, null}
!289 = metadata !{i32 211, i32 0, metadata !64, null}
!290 = metadata !{i32 213, i32 0, metadata !64, null}
!291 = metadata !{i32 214, i32 0, metadata !71, null}
!292 = metadata !{i32 216, i32 0, metadata !293, null}
!293 = metadata !{i32 786443, metadata !1, metadata !71, i32 216, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/czuo/locabug/tests/nxt-bad.c]
!294 = metadata !{i32 218, i32 0, metadata !295, null}
!295 = metadata !{i32 786443, metadata !1, metadata !293, i32 218, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/czuo/locabug/tests/nxt-bad.c]
!296 = metadata !{i32 219, i32 0, metadata !297, null}
!297 = metadata !{i32 786443, metadata !1, metadata !298, i32 219, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/czuo/locabug/tests/nxt-bad.c]
!298 = metadata !{i32 786443, metadata !1, metadata !295, i32 218, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/czuo/locabug/tests/nxt-bad.c]
!299 = metadata !{i32 221, i32 0, metadata !300, null}
!300 = metadata !{i32 786443, metadata !1, metadata !295, i32 221, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/czuo/locabug/tests/nxt-bad.c]
!301 = metadata !{i32 222, i32 0, metadata !302, null}
!302 = metadata !{i32 786443, metadata !1, metadata !303, i32 222, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/czuo/locabug/tests/nxt-bad.c]
!303 = metadata !{i32 786443, metadata !1, metadata !300, i32 221, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/czuo/locabug/tests/nxt-bad.c]
!304 = metadata !{i32 225, i32 0, metadata !305, null}
!305 = metadata !{i32 786443, metadata !1, metadata !306, i32 225, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/czuo/locabug/tests/nxt-bad.c]
!306 = metadata !{i32 786443, metadata !1, metadata !300, i32 224, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/czuo/locabug/tests/nxt-bad.c]
!307 = metadata !{i32 231, i32 0, metadata !64, null}
!308 = metadata !{i32 241, i32 0, metadata !72, null}
!309 = metadata !{i32 245, i32 0, metadata !310, null}
!310 = metadata !{i32 786443, metadata !1, metadata !72, i32 241, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/czuo/locabug/tests/nxt-bad.c]
!311 = metadata !{i32 253, i32 0, metadata !312, null}
!312 = metadata !{i32 786443, metadata !1, metadata !310, i32 245, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [/home/czuo/locabug/tests/nxt-bad.c]
!313 = metadata !{i32 255, i32 0, metadata !312, null}
!314 = metadata !{i32 257, i32 0, metadata !312, null}
!315 = metadata !{i32 262, i32 0, metadata !310, null}
!316 = metadata !{i32 267, i32 0, metadata !72, null}
!317 = metadata !{i32 282, i32 0, metadata !79, null}
!318 = metadata !{i32 284, i32 0, metadata !79, null}
!319 = metadata !{i32 285, i32 0, metadata !320, null}
!320 = metadata !{i32 786443, metadata !1, metadata !79, i32 285, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [/home/czuo/locabug/tests/nxt-bad.c]
!321 = metadata !{i32 286, i32 0, metadata !322, null}
!322 = metadata !{i32 786443, metadata !1, metadata !323, i32 286, i32 0, i32 16} ; [ DW_TAG_lexical_block ] [/home/czuo/locabug/tests/nxt-bad.c]
!323 = metadata !{i32 786443, metadata !1, metadata !320, i32 285, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [/home/czuo/locabug/tests/nxt-bad.c]
!324 = metadata !{i32 287, i32 0, metadata !322, null}
!325 = metadata !{metadata !326, metadata !326, i64 0}
!326 = metadata !{metadata !"int", metadata !284, i64 0}
!327 = metadata !{i32 290, i32 0, metadata !323, null}
!328 = metadata !{i32 292, i32 0, metadata !95, null}
!329 = metadata !{i32 293, i32 0, metadata !79, null}
!330 = metadata !{i32 294, i32 0, metadata !79, null}
!331 = metadata !{i32 309, i32 0, metadata !332, null}
!332 = metadata !{i32 786443, metadata !1, metadata !99, i32 309, i32 0, i32 18} ; [ DW_TAG_lexical_block ] [/home/czuo/locabug/tests/nxt-bad.c]
!333 = metadata !{i32 310, i32 0, metadata !332, null}
!334 = metadata !{metadata !335, metadata !284, i64 164}
!335 = metadata !{metadata !"zoneinfo", metadata !336, i64 0, metadata !337, i64 8, metadata !337, i64 16, metadata !326, i64 24, metadata !326, i64 28, metadata !326, i64 32, metadata !326, i64 36, metadata !326, i64 40, metadata !336, i64 48, metadata !337, i64 56, metadata !338, i64 64, metadata !338, i64 68, metadata !284, i64 72, metadata !284, i64 136, metadata !284, i64 137, metadata !326, i64 140, metadata !326, i64 144, metadata !326, i64 148, metadata !326, i64 152, metadata !326, i64 156, metadata !326, i64 160, metadata !284, i64 164, metadata !336, i64 168, metadata !326, i64 176, metadata !336, i64 184, metadata !336, i64 192, metadata !326, i64 200, metadata !326, i64 204, metadata !326, i64 208}
!336 = metadata !{metadata !"any pointer", metadata !284, i64 0}
!337 = metadata !{metadata !"long", metadata !284, i64 0}
!338 = metadata !{metadata !"in_addr", metadata !326, i64 0}
!339 = metadata !{i32 320, i32 0, metadata !340, null}
!340 = metadata !{i32 786443, metadata !1, metadata !99, i32 320, i32 0, i32 19} ; [ DW_TAG_lexical_block ] [/home/czuo/locabug/tests/nxt-bad.c]
!341 = metadata !{i32 322, i32 0, metadata !99, null}
!342 = metadata !{i32 324, i32 0, metadata !343, null}
!343 = metadata !{i32 786443, metadata !1, metadata !99, i32 322, i32 0, i32 20} ; [ DW_TAG_lexical_block ] [/home/czuo/locabug/tests/nxt-bad.c]
!344 = metadata !{i32 203, i32 0, metadata !53, metadata !342}
!345 = metadata !{i32 204, i32 0, metadata !287, metadata !342}
!346 = metadata !{i32 211, i32 0, metadata !64, metadata !347}
!347 = metadata !{i32 327, i32 0, metadata !343, null}
!348 = metadata !{i32 213, i32 0, metadata !64, metadata !347}
!349 = metadata !{i32 214, i32 0, metadata !71, metadata !347}
!350 = metadata !{i32 216, i32 0, metadata !293, metadata !347}
!351 = metadata !{i32 218, i32 0, metadata !295, metadata !347}
!352 = metadata !{i32 219, i32 0, metadata !297, metadata !347}
!353 = metadata !{i32 221, i32 0, metadata !300, metadata !347}
!354 = metadata !{i32 222, i32 0, metadata !302, metadata !347}
!355 = metadata !{i32 225, i32 0, metadata !305, metadata !347}
!356 = metadata !{i32 331, i32 0, metadata !357, null}
!357 = metadata !{i32 786443, metadata !1, metadata !343, i32 330, i32 0, i32 21} ; [ DW_TAG_lexical_block ] [/home/czuo/locabug/tests/nxt-bad.c]
!358 = metadata !{i32 332, i32 0, metadata !357, null}
!359 = metadata !{i32 339, i32 0, metadata !99, null}
!360 = metadata !{i32 532, i32 0, metadata !162, null}
!361 = metadata !{i32 537, i32 0, metadata !162, null}
!362 = metadata !{i32 538, i32 0, metadata !162, null}
!363 = metadata !{i32 540, i32 0, metadata !162, null}
!364 = metadata !{i32 541, i32 0, metadata !162, null}
!365 = metadata !{i32 543, i32 0, metadata !162, null}
!366 = metadata !{i32 551, i32 0, metadata !162, null}
!367 = metadata !{i32 553, i32 0, metadata !162, null}
!368 = metadata !{i32 554, i32 0, metadata !162, null}
!369 = metadata !{i32 558, i32 0, metadata !162, null}
!370 = metadata !{metadata !336, metadata !336, i64 0}
!371 = metadata !{i32 559, i32 0, metadata !162, null}
!372 = metadata !{i32 563, i32 0, metadata !162, null}
!373 = metadata !{i32 564, i32 0, metadata !162, null}
!374 = metadata !{i32 565, i32 0, metadata !162, null}
!375 = metadata !{i32 566, i32 0, metadata !162, null}
!376 = metadata !{i32 567, i32 0, metadata !162, null}
!377 = metadata !{i32 569, i32 0, metadata !378, null}
!378 = metadata !{i32 786443, metadata !1, metadata !162, i32 569, i32 0, i32 22} ; [ DW_TAG_lexical_block ] [/home/czuo/locabug/tests/nxt-bad.c]
!379 = metadata !{i32 570, i32 0, metadata !378, null}
!380 = metadata !{metadata !380, metadata !381, metadata !382}
!381 = metadata !{metadata !"llvm.vectorizer.width", i32 1}
!382 = metadata !{metadata !"llvm.vectorizer.unroll", i32 1}
!383 = metadata !{metadata !383, metadata !381, metadata !382}
!384 = metadata !{i32 574, i32 0, metadata !188, null}
!385 = metadata !{i32 575, i32 0, metadata !162, null}
!386 = metadata !{i32 577, i32 0, metadata !191, null}
!387 = metadata !{i32 578, i32 0, metadata !162, null}
!388 = metadata !{i32 580, i32 0, metadata !194, null}
!389 = metadata !{i32 581, i32 0, metadata !162, null}
!390 = metadata !{i32 583, i32 0, metadata !197, null}
!391 = metadata !{i32 586, i32 0, metadata !162, null}
!392 = metadata !{i32 592, i32 0, metadata !162, null}
!393 = metadata !{i32 593, i32 0, metadata !162, null}
!394 = metadata !{i32 596, i32 0, metadata !162, null}
!395 = metadata !{i32 597, i32 0, metadata !162, null}
!396 = metadata !{i32 598, i32 0, metadata !162, null}
!397 = metadata !{i32 599, i32 0, metadata !162, null}
!398 = metadata !{i32 600, i32 0, metadata !162, null}
!399 = metadata !{i32 604, i32 0, metadata !400, null}
!400 = metadata !{i32 786443, metadata !1, metadata !162, i32 604, i32 0, i32 27} ; [ DW_TAG_lexical_block ] [/home/czuo/locabug/tests/nxt-bad.c]
!401 = metadata !{i32 605, i32 0, metadata !400, null}
!402 = metadata !{metadata !402, metadata !381, metadata !382}
!403 = metadata !{metadata !403, metadata !381, metadata !382}
!404 = metadata !{i32 607, i32 0, metadata !200, null}
!405 = metadata !{i32 608, i32 0, metadata !162, null}
!406 = metadata !{i32 610, i32 0, metadata !162, null}
!407 = metadata !{i32 612, i32 0, metadata !162, null}
!408 = metadata !{i32 588, i32 0, metadata !162, null}
!409 = metadata !{i32 602, i32 0, metadata !162, null}
!410 = metadata !{i32 616, i32 0, metadata !162, null}
!411 = metadata !{i32 609, i32 0, metadata !203, null}
!412 = metadata !{i32 611, i32 0, metadata !206, null}
!413 = metadata !{i32 613, i32 0, metadata !209, null}
!414 = metadata !{i32 619, i32 0, metadata !162, null}
!415 = metadata !{i32 628, i32 0, metadata !211, null}
!416 = metadata !{i32 629, i32 0, metadata !211, null}
!417 = metadata !{i32 631, i32 0, metadata !211, null}
!418 = metadata !{i32 632, i32 0, metadata !211, null}
!419 = metadata !{i32 634, i32 0, metadata !211, null}
!420 = metadata !{i32 636, i32 0, metadata !211, null}
!421 = metadata !{i32 638, i32 0, metadata !211, null}
!422 = metadata !{i32 640, i32 0, metadata !211, null}
!423 = metadata !{i32 349, i32 0, metadata !220, metadata !424}
!424 = metadata !{i32 641, i32 0, metadata !211, null}
!425 = metadata !{i32 353, i32 0, metadata !220, metadata !424}
!426 = metadata !{i32 355, i32 0, metadata !220, metadata !424}
!427 = metadata !{i32 356, i32 0, metadata !220, metadata !424}
!428 = metadata !{i32 358, i32 0, metadata !429, metadata !424}
!429 = metadata !{i32 786443, metadata !1, metadata !220, i32 358, i32 0, i32 32} ; [ DW_TAG_lexical_block ] [/home/czuo/locabug/tests/nxt-bad.c]
!430 = metadata !{i32 359, i32 0, metadata !431, metadata !424}
!431 = metadata !{i32 786443, metadata !1, metadata !429, i32 358, i32 0, i32 33} ; [ DW_TAG_lexical_block ] [/home/czuo/locabug/tests/nxt-bad.c]
!432 = metadata !{i32 360, i32 0, metadata !431, metadata !424}
!433 = metadata !{i32 361, i32 0, metadata !431, metadata !424}
!434 = metadata !{i32 364, i32 0, metadata !220, metadata !424}
!435 = metadata !{i32 366, i32 0, metadata !220, metadata !424}
!436 = metadata !{i32 370, i32 0, metadata !437, metadata !424}
!437 = metadata !{i32 786443, metadata !1, metadata !438, i32 370, i32 0, i32 35} ; [ DW_TAG_lexical_block ] [/home/czuo/locabug/tests/nxt-bad.c]
!438 = metadata !{i32 786443, metadata !1, metadata !220, i32 370, i32 0, i32 34} ; [ DW_TAG_lexical_block ] [/home/czuo/locabug/tests/nxt-bad.c]
!439 = metadata !{i32 370, i32 0, metadata !440, metadata !424}
!440 = metadata !{i32 786443, metadata !1, metadata !437, i32 370, i32 0, i32 36} ; [ DW_TAG_lexical_block ] [/home/czuo/locabug/tests/nxt-bad.c]
!441 = metadata !{i32 371, i32 0, metadata !265, metadata !424}
!442 = metadata !{i32 372, i32 0, metadata !220, metadata !424}
!443 = metadata !{i32 374, i32 0, metadata !220, metadata !424}
!444 = metadata !{i32 375, i32 0, metadata !269, metadata !424}
!445 = metadata !{i32 379, i32 0, metadata !446, metadata !424}
!446 = metadata !{i32 786443, metadata !1, metadata !220, i32 379, i32 0, i32 39} ; [ DW_TAG_lexical_block ] [/home/czuo/locabug/tests/nxt-bad.c]
!447 = metadata !{i32 380, i32 0, metadata !448, metadata !424}
!448 = metadata !{i32 786443, metadata !1, metadata !446, i32 379, i32 0, i32 40} ; [ DW_TAG_lexical_block ] [/home/czuo/locabug/tests/nxt-bad.c]
!449 = metadata !{i32 381, i32 0, metadata !448, metadata !424}
!450 = metadata !{i32 382, i32 0, metadata !448, metadata !424}
!451 = metadata !{i32 376, i32 0, metadata !220, metadata !424}
!452 = metadata !{i32 384, i32 0, metadata !271, metadata !424}
!453 = metadata !{i32 385, i32 0, metadata !220, metadata !424}
!454 = metadata !{i32 386, i32 0, metadata !220, metadata !424}
!455 = metadata !{i32 389, i32 0, metadata !456, metadata !424}
!456 = metadata !{i32 786443, metadata !1, metadata !220, i32 389, i32 0, i32 42} ; [ DW_TAG_lexical_block ] [/home/czuo/locabug/tests/nxt-bad.c]
!457 = metadata !{i32 390, i32 0, metadata !458, metadata !424}
!458 = metadata !{i32 786443, metadata !1, metadata !456, i32 389, i32 0, i32 43} ; [ DW_TAG_lexical_block ] [/home/czuo/locabug/tests/nxt-bad.c]
!459 = metadata !{i32 394, i32 0, metadata !458, metadata !424}
!460 = metadata !{i32 395, i32 0, metadata !273, metadata !424}
!461 = metadata !{i32 396, i32 0, metadata !220, metadata !424}
!462 = metadata !{i32 399, i32 0, metadata !220, metadata !424}
!463 = metadata !{i32 400, i32 0, metadata !464, metadata !424}
!464 = metadata !{i32 786443, metadata !1, metadata !465, i32 400, i32 0, i32 46} ; [ DW_TAG_lexical_block ] [/home/czuo/locabug/tests/nxt-bad.c]
!465 = metadata !{i32 786443, metadata !1, metadata !220, i32 400, i32 0, i32 45} ; [ DW_TAG_lexical_block ] [/home/czuo/locabug/tests/nxt-bad.c]
!466 = metadata !{i32 400, i32 0, metadata !467, metadata !424}
!467 = metadata !{i32 786443, metadata !1, metadata !464, i32 400, i32 0, i32 47} ; [ DW_TAG_lexical_block ] [/home/czuo/locabug/tests/nxt-bad.c]
!468 = metadata !{i32 401, i32 0, metadata !220, metadata !424}
!469 = metadata !{i32 241, i32 0, metadata !72, metadata !470}
!470 = metadata !{i32 405, i32 0, metadata !471, metadata !424}
!471 = metadata !{i32 786443, metadata !1, metadata !220, i32 404, i32 0, i32 48} ; [ DW_TAG_lexical_block ] [/home/czuo/locabug/tests/nxt-bad.c]
!472 = metadata !{i32 324, i32 0, metadata !343, metadata !473}
!473 = metadata !{i32 404, i32 0, metadata !471, metadata !424}
!474 = metadata !{i32 203, i32 0, metadata !53, metadata !472}
!475 = metadata !{i32 204, i32 0, metadata !287, metadata !472}
!476 = metadata !{i32 211, i32 0, metadata !64, metadata !477}
!477 = metadata !{i32 327, i32 0, metadata !343, metadata !473}
!478 = metadata !{i32 213, i32 0, metadata !64, metadata !477}
!479 = metadata !{i32 214, i32 0, metadata !71, metadata !477}
!480 = metadata !{i32 216, i32 0, metadata !293, metadata !477}
!481 = metadata !{i32 218, i32 0, metadata !295, metadata !477}
!482 = metadata !{i32 219, i32 0, metadata !297, metadata !477}
!483 = metadata !{i32 221, i32 0, metadata !300, metadata !477}
!484 = metadata !{i32 222, i32 0, metadata !302, metadata !477}
!485 = metadata !{i32 225, i32 0, metadata !305, metadata !477}
!486 = metadata !{i32 331, i32 0, metadata !357, metadata !473}
!487 = metadata !{i32 332, i32 0, metadata !357, metadata !473}
!488 = metadata !{i32 407, i32 0, metadata !489, metadata !424}
!489 = metadata !{i32 786443, metadata !1, metadata !471, i32 406, i32 0, i32 49} ; [ DW_TAG_lexical_block ] [/home/czuo/locabug/tests/nxt-bad.c]
!490 = metadata !{i32 408, i32 0, metadata !489, metadata !424}
!491 = metadata !{i32 410, i32 0, metadata !220, metadata !424}
!492 = metadata !{i32 429, i32 0, metadata !220, metadata !424}
!493 = metadata !{i32 431, i32 0, metadata !494, metadata !424}
!494 = metadata !{i32 786443, metadata !1, metadata !495, i32 431, i32 0, i32 51} ; [ DW_TAG_lexical_block ] [/home/czuo/locabug/tests/nxt-bad.c]
!495 = metadata !{i32 786443, metadata !1, metadata !220, i32 429, i32 0, i32 50} ; [ DW_TAG_lexical_block ] [/home/czuo/locabug/tests/nxt-bad.c]
!496 = metadata !{i32 432, i32 0, metadata !497, metadata !424}
!497 = metadata !{i32 786443, metadata !1, metadata !494, i32 431, i32 0, i32 52} ; [ DW_TAG_lexical_block ] [/home/czuo/locabug/tests/nxt-bad.c]
!498 = metadata !{i32 433, i32 0, metadata !497, metadata !424}
!499 = metadata !{i32 440, i32 0, metadata !495, metadata !424}
!500 = metadata !{i32 441, i32 0, metadata !495, metadata !424}
!501 = metadata !{i32 451, i32 0, metadata !495, metadata !424}
!502 = metadata !{i32 452, i32 0, metadata !495, metadata !424}
!503 = metadata !{i32 455, i32 0, metadata !495, metadata !424}
!504 = metadata !{i32 456, i32 0, metadata !495, metadata !424}
!505 = metadata !{i32 461, i32 0, metadata !495, metadata !424}
!506 = metadata !{i32 463, i32 0, metadata !495, metadata !424}
!507 = metadata !{i32 465, i32 0, metadata !508, metadata !424}
!508 = metadata !{i32 786443, metadata !1, metadata !495, i32 465, i32 0, i32 53} ; [ DW_TAG_lexical_block ] [/home/czuo/locabug/tests/nxt-bad.c]
!509 = metadata !{i32 466, i32 0, metadata !510, metadata !424}
!510 = metadata !{i32 786443, metadata !1, metadata !508, i32 465, i32 0, i32 54} ; [ DW_TAG_lexical_block ] [/home/czuo/locabug/tests/nxt-bad.c]
!511 = metadata !{i32 467, i32 0, metadata !510, metadata !424}
!512 = metadata !{i32 468, i32 0, metadata !510, metadata !424}
!513 = metadata !{i32 324, i32 0, metadata !343, metadata !514}
!514 = metadata !{i32 471, i32 0, metadata !515, metadata !424}
!515 = metadata !{i32 786443, metadata !1, metadata !495, i32 471, i32 0, i32 55} ; [ DW_TAG_lexical_block ] [/home/czuo/locabug/tests/nxt-bad.c]
!516 = metadata !{i32 203, i32 0, metadata !53, metadata !513}
!517 = metadata !{i32 204, i32 0, metadata !287, metadata !513}
!518 = metadata !{i32 472, i32 0, metadata !519, metadata !424}
!519 = metadata !{i32 786443, metadata !1, metadata !515, i32 471, i32 0, i32 56} ; [ DW_TAG_lexical_block ] [/home/czuo/locabug/tests/nxt-bad.c]
!520 = metadata !{i32 473, i32 0, metadata !519, metadata !424}
!521 = metadata !{i32 474, i32 0, metadata !519, metadata !424}
!522 = metadata !{i32 476, i32 0, metadata !495, metadata !424}
!523 = metadata !{i32 477, i32 0, metadata !495, metadata !424}
!524 = metadata !{i32 479, i32 0, metadata !495, metadata !424}
!525 = metadata !{i32 481, i32 0, metadata !495, metadata !424}
!526 = metadata !{i32 485, i32 0, metadata !495, metadata !424}
!527 = metadata !{i32 489, i32 0, metadata !495, metadata !424}
!528 = metadata !{i32 492, i32 0, metadata !495, metadata !424}
!529 = metadata !{i32 496, i32 0, metadata !495, metadata !424}
!530 = metadata !{i32 497, i32 0, metadata !495, metadata !424}
!531 = metadata !{i32 500, i32 0, metadata !532, metadata !424}
!532 = metadata !{i32 786443, metadata !1, metadata !220, i32 500, i32 0, i32 57} ; [ DW_TAG_lexical_block ] [/home/czuo/locabug/tests/nxt-bad.c]
!533 = metadata !{i32 501, i32 0, metadata !534, metadata !424}
!534 = metadata !{i32 786443, metadata !1, metadata !532, i32 500, i32 0, i32 58} ; [ DW_TAG_lexical_block ] [/home/czuo/locabug/tests/nxt-bad.c]
!535 = metadata !{i32 502, i32 0, metadata !534, metadata !424}
!536 = metadata !{i32 504, i32 0, metadata !537, metadata !424}
!537 = metadata !{i32 786443, metadata !1, metadata !220, i32 504, i32 0, i32 59} ; [ DW_TAG_lexical_block ] [/home/czuo/locabug/tests/nxt-bad.c]
!538 = metadata !{i32 506, i32 0, metadata !539, metadata !424}
!539 = metadata !{i32 786443, metadata !1, metadata !537, i32 504, i32 0, i32 60} ; [ DW_TAG_lexical_block ] [/home/czuo/locabug/tests/nxt-bad.c]
!540 = metadata !{i32 508, i32 0, metadata !539, metadata !424}
!541 = metadata !{i32 510, i32 0, metadata !539, metadata !424}
!542 = metadata !{i32 512, i32 0, metadata !543, metadata !424}
!543 = metadata !{i32 786443, metadata !1, metadata !220, i32 512, i32 0, i32 61} ; [ DW_TAG_lexical_block ] [/home/czuo/locabug/tests/nxt-bad.c]
!544 = metadata !{i32 513, i32 0, metadata !545, metadata !424}
!545 = metadata !{i32 786443, metadata !1, metadata !543, i32 512, i32 0, i32 62} ; [ DW_TAG_lexical_block ] [/home/czuo/locabug/tests/nxt-bad.c]
!546 = metadata !{i32 516, i32 0, metadata !545, metadata !424}
!547 = metadata !{i32 517, i32 0, metadata !545, metadata !424}
!548 = metadata !{i32 523, i32 0, metadata !220, metadata !424}
!549 = metadata !{i32 643, i32 0, metadata !211, null}
!550 = metadata !{i32 645, i32 0, metadata !211, null}
