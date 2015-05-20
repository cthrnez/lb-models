; ModuleID = 'lb-iquery-bad.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@something = common global i32 0, align 4
@.str = private unnamed_addr constant [4 x i8] c"msg\00", align 1
@.str1 = private unnamed_addr constant [9 x i8] c"Got here\00", align 1
@.str2 = private unnamed_addr constant [12 x i8] c"Doing stuff\00", align 1
@.str6 = private unnamed_addr constant [10 x i8] c"home free\00", align 1
@.str7 = private unnamed_addr constant [30 x i8] c"req: IQuery class %d type %d\0A\00", align 1
@.str8 = private unnamed_addr constant [63 x i8] c"Copying %d bytes from fname to anbuf which can store %d bytes\0A\00", align 1
@str = private unnamed_addr constant [33 x i8] c"We only support inverse queries!\00"
@str9 = private unnamed_addr constant [34 x i8] c"FORMERR IQuery message length off\00"
@str10 = private unnamed_addr constant [35 x i8] c"FORMERR IQuery packet name problem\00"

; Function Attrs: nounwind uwtable
define i32 @ns_name_skip(i8** nocapture %ptrptr, i8* readnone %eom) #0 {
entry:
  %0 = load i8** %ptrptr, align 8, !dbg !201, !tbaa !202
  %cmp32 = icmp ult i8* %0, %eom, !dbg !206
  br i1 %cmp32, label %land.rhs, label %while.end, !dbg !206

land.rhs:                                         ; preds = %while.cond.backedge, %entry
  %cp.033 = phi i8* [ %cp.0.be, %while.cond.backedge ], [ %0, %entry ]
  %incdec.ptr = getelementptr inbounds i8* %cp.033, i64 1, !dbg !206
  %1 = load i8* %cp.033, align 1, !dbg !206, !tbaa !207
  %cmp1 = icmp eq i8 %1, 0, !dbg !206
  br i1 %cmp1, label %while.end, label %while.body

while.body:                                       ; preds = %land.rhs
  %conv = zext i8 %1 to i32, !dbg !206
  %and = and i32 %conv, 192, !dbg !208
  switch i32 %and, label %return [
    i32 0, label %sw.bb
    i32 64, label %if.then6.i
    i32 192, label %sw.bb9
  ], !dbg !208

sw.bb:                                            ; preds = %while.body
  %idx.ext = zext i8 %1 to i64, !dbg !210
  br label %while.cond.backedge, !dbg !212

while.cond.backedge:                              ; preds = %if.end, %sw.bb
  %incdec.ptr.sum.pn.in = phi i64 [ %idx.ext7, %if.end ], [ %idx.ext, %sw.bb ]
  %incdec.ptr.sum.pn = add i64 %incdec.ptr.sum.pn.in, 1, !dbg !213
  %cp.0.be = getelementptr inbounds i8* %cp.033, i64 %incdec.ptr.sum.pn, !dbg !213
  %cmp = icmp ult i8* %cp.0.be, %eom, !dbg !206
  br i1 %cmp, label %land.rhs, label %while.end, !dbg !206

if.then6.i:                                       ; preds = %while.body
  %cmp8.i = icmp eq i8 %1, 65, !dbg !214
  br i1 %cmp8.i, label %if.then10.i, label %return, !dbg !214

if.then10.i:                                      ; preds = %if.then6.i
  %2 = load i8* %incdec.ptr, align 1, !dbg !220, !tbaa !207
  %conv11.i = zext i8 %2 to i32, !dbg !220
  %cmp12.i = icmp eq i8 %2, 0, !dbg !220
  %conv11.op.i = add i32 %conv11.i, 7, !dbg !223
  %conv11.op.op.i = sdiv i32 %conv11.op.i, 8, !dbg !223
  %conv11.op.op.op.i = add i32 %conv11.op.op.i, 1, !dbg !223
  br i1 %cmp12.i, label %if.end, label %labellen.exit

labellen.exit:                                    ; preds = %if.then10.i
  %cmp5 = icmp slt i32 %conv11.op.op.op.i, 0, !dbg !218
  br i1 %cmp5, label %return, label %if.end, !dbg !218

if.end:                                           ; preds = %labellen.exit, %if.then10.i
  %retval.0.i29 = phi i32 [ %conv11.op.op.op.i, %labellen.exit ], [ 33, %if.then10.i ]
  %idx.ext7 = sext i32 %retval.0.i29 to i64, !dbg !213
  br label %while.cond.backedge, !dbg !224

sw.bb9:                                           ; preds = %while.body
  %incdec.ptr10 = getelementptr inbounds i8* %cp.033, i64 2, !dbg !225
  br label %while.end, !dbg !226

while.end:                                        ; preds = %sw.bb9, %while.cond.backedge, %land.rhs, %entry
  %cp.1 = phi i8* [ %incdec.ptr10, %sw.bb9 ], [ %0, %entry ], [ %incdec.ptr, %land.rhs ], [ %cp.0.be, %while.cond.backedge ]
  %cmp11 = icmp ugt i8* %cp.1, %eom, !dbg !227
  br i1 %cmp11, label %return, label %if.end14, !dbg !227

if.end14:                                         ; preds = %while.end
  store i8* %cp.1, i8** %ptrptr, align 8, !dbg !229, !tbaa !202
  br label %return, !dbg !230

return:                                           ; preds = %if.end14, %while.end, %labellen.exit, %if.then6.i, %while.body
  %retval.0 = phi i32 [ 0, %if.end14 ], [ -1, %while.end ], [ -1, %labellen.exit ], [ -1, %while.body ], [ -1, %if.then6.i ]
  ret i32 %retval.0, !dbg !231
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind readonly uwtable
define i32 @__dn_skipname(i8* %ptr, i8* readnone %eom) #2 {
entry:
  %cmp32.i = icmp ult i8* %ptr, %eom, !dbg !232
  br i1 %cmp32.i, label %land.rhs.i, label %while.end.i, !dbg !232

land.rhs.i:                                       ; preds = %while.cond.backedge.i, %entry
  %cp.033.i = phi i8* [ %cp.0.be.i, %while.cond.backedge.i ], [ %ptr, %entry ]
  %incdec.ptr.i = getelementptr inbounds i8* %cp.033.i, i64 1, !dbg !232
  %0 = load i8* %cp.033.i, align 1, !dbg !232, !tbaa !207
  %cmp1.i = icmp eq i8 %0, 0, !dbg !232
  br i1 %cmp1.i, label %while.end.i, label %while.body.i

while.body.i:                                     ; preds = %land.rhs.i
  %conv.i = zext i8 %0 to i32, !dbg !232
  %and.i = and i32 %conv.i, 192, !dbg !235
  switch i32 %and.i, label %return [
    i32 0, label %sw.bb.i
    i32 64, label %if.then6.i.i
    i32 192, label %sw.bb9.i
  ], !dbg !235

sw.bb.i:                                          ; preds = %while.body.i
  %idx.ext.i = zext i8 %0 to i64, !dbg !236
  br label %while.cond.backedge.i, !dbg !237

while.cond.backedge.i:                            ; preds = %if.end.i, %sw.bb.i
  %incdec.ptr.sum.pn.in.i = phi i64 [ %idx.ext7.i, %if.end.i ], [ %idx.ext.i, %sw.bb.i ]
  %incdec.ptr.sum.pn.i = add i64 %incdec.ptr.sum.pn.in.i, 1, !dbg !238
  %cp.0.be.i = getelementptr inbounds i8* %cp.033.i, i64 %incdec.ptr.sum.pn.i, !dbg !238
  %cmp.i = icmp ult i8* %cp.0.be.i, %eom, !dbg !232
  br i1 %cmp.i, label %land.rhs.i, label %while.end.i, !dbg !232

if.then6.i.i:                                     ; preds = %while.body.i
  %cmp8.i.i = icmp eq i8 %0, 65, !dbg !239
  br i1 %cmp8.i.i, label %if.then10.i.i, label %return, !dbg !239

if.then10.i.i:                                    ; preds = %if.then6.i.i
  %1 = load i8* %incdec.ptr.i, align 1, !dbg !241, !tbaa !207
  %conv11.i.i = zext i8 %1 to i32, !dbg !241
  %cmp12.i.i = icmp eq i8 %1, 0, !dbg !241
  %conv11.op.i.i = add i32 %conv11.i.i, 7, !dbg !242
  %conv11.op.op.i.i = sdiv i32 %conv11.op.i.i, 8, !dbg !242
  %conv11.op.op.op.i.i = add i32 %conv11.op.op.i.i, 1, !dbg !242
  br i1 %cmp12.i.i, label %if.end.i, label %labellen.exit.i

labellen.exit.i:                                  ; preds = %if.then10.i.i
  %cmp5.i = icmp slt i32 %conv11.op.op.op.i.i, 0, !dbg !240
  br i1 %cmp5.i, label %return, label %if.end.i, !dbg !240

if.end.i:                                         ; preds = %labellen.exit.i, %if.then10.i.i
  %retval.0.i29.i = phi i32 [ %conv11.op.op.op.i.i, %labellen.exit.i ], [ 33, %if.then10.i.i ]
  %idx.ext7.i = sext i32 %retval.0.i29.i to i64, !dbg !238
  br label %while.cond.backedge.i, !dbg !243

sw.bb9.i:                                         ; preds = %while.body.i
  %incdec.ptr10.i = getelementptr inbounds i8* %cp.033.i, i64 2, !dbg !244
  br label %while.end.i, !dbg !245

while.end.i:                                      ; preds = %sw.bb9.i, %while.cond.backedge.i, %land.rhs.i, %entry
  %cp.1.i = phi i8* [ %incdec.ptr10.i, %sw.bb9.i ], [ %ptr, %entry ], [ %cp.0.be.i, %while.cond.backedge.i ], [ %incdec.ptr.i, %land.rhs.i ]
  %cmp11.i = icmp ugt i8* %cp.1.i, %eom, !dbg !246
  br i1 %cmp11.i, label %return, label %if.end, !dbg !246

if.end:                                           ; preds = %while.end.i
  %sub.ptr.lhs.cast = ptrtoint i8* %cp.1.i to i64, !dbg !247
  %sub.ptr.rhs.cast = ptrtoint i8* %ptr to i64, !dbg !247
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast, !dbg !247
  %conv = trunc i64 %sub.ptr.sub to i32, !dbg !247
  br label %return, !dbg !247

return:                                           ; preds = %if.end, %while.end.i, %labellen.exit.i, %if.then6.i.i, %while.body.i
  %retval.0 = phi i32 [ %conv, %if.end ], [ -1, %while.end.i ], [ -1, %labellen.exit.i ], [ -1, %while.body.i ], [ -1, %if.then6.i.i ]
  ret i32 %retval.0, !dbg !248
}

; Function Attrs: nounwind readnone uwtable
define i32 @create_msg(i8* nocapture readnone %msg, i32 %len, i8* nocapture readnone %filename) #3 {
entry:
  ret i32 39, !dbg !249
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readnone %argv) #0 {
entry:
  %msg = alloca [39 x i8], align 16
  store i32 9283721, i32* @something, align 4, !dbg !250, !tbaa !251
  %0 = getelementptr inbounds [39 x i8]* %msg, i64 0, i64 0, !dbg !253
  %call = call i32 (i8*, i32, i8*, ...)* bitcast (i32 (...)* @klee_make_symbolic to i32 (i8*, i32, i8*, ...)*)(i8* %0, i32 39, i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0)) #4, !dbg !254
  %add.ptr = getelementptr inbounds [39 x i8]* %msg, i64 0, i64 12, !dbg !255
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str1, i64 0, i64 0)) #4, !dbg !256
  %1 = bitcast [39 x i8]* %msg to i96*, !dbg !257
  %bf.load = load i96* %1, align 16, !dbg !257
  %bf.cast = and i96 %bf.load, 7864320, !dbg !257
  %cond = icmp eq i96 %bf.cast, 524288, !dbg !257
  br i1 %cond, label %sw.bb, label %sw.default, !dbg !257

sw.bb:                                            ; preds = %entry
  %add.ptr4 = getelementptr inbounds [39 x i8]* %msg, i64 0, i64 39, !dbg !258
  %call6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([12 x i8]* @.str2, i64 0, i64 0)) #4, !dbg !259
  br label %land.rhs.i.i.i, !dbg !261

land.rhs.i.i.i:                                   ; preds = %while.cond.backedge.i.i.i, %sw.bb
  %cp.033.i.i.i = phi i8* [ %cp.0.be.i.i.i, %while.cond.backedge.i.i.i ], [ %add.ptr, %sw.bb ]
  %incdec.ptr.i.i.i = getelementptr inbounds i8* %cp.033.i.i.i, i64 1, !dbg !261
  %2 = load i8* %cp.033.i.i.i, align 1, !dbg !261, !tbaa !207
  %cmp1.i.i.i = icmp eq i8 %2, 0, !dbg !261
  br i1 %cmp1.i.i.i, label %while.end.i.i.i, label %while.body.i.i.i

while.body.i.i.i:                                 ; preds = %land.rhs.i.i.i
  %conv.i.i.i = zext i8 %2 to i32, !dbg !261
  %and.i.i.i = and i32 %conv.i.i.i, 192, !dbg !266
  switch i32 %and.i.i.i, label %if.then.i [
    i32 0, label %sw.bb.i.i.i
    i32 64, label %if.then6.i.i.i.i
    i32 192, label %sw.bb9.i.i.i
  ], !dbg !266

sw.bb.i.i.i:                                      ; preds = %while.body.i.i.i
  %idx.ext.i.i.i = zext i8 %2 to i64, !dbg !267
  br label %while.cond.backedge.i.i.i, !dbg !268

while.cond.backedge.i.i.i:                        ; preds = %if.end.i.i.i, %sw.bb.i.i.i
  %incdec.ptr.sum.pn.in.i.i.i = phi i64 [ %idx.ext7.i.i.i, %if.end.i.i.i ], [ %idx.ext.i.i.i, %sw.bb.i.i.i ]
  %incdec.ptr.sum.pn.i.i.i = add i64 %incdec.ptr.sum.pn.in.i.i.i, 1, !dbg !269
  %cp.0.be.i.i.i = getelementptr inbounds i8* %cp.033.i.i.i, i64 %incdec.ptr.sum.pn.i.i.i, !dbg !269
  %cmp.i.i.i = icmp ult i8* %cp.0.be.i.i.i, %add.ptr4, !dbg !261
  br i1 %cmp.i.i.i, label %land.rhs.i.i.i, label %while.end.i.i.i, !dbg !261

if.then6.i.i.i.i:                                 ; preds = %while.body.i.i.i
  %cmp8.i.i.i.i = icmp eq i8 %2, 65, !dbg !270
  br i1 %cmp8.i.i.i.i, label %if.then10.i.i.i.i, label %if.then.i, !dbg !270

if.then10.i.i.i.i:                                ; preds = %if.then6.i.i.i.i
  %3 = load i8* %incdec.ptr.i.i.i, align 1, !dbg !272, !tbaa !207
  %conv11.i.i.i.i = zext i8 %3 to i32, !dbg !272
  %cmp12.i.i.i.i = icmp eq i8 %3, 0, !dbg !272
  %conv11.op.i.i.i.i = add i32 %conv11.i.i.i.i, 7, !dbg !273
  %conv11.op.op.i.i.i.i = sdiv i32 %conv11.op.i.i.i.i, 8, !dbg !273
  %conv11.op.op.op.i.i.i.i = add i32 %conv11.op.op.i.i.i.i, 1, !dbg !273
  br i1 %cmp12.i.i.i.i, label %if.end.i.i.i, label %labellen.exit.i.i.i

labellen.exit.i.i.i:                              ; preds = %if.then10.i.i.i.i
  %cmp5.i.i.i = icmp slt i32 %conv11.op.op.op.i.i.i.i, 0, !dbg !271
  br i1 %cmp5.i.i.i, label %if.then.i, label %if.end.i.i.i, !dbg !271

if.end.i.i.i:                                     ; preds = %labellen.exit.i.i.i, %if.then10.i.i.i.i
  %retval.0.i29.i.i.i = phi i32 [ %conv11.op.op.op.i.i.i.i, %labellen.exit.i.i.i ], [ 33, %if.then10.i.i.i.i ]
  %idx.ext7.i.i.i = sext i32 %retval.0.i29.i.i.i to i64, !dbg !269
  br label %while.cond.backedge.i.i.i, !dbg !274

sw.bb9.i.i.i:                                     ; preds = %while.body.i.i.i
  %incdec.ptr10.i.i.i = getelementptr inbounds i8* %cp.033.i.i.i, i64 2, !dbg !275
  br label %while.end.i.i.i, !dbg !276

while.end.i.i.i:                                  ; preds = %sw.bb9.i.i.i, %while.cond.backedge.i.i.i, %land.rhs.i.i.i
  %cp.1.i.i.i = phi i8* [ %incdec.ptr10.i.i.i, %sw.bb9.i.i.i ], [ %cp.0.be.i.i.i, %while.cond.backedge.i.i.i ], [ %incdec.ptr.i.i.i, %land.rhs.i.i.i ]
  %cmp11.i.i.i = icmp ugt i8* %cp.1.i.i.i, %add.ptr4, !dbg !277
  br i1 %cmp11.i.i.i, label %if.then.i, label %__dn_skipname.exit.i, !dbg !277

__dn_skipname.exit.i:                             ; preds = %while.end.i.i.i
  %sub.ptr.lhs.cast.i.i = ptrtoint i8* %cp.1.i.i.i to i64, !dbg !278
  %sub.ptr.rhs.cast.i.i = ptrtoint i8* %add.ptr to i64, !dbg !278
  %sub.ptr.sub.i.i = sub i64 %sub.ptr.lhs.cast.i.i, %sub.ptr.rhs.cast.i.i, !dbg !278
  %conv.i.i = trunc i64 %sub.ptr.sub.i.i to i32, !dbg !278
  %cmp.i = icmp slt i32 %conv.i.i, 0, !dbg !263
  br i1 %cmp.i, label %if.then.i, label %if.end.i, !dbg !263

if.then.i:                                        ; preds = %__dn_skipname.exit.i, %while.end.i.i.i, %labellen.exit.i.i.i, %if.then6.i.i.i.i, %while.body.i.i.i
  %puts5.i = call i32 @puts(i8* getelementptr inbounds ([35 x i8]* @str10, i64 0, i64 0)) #4, !dbg !279
  %bf.load.i = load i96* %1, align 16, !dbg !281
  %bf.clear.i = and i96 %bf.load.i, -251658241, !dbg !281
  %bf.set.i = or i96 %bf.clear.i, 16777216, !dbg !281
  store i96 %bf.set.i, i96* %1, align 16, !dbg !281
  br label %sw.epilog, !dbg !282

if.end.i:                                         ; preds = %__dn_skipname.exit.i
  %sext.i = shl i64 %sub.ptr.sub.i.i, 32, !dbg !283
  %idx.ext.i = ashr exact i64 %sext.i, 32, !dbg !283
  %add.ptr.sum13 = add i64 %idx.ext.i, 14, !dbg !284
  %add.ptr6.i = getelementptr inbounds [39 x i8]* %msg, i64 0, i64 %add.ptr.sum13, !dbg !284
  %4 = load i8* %add.ptr6.i, align 1, !dbg !285, !tbaa !207
  %conv11.i = zext i8 %4 to i32, !dbg !285
  %shl12.i = shl nuw nsw i32 %conv11.i, 8, !dbg !285
  %add.ptr.sum14 = add i64 %idx.ext.i, 15, !dbg !285
  %arrayidx13.i = getelementptr inbounds [39 x i8]* %msg, i64 0, i64 %add.ptr.sum14, !dbg !285
  %5 = load i8* %arrayidx13.i, align 1, !dbg !285, !tbaa !207
  %conv15.i = zext i8 %5 to i32, !dbg !285
  %or16.i = or i32 %shl12.i, %conv15.i, !dbg !285
  %add.ptr.sum15 = add i64 %idx.ext.i, 20, !dbg !286
  %add.ptr19.i = getelementptr inbounds [39 x i8]* %msg, i64 0, i64 %add.ptr.sum15, !dbg !286
  %6 = load i8* %add.ptr19.i, align 1, !dbg !287, !tbaa !207
  %conv24.i = zext i8 %6 to i64, !dbg !287
  %shl25.i = shl nuw nsw i64 %conv24.i, 8, !dbg !287
  %add.ptr.sum16 = add i64 %idx.ext.i, 21, !dbg !287
  %arrayidx26.i = getelementptr inbounds [39 x i8]* %msg, i64 0, i64 %add.ptr.sum16, !dbg !287
  %7 = load i8* %arrayidx26.i, align 1, !dbg !287, !tbaa !207
  %conv28.i = zext i8 %7 to i64, !dbg !287
  %or29.i = or i64 %shl25.i, %conv28.i, !dbg !287
  %add.ptr19.sum3.i = add i64 %idx.ext.i, 10, !dbg !287
  %add.ptr30.sum.i = add i64 %add.ptr19.sum3.i, %or29.i, !dbg !288
  %cmp34.i = icmp eq i64 %add.ptr30.sum.i, 27, !dbg !289
  br i1 %cmp34.i, label %if.end41.i, label %if.then36.i, !dbg !289

if.then36.i:                                      ; preds = %if.end.i
  %puts.i = call i32 @puts(i8* getelementptr inbounds ([34 x i8]* @str9, i64 0, i64 0)) #4, !dbg !291
  %bf.load38.i = load i96* %1, align 16, !dbg !293
  %bf.clear39.i = and i96 %bf.load38.i, -251658241, !dbg !293
  %bf.set40.i = or i96 %bf.clear39.i, 16777216, !dbg !293
  store i96 %bf.set40.i, i96* %1, align 16, !dbg !293
  br label %sw.epilog, !dbg !294

if.end41.i:                                       ; preds = %if.end.i
  %add.ptr.sum12 = add i64 %idx.ext.i, 13, !dbg !284
  %add.ptr.sum = add i64 %idx.ext.i, 12, !dbg !283
  %arrayidx3.i = getelementptr inbounds [39 x i8]* %msg, i64 0, i64 %add.ptr.sum12, !dbg !284
  %add.ptr.i = getelementptr inbounds [39 x i8]* %msg, i64 0, i64 %add.ptr.sum, !dbg !283
  %8 = load i8* %arrayidx3.i, align 1, !dbg !284, !tbaa !207
  %9 = load i8* %add.ptr.i, align 1, !dbg !284, !tbaa !207
  %conv2.i = zext i8 %9 to i32, !dbg !284
  %conv5.i = zext i8 %8 to i32, !dbg !284
  %shl.i = shl nuw nsw i32 %conv2.i, 8, !dbg !284
  %or.i = or i32 %shl.i, %conv5.i, !dbg !284
  %call42.i = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str6, i64 0, i64 0)) #4, !dbg !295
  %cond.i = icmp ne i32 %or.i, 1, !dbg !296
  %10 = load i32* @something, align 4, !dbg !297, !tbaa !251
  %cmp43.i = icmp eq i32 %10, 0, !dbg !297
  %or.cond.i = or i1 %cond.i, %cmp43.i, !dbg !296
  br i1 %or.cond.i, label %sw.epilog, label %sw.epilog.i, !dbg !296

sw.epilog.i:                                      ; preds = %if.end41.i
  %call47.i = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([30 x i8]* @.str7, i64 0, i64 0), i32 %or16.i, i32 1) #4, !dbg !300
  %call50.i = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([63 x i8]* @.str8, i64 0, i64 0), i32 27, i64 2) #4, !dbg !301
  br label %sw.epilog, !dbg !302

sw.default:                                       ; preds = %entry
  %puts = call i32 @puts(i8* getelementptr inbounds ([33 x i8]* @str, i64 0, i64 0)), !dbg !303
  br label %sw.epilog, !dbg !304

sw.epilog:                                        ; preds = %sw.default, %sw.epilog.i, %if.end41.i, %if.then36.i, %if.then.i
  ret i32 0, !dbg !305
}

; Function Attrs: nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #4

declare i32 @klee_make_symbolic(...) #5

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #6

; Function Attrs: nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #4

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) #4

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind readonly uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!198, !199}
!llvm.ident = !{!200}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !2, metadata !27, metadata !28, metadata !196, metadata !27, metadata !""} ; [ DW_TAG_compile_unit ] [/home/czuo/locabug/tests/locabug-iquery-bad.c] [DW_LANG_C99]
!1 = metadata !{metadata !"locabug-iquery-bad.c", metadata !"/home/czuo/locabug/tests"}
!2 = metadata !{metadata !3, metadata !8}
!3 = metadata !{i32 786436, metadata !1, null, metadata !"req_action", i32 20, i64 32, i64 32, i32 0, i32 0, null, metadata !4, i32 0, null, null, null} ; [ DW_TAG_enumeration_type ] [req_action] [line 20, size 32, align 32, offset 0] [def] [from ]
!4 = metadata !{metadata !5, metadata !6, metadata !7}
!5 = metadata !{i32 786472, metadata !"Finish", i64 0} ; [ DW_TAG_enumerator ] [Finish :: 0]
!6 = metadata !{i32 786472, metadata !"Refuse", i64 1} ; [ DW_TAG_enumerator ] [Refuse :: 1]
!7 = metadata !{i32 786472, metadata !"Return", i64 2} ; [ DW_TAG_enumerator ] [Return :: 2]
!8 = metadata !{i32 786436, metadata !9, null, metadata !"__ns_rcode", i32 190, i64 32, i64 32, i32 0, i32 0, null, metadata !10, i32 0, null, null, null} ; [ DW_TAG_enumeration_type ] [__ns_rcode] [line 190, size 32, align 32, offset 0] [def] [from ]
!9 = metadata !{metadata !"/usr/include/arpa/nameser.h", metadata !"/home/czuo/locabug/tests"}
!10 = metadata !{metadata !11, metadata !12, metadata !13, metadata !14, metadata !15, metadata !16, metadata !17, metadata !18, metadata !19, metadata !20, metadata !21, metadata !22, metadata !23, metadata !24, metadata !25, metadata !26}
!11 = metadata !{i32 786472, metadata !"ns_r_noerror", i64 0} ; [ DW_TAG_enumerator ] [ns_r_noerror :: 0]
!12 = metadata !{i32 786472, metadata !"ns_r_formerr", i64 1} ; [ DW_TAG_enumerator ] [ns_r_formerr :: 1]
!13 = metadata !{i32 786472, metadata !"ns_r_servfail", i64 2} ; [ DW_TAG_enumerator ] [ns_r_servfail :: 2]
!14 = metadata !{i32 786472, metadata !"ns_r_nxdomain", i64 3} ; [ DW_TAG_enumerator ] [ns_r_nxdomain :: 3]
!15 = metadata !{i32 786472, metadata !"ns_r_notimpl", i64 4} ; [ DW_TAG_enumerator ] [ns_r_notimpl :: 4]
!16 = metadata !{i32 786472, metadata !"ns_r_refused", i64 5} ; [ DW_TAG_enumerator ] [ns_r_refused :: 5]
!17 = metadata !{i32 786472, metadata !"ns_r_yxdomain", i64 6} ; [ DW_TAG_enumerator ] [ns_r_yxdomain :: 6]
!18 = metadata !{i32 786472, metadata !"ns_r_yxrrset", i64 7} ; [ DW_TAG_enumerator ] [ns_r_yxrrset :: 7]
!19 = metadata !{i32 786472, metadata !"ns_r_nxrrset", i64 8} ; [ DW_TAG_enumerator ] [ns_r_nxrrset :: 8]
!20 = metadata !{i32 786472, metadata !"ns_r_notauth", i64 9} ; [ DW_TAG_enumerator ] [ns_r_notauth :: 9]
!21 = metadata !{i32 786472, metadata !"ns_r_notzone", i64 10} ; [ DW_TAG_enumerator ] [ns_r_notzone :: 10]
!22 = metadata !{i32 786472, metadata !"ns_r_max", i64 11} ; [ DW_TAG_enumerator ] [ns_r_max :: 11]
!23 = metadata !{i32 786472, metadata !"ns_r_badvers", i64 16} ; [ DW_TAG_enumerator ] [ns_r_badvers :: 16]
!24 = metadata !{i32 786472, metadata !"ns_r_badsig", i64 16} ; [ DW_TAG_enumerator ] [ns_r_badsig :: 16]
!25 = metadata !{i32 786472, metadata !"ns_r_badkey", i64 17} ; [ DW_TAG_enumerator ] [ns_r_badkey :: 17]
!26 = metadata !{i32 786472, metadata !"ns_r_badtime", i64 18} ; [ DW_TAG_enumerator ] [ns_r_badtime :: 18]
!27 = metadata !{i32 0}
!28 = metadata !{metadata !29, metadata !49, metadata !56, metadata !124, metadata !160, metadata !189}
!29 = metadata !{i32 786478, metadata !1, metadata !30, metadata !"ns_name_skip", metadata !"ns_name_skip", metadata !"", i32 49, metadata !31, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i8*)* @ns_name_skip, null, null, metadata !40, i32 50} ; [ DW_TAG_subprogram ] [line 49] [def] [scope 50] [ns_name_skip]
!30 = metadata !{i32 786473, metadata !1}         ; [ DW_TAG_file_type ] [/home/czuo/locabug/tests/locabug-iquery-bad.c]
!31 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !32, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!32 = metadata !{metadata !33, metadata !34, metadata !35}
!33 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!34 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !35} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!35 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !36} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!36 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !37} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from u_char]
!37 = metadata !{i32 786454, metadata !1, null, metadata !"u_char", i32 34, i64 0, i64 0, i64 0, i32 0, metadata !38} ; [ DW_TAG_typedef ] [u_char] [line 34, size 0, align 0, offset 0] [from __u_char]
!38 = metadata !{i32 786454, metadata !1, null, metadata !"__u_char", i32 31, i64 0, i64 0, i64 0, i32 0, metadata !39} ; [ DW_TAG_typedef ] [__u_char] [line 31, size 0, align 0, offset 0] [from unsigned char]
!39 = metadata !{i32 786468, null, null, metadata !"unsigned char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 8} ; [ DW_TAG_base_type ] [unsigned char] [line 0, size 8, align 8, offset 0, enc DW_ATE_unsigned_char]
!40 = metadata !{metadata !41, metadata !42, metadata !43, metadata !44, metadata !48}
!41 = metadata !{i32 786689, metadata !29, metadata !"ptrptr", metadata !30, i32 16777265, metadata !34, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ptrptr] [line 49]
!42 = metadata !{i32 786689, metadata !29, metadata !"eom", metadata !30, i32 33554481, metadata !35, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [eom] [line 49]
!43 = metadata !{i32 786688, metadata !29, metadata !"cp", metadata !30, i32 51, metadata !35, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [cp] [line 51]
!44 = metadata !{i32 786688, metadata !29, metadata !"n", metadata !30, i32 52, metadata !45, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [n] [line 52]
!45 = metadata !{i32 786454, metadata !1, null, metadata !"u_int", i32 36, i64 0, i64 0, i64 0, i32 0, metadata !46} ; [ DW_TAG_typedef ] [u_int] [line 36, size 0, align 0, offset 0] [from __u_int]
!46 = metadata !{i32 786454, metadata !1, null, metadata !"__u_int", i32 33, i64 0, i64 0, i64 0, i32 0, metadata !47} ; [ DW_TAG_typedef ] [__u_int] [line 33, size 0, align 0, offset 0] [from unsigned int]
!47 = metadata !{i32 786468, null, null, metadata !"unsigned int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!48 = metadata !{i32 786688, metadata !29, metadata !"l", metadata !30, i32 53, metadata !33, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [l] [line 53]
!49 = metadata !{i32 786478, metadata !1, metadata !30, metadata !"__dn_skipname", metadata !"__dn_skipname", metadata !"", i32 87, metadata !50, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*)* @__dn_skipname, null, null, metadata !52, i32 87} ; [ DW_TAG_subprogram ] [line 87] [def] [__dn_skipname]
!50 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !51, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!51 = metadata !{metadata !33, metadata !35, metadata !35}
!52 = metadata !{metadata !53, metadata !54, metadata !55}
!53 = metadata !{i32 786689, metadata !49, metadata !"ptr", metadata !30, i32 16777303, metadata !35, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ptr] [line 87]
!54 = metadata !{i32 786689, metadata !49, metadata !"eom", metadata !30, i32 33554519, metadata !35, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [eom] [line 87]
!55 = metadata !{i32 786688, metadata !49, metadata !"saveptr", metadata !30, i32 88, metadata !35, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [saveptr] [line 88]
!56 = metadata !{i32 786478, metadata !1, metadata !30, metadata !"create_msg", metadata !"create_msg", metadata !"", i32 155, metadata !57, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, i8*)* @create_msg, null, null, metadata !62, i32 155} ; [ DW_TAG_subprogram ] [line 155] [def] [create_msg]
!57 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !58, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!58 = metadata !{metadata !33, metadata !59, metadata !33, metadata !60}
!59 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !37} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from u_char]
!60 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !61} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!61 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!62 = metadata !{metadata !63, metadata !64, metadata !65, metadata !66, metadata !122, metadata !123}
!63 = metadata !{i32 786689, metadata !56, metadata !"msg", metadata !30, i32 16777371, metadata !59, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [msg] [line 155]
!64 = metadata !{i32 786689, metadata !56, metadata !"len", metadata !30, i32 33554587, metadata !33, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [len] [line 155]
!65 = metadata !{i32 786689, metadata !56, metadata !"filename", metadata !30, i32 50331803, metadata !60, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [filename] [line 155]
!66 = metadata !{i32 786688, metadata !56, metadata !"f", metadata !30, i32 157, metadata !67, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [f] [line 157]
!67 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !68} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from FILE]
!68 = metadata !{i32 786454, metadata !1, null, metadata !"FILE", i32 49, i64 0, i64 0, i64 0, i32 0, metadata !69} ; [ DW_TAG_typedef ] [FILE] [line 49, size 0, align 0, offset 0] [from _IO_FILE]
!69 = metadata !{i32 786451, metadata !70, null, metadata !"_IO_FILE", i32 271, i64 1728, i64 64, i32 0, i32 0, null, metadata !71, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [_IO_FILE] [line 271, size 1728, align 64, offset 0] [def] [from ]
!70 = metadata !{metadata !"/usr/include/libio.h", metadata !"/home/czuo/locabug/tests"}
!71 = metadata !{metadata !72, metadata !73, metadata !74, metadata !75, metadata !76, metadata !77, metadata !78, metadata !79, metadata !80, metadata !81, metadata !82, metadata !83, metadata !84, metadata !92, metadata !93, metadata !94, metadata !95, metadata !98, metadata !100, metadata !102, metadata !106, metadata !108, metadata !110, metadata !111, metadata !112, metadata !113, metadata !114, metadata !117, metadata !118}
!72 = metadata !{i32 786445, metadata !70, metadata !69, metadata !"_flags", i32 272, i64 32, i64 32, i64 0, i32 0, metadata !33} ; [ DW_TAG_member ] [_flags] [line 272, size 32, align 32, offset 0] [from int]
!73 = metadata !{i32 786445, metadata !70, metadata !69, metadata !"_IO_read_ptr", i32 277, i64 64, i64 64, i64 64, i32 0, metadata !60} ; [ DW_TAG_member ] [_IO_read_ptr] [line 277, size 64, align 64, offset 64] [from ]
!74 = metadata !{i32 786445, metadata !70, metadata !69, metadata !"_IO_read_end", i32 278, i64 64, i64 64, i64 128, i32 0, metadata !60} ; [ DW_TAG_member ] [_IO_read_end] [line 278, size 64, align 64, offset 128] [from ]
!75 = metadata !{i32 786445, metadata !70, metadata !69, metadata !"_IO_read_base", i32 279, i64 64, i64 64, i64 192, i32 0, metadata !60} ; [ DW_TAG_member ] [_IO_read_base] [line 279, size 64, align 64, offset 192] [from ]
!76 = metadata !{i32 786445, metadata !70, metadata !69, metadata !"_IO_write_base", i32 280, i64 64, i64 64, i64 256, i32 0, metadata !60} ; [ DW_TAG_member ] [_IO_write_base] [line 280, size 64, align 64, offset 256] [from ]
!77 = metadata !{i32 786445, metadata !70, metadata !69, metadata !"_IO_write_ptr", i32 281, i64 64, i64 64, i64 320, i32 0, metadata !60} ; [ DW_TAG_member ] [_IO_write_ptr] [line 281, size 64, align 64, offset 320] [from ]
!78 = metadata !{i32 786445, metadata !70, metadata !69, metadata !"_IO_write_end", i32 282, i64 64, i64 64, i64 384, i32 0, metadata !60} ; [ DW_TAG_member ] [_IO_write_end] [line 282, size 64, align 64, offset 384] [from ]
!79 = metadata !{i32 786445, metadata !70, metadata !69, metadata !"_IO_buf_base", i32 283, i64 64, i64 64, i64 448, i32 0, metadata !60} ; [ DW_TAG_member ] [_IO_buf_base] [line 283, size 64, align 64, offset 448] [from ]
!80 = metadata !{i32 786445, metadata !70, metadata !69, metadata !"_IO_buf_end", i32 284, i64 64, i64 64, i64 512, i32 0, metadata !60} ; [ DW_TAG_member ] [_IO_buf_end] [line 284, size 64, align 64, offset 512] [from ]
!81 = metadata !{i32 786445, metadata !70, metadata !69, metadata !"_IO_save_base", i32 286, i64 64, i64 64, i64 576, i32 0, metadata !60} ; [ DW_TAG_member ] [_IO_save_base] [line 286, size 64, align 64, offset 576] [from ]
!82 = metadata !{i32 786445, metadata !70, metadata !69, metadata !"_IO_backup_base", i32 287, i64 64, i64 64, i64 640, i32 0, metadata !60} ; [ DW_TAG_member ] [_IO_backup_base] [line 287, size 64, align 64, offset 640] [from ]
!83 = metadata !{i32 786445, metadata !70, metadata !69, metadata !"_IO_save_end", i32 288, i64 64, i64 64, i64 704, i32 0, metadata !60} ; [ DW_TAG_member ] [_IO_save_end] [line 288, size 64, align 64, offset 704] [from ]
!84 = metadata !{i32 786445, metadata !70, metadata !69, metadata !"_markers", i32 290, i64 64, i64 64, i64 768, i32 0, metadata !85} ; [ DW_TAG_member ] [_markers] [line 290, size 64, align 64, offset 768] [from ]
!85 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !86} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from _IO_marker]
!86 = metadata !{i32 786451, metadata !70, null, metadata !"_IO_marker", i32 186, i64 192, i64 64, i32 0, i32 0, null, metadata !87, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [_IO_marker] [line 186, size 192, align 64, offset 0] [def] [from ]
!87 = metadata !{metadata !88, metadata !89, metadata !91}
!88 = metadata !{i32 786445, metadata !70, metadata !86, metadata !"_next", i32 187, i64 64, i64 64, i64 0, i32 0, metadata !85} ; [ DW_TAG_member ] [_next] [line 187, size 64, align 64, offset 0] [from ]
!89 = metadata !{i32 786445, metadata !70, metadata !86, metadata !"_sbuf", i32 188, i64 64, i64 64, i64 64, i32 0, metadata !90} ; [ DW_TAG_member ] [_sbuf] [line 188, size 64, align 64, offset 64] [from ]
!90 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !69} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from _IO_FILE]
!91 = metadata !{i32 786445, metadata !70, metadata !86, metadata !"_pos", i32 192, i64 32, i64 32, i64 128, i32 0, metadata !33} ; [ DW_TAG_member ] [_pos] [line 192, size 32, align 32, offset 128] [from int]
!92 = metadata !{i32 786445, metadata !70, metadata !69, metadata !"_chain", i32 292, i64 64, i64 64, i64 832, i32 0, metadata !90} ; [ DW_TAG_member ] [_chain] [line 292, size 64, align 64, offset 832] [from ]
!93 = metadata !{i32 786445, metadata !70, metadata !69, metadata !"_fileno", i32 294, i64 32, i64 32, i64 896, i32 0, metadata !33} ; [ DW_TAG_member ] [_fileno] [line 294, size 32, align 32, offset 896] [from int]
!94 = metadata !{i32 786445, metadata !70, metadata !69, metadata !"_flags2", i32 298, i64 32, i64 32, i64 928, i32 0, metadata !33} ; [ DW_TAG_member ] [_flags2] [line 298, size 32, align 32, offset 928] [from int]
!95 = metadata !{i32 786445, metadata !70, metadata !69, metadata !"_old_offset", i32 300, i64 64, i64 64, i64 960, i32 0, metadata !96} ; [ DW_TAG_member ] [_old_offset] [line 300, size 64, align 64, offset 960] [from __off_t]
!96 = metadata !{i32 786454, metadata !70, null, metadata !"__off_t", i32 141, i64 0, i64 0, i64 0, i32 0, metadata !97} ; [ DW_TAG_typedef ] [__off_t] [line 141, size 0, align 0, offset 0] [from long int]
!97 = metadata !{i32 786468, null, null, metadata !"long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!98 = metadata !{i32 786445, metadata !70, metadata !69, metadata !"_cur_column", i32 304, i64 16, i64 16, i64 1024, i32 0, metadata !99} ; [ DW_TAG_member ] [_cur_column] [line 304, size 16, align 16, offset 1024] [from unsigned short]
!99 = metadata !{i32 786468, null, null, metadata !"unsigned short", i32 0, i64 16, i64 16, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [unsigned short] [line 0, size 16, align 16, offset 0, enc DW_ATE_unsigned]
!100 = metadata !{i32 786445, metadata !70, metadata !69, metadata !"_vtable_offset", i32 305, i64 8, i64 8, i64 1040, i32 0, metadata !101} ; [ DW_TAG_member ] [_vtable_offset] [line 305, size 8, align 8, offset 1040] [from signed char]
!101 = metadata !{i32 786468, null, null, metadata !"signed char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [signed char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!102 = metadata !{i32 786445, metadata !70, metadata !69, metadata !"_shortbuf", i32 306, i64 8, i64 8, i64 1048, i32 0, metadata !103} ; [ DW_TAG_member ] [_shortbuf] [line 306, size 8, align 8, offset 1048] [from ]
!103 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 8, i64 8, i32 0, i32 0, metadata !61, metadata !104, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 8, align 8, offset 0] [from char]
!104 = metadata !{metadata !105}
!105 = metadata !{i32 786465, i64 0, i64 1}       ; [ DW_TAG_subrange_type ] [0, 0]
!106 = metadata !{i32 786445, metadata !70, metadata !69, metadata !"_lock", i32 310, i64 64, i64 64, i64 1088, i32 0, metadata !107} ; [ DW_TAG_member ] [_lock] [line 310, size 64, align 64, offset 1088] [from ]
!107 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!108 = metadata !{i32 786445, metadata !70, metadata !69, metadata !"_offset", i32 319, i64 64, i64 64, i64 1152, i32 0, metadata !109} ; [ DW_TAG_member ] [_offset] [line 319, size 64, align 64, offset 1152] [from __off64_t]
!109 = metadata !{i32 786454, metadata !70, null, metadata !"__off64_t", i32 142, i64 0, i64 0, i64 0, i32 0, metadata !97} ; [ DW_TAG_typedef ] [__off64_t] [line 142, size 0, align 0, offset 0] [from long int]
!110 = metadata !{i32 786445, metadata !70, metadata !69, metadata !"__pad1", i32 328, i64 64, i64 64, i64 1216, i32 0, metadata !107} ; [ DW_TAG_member ] [__pad1] [line 328, size 64, align 64, offset 1216] [from ]
!111 = metadata !{i32 786445, metadata !70, metadata !69, metadata !"__pad2", i32 329, i64 64, i64 64, i64 1280, i32 0, metadata !107} ; [ DW_TAG_member ] [__pad2] [line 329, size 64, align 64, offset 1280] [from ]
!112 = metadata !{i32 786445, metadata !70, metadata !69, metadata !"__pad3", i32 330, i64 64, i64 64, i64 1344, i32 0, metadata !107} ; [ DW_TAG_member ] [__pad3] [line 330, size 64, align 64, offset 1344] [from ]
!113 = metadata !{i32 786445, metadata !70, metadata !69, metadata !"__pad4", i32 331, i64 64, i64 64, i64 1408, i32 0, metadata !107} ; [ DW_TAG_member ] [__pad4] [line 331, size 64, align 64, offset 1408] [from ]
!114 = metadata !{i32 786445, metadata !70, metadata !69, metadata !"__pad5", i32 332, i64 64, i64 64, i64 1472, i32 0, metadata !115} ; [ DW_TAG_member ] [__pad5] [line 332, size 64, align 64, offset 1472] [from size_t]
!115 = metadata !{i32 786454, metadata !70, null, metadata !"size_t", i32 42, i64 0, i64 0, i64 0, i32 0, metadata !116} ; [ DW_TAG_typedef ] [size_t] [line 42, size 0, align 0, offset 0] [from long unsigned int]
!116 = metadata !{i32 786468, null, null, metadata !"long unsigned int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!117 = metadata !{i32 786445, metadata !70, metadata !69, metadata !"_mode", i32 334, i64 32, i64 32, i64 1536, i32 0, metadata !33} ; [ DW_TAG_member ] [_mode] [line 334, size 32, align 32, offset 1536] [from int]
!118 = metadata !{i32 786445, metadata !70, metadata !69, metadata !"_unused2", i32 336, i64 160, i64 8, i64 1568, i32 0, metadata !119} ; [ DW_TAG_member ] [_unused2] [line 336, size 160, align 8, offset 1568] [from ]
!119 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 160, i64 8, i32 0, i32 0, metadata !61, metadata !120, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 160, align 8, offset 0] [from char]
!120 = metadata !{metadata !121}
!121 = metadata !{i32 786465, i64 0, i64 20}      ; [ DW_TAG_subrange_type ] [0, 19]
!122 = metadata !{i32 786688, metadata !56, metadata !"i", metadata !30, i32 158, metadata !33, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 158]
!123 = metadata !{i32 786688, metadata !56, metadata !"c", metadata !30, i32 159, metadata !33, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [c] [line 159]
!124 = metadata !{i32 786478, metadata !1, metadata !30, metadata !"main", metadata !"main", metadata !"", i32 181, metadata !125, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i8**)* @main, null, null, metadata !128, i32 181} ; [ DW_TAG_subprogram ] [line 181] [def] [main]
!125 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !126, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!126 = metadata !{metadata !33, metadata !33, metadata !127}
!127 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !60} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!128 = metadata !{metadata !129, metadata !130, metadata !131, metadata !152, metadata !153, metadata !154, metadata !155, metadata !156}
!129 = metadata !{i32 786689, metadata !124, metadata !"argc", metadata !30, i32 16777397, metadata !33, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argc] [line 181]
!130 = metadata !{i32 786689, metadata !124, metadata !"argv", metadata !30, i32 33554613, metadata !127, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argv] [line 181]
!131 = metadata !{i32 786688, metadata !124, metadata !"hp", metadata !30, i32 183, metadata !132, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [hp] [line 183]
!132 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !133} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from HEADER]
!133 = metadata !{i32 786454, metadata !1, null, metadata !"HEADER", i32 83, i64 0, i64 0, i64 0, i32 0, metadata !134} ; [ DW_TAG_typedef ] [HEADER] [line 83, size 0, align 0, offset 0] [from ]
!134 = metadata !{i32 786451, metadata !135, null, metadata !"", i32 48, i64 96, i64 32, i32 0, i32 0, null, metadata !136, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [line 48, size 96, align 32, offset 0] [def] [from ]
!135 = metadata !{metadata !"/usr/include/arpa/nameser_compat.h", metadata !"/home/czuo/locabug/tests"}
!136 = metadata !{metadata !137, metadata !138, metadata !139, metadata !140, metadata !141, metadata !142, metadata !143, metadata !144, metadata !145, metadata !146, metadata !147, metadata !148, metadata !149, metadata !150, metadata !151}
!137 = metadata !{i32 786445, metadata !135, metadata !134, metadata !"id", i32 49, i64 16, i64 32, i64 0, i32 0, metadata !47} ; [ DW_TAG_member ] [id] [line 49, size 16, align 32, offset 0] [from unsigned int]
!138 = metadata !{i32 786445, metadata !135, metadata !134, metadata !"rd", i32 66, i64 1, i64 32, i64 16, i32 0, metadata !47} ; [ DW_TAG_member ] [rd] [line 66, size 1, align 32, offset 16] [from unsigned int]
!139 = metadata !{i32 786445, metadata !135, metadata !134, metadata !"tc", i32 67, i64 1, i64 32, i64 17, i32 0, metadata !47} ; [ DW_TAG_member ] [tc] [line 67, size 1, align 32, offset 17] [from unsigned int]
!140 = metadata !{i32 786445, metadata !135, metadata !134, metadata !"aa", i32 68, i64 1, i64 32, i64 18, i32 0, metadata !47} ; [ DW_TAG_member ] [aa] [line 68, size 1, align 32, offset 18] [from unsigned int]
!141 = metadata !{i32 786445, metadata !135, metadata !134, metadata !"opcode", i32 69, i64 4, i64 32, i64 19, i32 0, metadata !47} ; [ DW_TAG_member ] [opcode] [line 69, size 4, align 32, offset 19] [from unsigned int]
!142 = metadata !{i32 786445, metadata !135, metadata !134, metadata !"qr", i32 70, i64 1, i64 32, i64 23, i32 0, metadata !47} ; [ DW_TAG_member ] [qr] [line 70, size 1, align 32, offset 23] [from unsigned int]
!143 = metadata !{i32 786445, metadata !135, metadata !134, metadata !"rcode", i32 72, i64 4, i64 32, i64 24, i32 0, metadata !47} ; [ DW_TAG_member ] [rcode] [line 72, size 4, align 32, offset 24] [from unsigned int]
!144 = metadata !{i32 786445, metadata !135, metadata !134, metadata !"cd", i32 73, i64 1, i64 32, i64 28, i32 0, metadata !47} ; [ DW_TAG_member ] [cd] [line 73, size 1, align 32, offset 28] [from unsigned int]
!145 = metadata !{i32 786445, metadata !135, metadata !134, metadata !"ad", i32 74, i64 1, i64 32, i64 29, i32 0, metadata !47} ; [ DW_TAG_member ] [ad] [line 74, size 1, align 32, offset 29] [from unsigned int]
!146 = metadata !{i32 786445, metadata !135, metadata !134, metadata !"unused", i32 75, i64 1, i64 32, i64 30, i32 0, metadata !47} ; [ DW_TAG_member ] [unused] [line 75, size 1, align 32, offset 30] [from unsigned int]
!147 = metadata !{i32 786445, metadata !135, metadata !134, metadata !"ra", i32 76, i64 1, i64 32, i64 31, i32 0, metadata !47} ; [ DW_TAG_member ] [ra] [line 76, size 1, align 32, offset 31] [from unsigned int]
!148 = metadata !{i32 786445, metadata !135, metadata !134, metadata !"qdcount", i32 79, i64 16, i64 32, i64 32, i32 0, metadata !47} ; [ DW_TAG_member ] [qdcount] [line 79, size 16, align 32, offset 32] [from unsigned int]
!149 = metadata !{i32 786445, metadata !135, metadata !134, metadata !"ancount", i32 80, i64 16, i64 32, i64 48, i32 0, metadata !47} ; [ DW_TAG_member ] [ancount] [line 80, size 16, align 32, offset 48] [from unsigned int]
!150 = metadata !{i32 786445, metadata !135, metadata !134, metadata !"nscount", i32 81, i64 16, i64 32, i64 64, i32 0, metadata !47} ; [ DW_TAG_member ] [nscount] [line 81, size 16, align 32, offset 64] [from unsigned int]
!151 = metadata !{i32 786445, metadata !135, metadata !134, metadata !"arcount", i32 82, i64 16, i64 32, i64 80, i32 0, metadata !47} ; [ DW_TAG_member ] [arcount] [line 82, size 16, align 32, offset 80] [from unsigned int]
!152 = metadata !{i32 786688, metadata !124, metadata !"cp", metadata !30, i32 184, metadata !59, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [cp] [line 184]
!153 = metadata !{i32 786688, metadata !124, metadata !"eom", metadata !30, i32 184, metadata !59, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [eom] [line 184]
!154 = metadata !{i32 786688, metadata !124, metadata !"msglen", metadata !30, i32 185, metadata !33, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [msglen] [line 185]
!155 = metadata !{i32 786688, metadata !124, metadata !"f", metadata !30, i32 186, metadata !67, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [f] [line 186]
!156 = metadata !{i32 786688, metadata !124, metadata !"msg", metadata !30, i32 199, metadata !157, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [msg] [line 199]
!157 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 312, i64 8, i32 0, i32 0, metadata !37, metadata !158, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 312, align 8, offset 0] [from u_char]
!158 = metadata !{metadata !159}
!159 = metadata !{i32 786465, i64 0, i64 39}      ; [ DW_TAG_subrange_type ] [0, 38]
!160 = metadata !{i32 786478, metadata !1, metadata !30, metadata !"req_iquery", metadata !"req_iquery", metadata !"", i32 96, metadata !161, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !165, i32 97} ; [ DW_TAG_subprogram ] [line 96] [local] [def] [scope 97] [req_iquery]
!161 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !162, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!162 = metadata !{metadata !3, metadata !132, metadata !163, metadata !59, metadata !164, metadata !59}
!163 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !59} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!164 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !33} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int]
!165 = metadata !{metadata !166, metadata !167, metadata !168, metadata !169, metadata !170, metadata !171, metadata !172, metadata !173, metadata !174, metadata !175, metadata !176, metadata !177, metadata !181, metadata !182, metadata !183, metadata !185, metadata !187}
!166 = metadata !{i32 786689, metadata !160, metadata !"hp", metadata !30, i32 16777312, metadata !132, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hp] [line 96]
!167 = metadata !{i32 786689, metadata !160, metadata !"cpp", metadata !30, i32 33554528, metadata !163, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [cpp] [line 96]
!168 = metadata !{i32 786689, metadata !160, metadata !"eom", metadata !30, i32 50331744, metadata !59, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [eom] [line 96]
!169 = metadata !{i32 786689, metadata !160, metadata !"buflenp", metadata !30, i32 67108960, metadata !164, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [buflenp] [line 96]
!170 = metadata !{i32 786689, metadata !160, metadata !"msg", metadata !30, i32 83886176, metadata !59, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [msg] [line 96]
!171 = metadata !{i32 786688, metadata !160, metadata !"dlen", metadata !30, i32 98, metadata !33, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dlen] [line 98]
!172 = metadata !{i32 786688, metadata !160, metadata !"alen", metadata !30, i32 98, metadata !33, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [alen] [line 98]
!173 = metadata !{i32 786688, metadata !160, metadata !"n", metadata !30, i32 98, metadata !33, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [n] [line 98]
!174 = metadata !{i32 786688, metadata !160, metadata !"type", metadata !30, i32 98, metadata !33, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [type] [line 98]
!175 = metadata !{i32 786688, metadata !160, metadata !"class", metadata !30, i32 98, metadata !33, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [class] [line 98]
!176 = metadata !{i32 786688, metadata !160, metadata !"count", metadata !30, i32 98, metadata !33, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [count] [line 98]
!177 = metadata !{i32 786688, metadata !160, metadata !"anbuf", metadata !30, i32 99, metadata !178, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [anbuf] [line 99]
!178 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 16, i64 8, i32 0, i32 0, metadata !61, metadata !179, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 16, align 8, offset 0] [from char]
!179 = metadata !{metadata !180}
!180 = metadata !{i32 786465, i64 0, i64 2}       ; [ DW_TAG_subrange_type ] [0, 1]
!181 = metadata !{i32 786688, metadata !160, metadata !"data", metadata !30, i32 99, metadata !60, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [data] [line 99]
!182 = metadata !{i32 786688, metadata !160, metadata !"fname", metadata !30, i32 99, metadata !60, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [fname] [line 99]
!183 = metadata !{i32 786688, metadata !184, metadata !"t_cp", metadata !30, i32 110, metadata !35, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [t_cp] [line 110]
!184 = metadata !{i32 786443, metadata !1, metadata !160, i32 110, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/czuo/locabug/tests/locabug-iquery-bad.c]
!185 = metadata !{i32 786688, metadata !186, metadata !"t_cp", metadata !30, i32 111, metadata !35, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [t_cp] [line 111]
!186 = metadata !{i32 786443, metadata !1, metadata !160, i32 111, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/czuo/locabug/tests/locabug-iquery-bad.c]
!187 = metadata !{i32 786688, metadata !188, metadata !"t_cp", metadata !30, i32 113, metadata !35, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [t_cp] [line 113]
!188 = metadata !{i32 786443, metadata !1, metadata !160, i32 113, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/czuo/locabug/tests/locabug-iquery-bad.c]
!189 = metadata !{i32 786478, metadata !1, metadata !30, metadata !"labellen", metadata !"labellen", metadata !"", i32 27, metadata !190, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !192, i32 28} ; [ DW_TAG_subprogram ] [line 27] [local] [def] [scope 28] [labellen]
!190 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !191, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!191 = metadata !{metadata !33, metadata !35}
!192 = metadata !{metadata !193, metadata !194, metadata !195}
!193 = metadata !{i32 786689, metadata !189, metadata !"lp", metadata !30, i32 16777243, metadata !35, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [lp] [line 27]
!194 = metadata !{i32 786688, metadata !189, metadata !"bitlen", metadata !30, i32 29, metadata !33, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [bitlen] [line 29]
!195 = metadata !{i32 786688, metadata !189, metadata !"l", metadata !30, i32 30, metadata !37, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [l] [line 30]
!196 = metadata !{metadata !197}
!197 = metadata !{i32 786484, i32 0, null, metadata !"something", metadata !"something", metadata !"", metadata !30, i32 22, metadata !33, i32 0, i32 1, i32* @something, null} ; [ DW_TAG_variable ] [something] [line 22] [def]
!198 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!199 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!200 = metadata !{metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)"}
!201 = metadata !{i32 55, i32 0, metadata !29, null}
!202 = metadata !{metadata !203, metadata !203, i64 0}
!203 = metadata !{metadata !"any pointer", metadata !204, i64 0}
!204 = metadata !{metadata !"omnipotent char", metadata !205, i64 0}
!205 = metadata !{metadata !"Simple C/C++ TBAA"}
!206 = metadata !{i32 56, i32 0, metadata !29, null}
!207 = metadata !{metadata !204, metadata !204, i64 0}
!208 = metadata !{i32 58, i32 0, metadata !209, null} ; [ DW_TAG_imported_module ]
!209 = metadata !{i32 786443, metadata !1, metadata !29, i32 56, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/czuo/locabug/tests/locabug-iquery-bad.c]
!210 = metadata !{i32 60, i32 0, metadata !211, null}
!211 = metadata !{i32 786443, metadata !1, metadata !209, i32 58, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/czuo/locabug/tests/locabug-iquery-bad.c]
!212 = metadata !{i32 61, i32 0, metadata !211, null}
!213 = metadata !{i32 67, i32 0, metadata !211, null}
!214 = metadata !{i32 38, i32 0, metadata !215, metadata !218}
!215 = metadata !{i32 786443, metadata !1, metadata !216, i32 38, i32 0, i32 21} ; [ DW_TAG_lexical_block ] [/home/czuo/locabug/tests/locabug-iquery-bad.c]
!216 = metadata !{i32 786443, metadata !1, metadata !217, i32 37, i32 0, i32 20} ; [ DW_TAG_lexical_block ] [/home/czuo/locabug/tests/locabug-iquery-bad.c]
!217 = metadata !{i32 786443, metadata !1, metadata !189, i32 37, i32 0, i32 19} ; [ DW_TAG_lexical_block ] [/home/czuo/locabug/tests/locabug-iquery-bad.c]
!218 = metadata !{i32 63, i32 0, metadata !219, null}
!219 = metadata !{i32 786443, metadata !1, metadata !211, i32 63, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/czuo/locabug/tests/locabug-iquery-bad.c]
!220 = metadata !{i32 39, i32 0, metadata !221, metadata !218}
!221 = metadata !{i32 786443, metadata !1, metadata !222, i32 39, i32 0, i32 23} ; [ DW_TAG_lexical_block ] [/home/czuo/locabug/tests/locabug-iquery-bad.c]
!222 = metadata !{i32 786443, metadata !1, metadata !215, i32 38, i32 0, i32 22} ; [ DW_TAG_lexical_block ] [/home/czuo/locabug/tests/locabug-iquery-bad.c]
!223 = metadata !{i32 41, i32 0, metadata !222, metadata !218}
!224 = metadata !{i32 68, i32 0, metadata !211, null}
!225 = metadata !{i32 70, i32 0, metadata !211, null}
!226 = metadata !{i32 76, i32 0, metadata !209, null}
!227 = metadata !{i32 78, i32 0, metadata !228, null}
!228 = metadata !{i32 786443, metadata !1, metadata !29, i32 78, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/czuo/locabug/tests/locabug-iquery-bad.c]
!229 = metadata !{i32 82, i32 0, metadata !29, null}
!230 = metadata !{i32 83, i32 0, metadata !29, null}
!231 = metadata !{i32 84, i32 0, metadata !29, null}
!232 = metadata !{i32 56, i32 0, metadata !29, metadata !233}
!233 = metadata !{i32 90, i32 0, metadata !234, null}
!234 = metadata !{i32 786443, metadata !1, metadata !49, i32 90, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/czuo/locabug/tests/locabug-iquery-bad.c]
!235 = metadata !{i32 58, i32 0, metadata !209, metadata !233} ; [ DW_TAG_imported_module ]
!236 = metadata !{i32 60, i32 0, metadata !211, metadata !233}
!237 = metadata !{i32 61, i32 0, metadata !211, metadata !233}
!238 = metadata !{i32 67, i32 0, metadata !211, metadata !233}
!239 = metadata !{i32 38, i32 0, metadata !215, metadata !240}
!240 = metadata !{i32 63, i32 0, metadata !219, metadata !233}
!241 = metadata !{i32 39, i32 0, metadata !221, metadata !240}
!242 = metadata !{i32 41, i32 0, metadata !222, metadata !240}
!243 = metadata !{i32 68, i32 0, metadata !211, metadata !233}
!244 = metadata !{i32 70, i32 0, metadata !211, metadata !233}
!245 = metadata !{i32 76, i32 0, metadata !209, metadata !233}
!246 = metadata !{i32 78, i32 0, metadata !228, metadata !233}
!247 = metadata !{i32 92, i32 0, metadata !49, null}
!248 = metadata !{i32 93, i32 0, metadata !49, null}
!249 = metadata !{i32 176, i32 0, metadata !56, null}
!250 = metadata !{i32 193, i32 0, metadata !124, null}
!251 = metadata !{metadata !252, metadata !252, i64 0}
!252 = metadata !{metadata !"int", metadata !204, i64 0}
!253 = metadata !{i32 199, i32 0, metadata !124, null}
!254 = metadata !{i32 200, i32 0, metadata !124, null}
!255 = metadata !{i32 210, i32 0, metadata !124, null}
!256 = metadata !{i32 212, i32 0, metadata !124, null}
!257 = metadata !{i32 215, i32 0, metadata !124, null}
!258 = metadata !{i32 211, i32 0, metadata !124, null}
!259 = metadata !{i32 217, i32 0, metadata !260, null}
!260 = metadata !{i32 786443, metadata !1, metadata !124, i32 215, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/czuo/locabug/tests/locabug-iquery-bad.c]
!261 = metadata !{i32 56, i32 0, metadata !29, metadata !262}
!262 = metadata !{i32 90, i32 0, metadata !234, metadata !263}
!263 = metadata !{i32 104, i32 0, metadata !264, metadata !265}
!264 = metadata !{i32 786443, metadata !1, metadata !160, i32 104, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/czuo/locabug/tests/locabug-iquery-bad.c]
!265 = metadata !{i32 218, i32 0, metadata !260, null}
!266 = metadata !{i32 58, i32 0, metadata !209, metadata !262} ; [ DW_TAG_imported_module ]
!267 = metadata !{i32 60, i32 0, metadata !211, metadata !262}
!268 = metadata !{i32 61, i32 0, metadata !211, metadata !262}
!269 = metadata !{i32 67, i32 0, metadata !211, metadata !262}
!270 = metadata !{i32 38, i32 0, metadata !215, metadata !271}
!271 = metadata !{i32 63, i32 0, metadata !219, metadata !262}
!272 = metadata !{i32 39, i32 0, metadata !221, metadata !271}
!273 = metadata !{i32 41, i32 0, metadata !222, metadata !271}
!274 = metadata !{i32 68, i32 0, metadata !211, metadata !262}
!275 = metadata !{i32 70, i32 0, metadata !211, metadata !262}
!276 = metadata !{i32 76, i32 0, metadata !209, metadata !262}
!277 = metadata !{i32 78, i32 0, metadata !228, metadata !262}
!278 = metadata !{i32 92, i32 0, metadata !49, metadata !263}
!279 = metadata !{i32 105, i32 0, metadata !280, metadata !265}
!280 = metadata !{i32 786443, metadata !1, metadata !264, i32 104, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/czuo/locabug/tests/locabug-iquery-bad.c]
!281 = metadata !{i32 106, i32 0, metadata !280, metadata !265}
!282 = metadata !{i32 107, i32 0, metadata !280, metadata !265}
!283 = metadata !{i32 109, i32 0, metadata !160, metadata !265}
!284 = metadata !{i32 110, i32 0, metadata !184, metadata !265}
!285 = metadata !{i32 111, i32 0, metadata !186, metadata !265}
!286 = metadata !{i32 112, i32 0, metadata !160, metadata !265}
!287 = metadata !{i32 113, i32 0, metadata !188, metadata !265}
!288 = metadata !{i32 114, i32 0, metadata !160, metadata !265}
!289 = metadata !{i32 115, i32 0, metadata !290, metadata !265}
!290 = metadata !{i32 786443, metadata !1, metadata !160, i32 115, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [/home/czuo/locabug/tests/locabug-iquery-bad.c]
!291 = metadata !{i32 116, i32 0, metadata !292, metadata !265}
!292 = metadata !{i32 786443, metadata !1, metadata !290, i32 115, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [/home/czuo/locabug/tests/locabug-iquery-bad.c]
!293 = metadata !{i32 117, i32 0, metadata !292, metadata !265}
!294 = metadata !{i32 118, i32 0, metadata !292, metadata !265}
!295 = metadata !{i32 126, i32 0, metadata !160, metadata !265}
!296 = metadata !{i32 127, i32 0, metadata !160, metadata !265}
!297 = metadata !{i32 129, i32 0, metadata !298, metadata !265}
!298 = metadata !{i32 786443, metadata !1, metadata !299, i32 129, i32 0, i32 16} ; [ DW_TAG_lexical_block ] [/home/czuo/locabug/tests/locabug-iquery-bad.c]
!299 = metadata !{i32 786443, metadata !1, metadata !160, i32 127, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [/home/czuo/locabug/tests/locabug-iquery-bad.c]
!300 = metadata !{i32 135, i32 0, metadata !160, metadata !265}
!301 = metadata !{i32 140, i32 0, metadata !160, metadata !265}
!302 = metadata !{i32 151, i32 0, metadata !160, metadata !265}
!303 = metadata !{i32 221, i32 0, metadata !260, null}
!304 = metadata !{i32 222, i32 0, metadata !260, null}
!305 = metadata !{i32 226, i32 0, metadata !124, null}
