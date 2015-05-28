; ModuleID = 'prepro-1.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [12 x i8] c"m=%d (> 6)\0A\00", align 1
@.str1 = private unnamed_addr constant [13 x i8] c"m=%d (<= 6)\0A\00", align 1

; Function Attrs: nounwind uwtable
define void @foo(i64 %n, i8* nocapture readonly %src, i32* nocapture readonly %bar) #0 {
entry:
  %buff = alloca [64 x i8], align 16
  %0 = getelementptr inbounds [64 x i8]* %buff, i64 0, i64 0, !dbg !32
  %1 = load i32* %bar, align 4, !dbg !33, !tbaa !34
  %cmp = icmp sgt i32 %1, 6, !dbg !38
  br i1 %cmp, label %if.then, label %if.else, !dbg !38

if.then:                                          ; preds = %entry
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([12 x i8]* @.str, i64 0, i64 0), i32 %1) #2, !dbg !40
  br label %if.end, !dbg !40

if.else:                                          ; preds = %entry
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str1, i64 0, i64 0), i32 %1) #2, !dbg !41
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %cmp2 = icmp ult i64 %n, 65, !dbg !42
  br i1 %cmp2, label %if.then3, label %if.end4, !dbg !42

if.then3:                                         ; preds = %if.end
  %2 = call i8* @memcpy(i8* %0, i8* %src, i64 %n)
  br label %if.end4, !dbg !44

if.end4:                                          ; preds = %if.then3, %if.end
  %arrayidx = getelementptr inbounds [64 x i8]* %buff, i64 0, i64 63, !dbg !45
  store i8 0, i8* %arrayidx, align 1, !dbg !45, !tbaa !46
  %puts = call i32 @puts(i8* %0), !dbg !47
  ret void, !dbg !48
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #2

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #3

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #2

; Function Attrs: nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #2

; Function Attrs: nounwind readnone uwtable
define i32 @main(i32 %argc, i8** nocapture readnone %argv) #4 {
entry:
  ret i32 0, !dbg !49
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) #2

declare i8* @memcpy(i8*, i8*, i64)

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind }
attributes #3 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readnone uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!29, !30}
!llvm.ident = !{!31}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/czuo/locabug/tests/1.c] [DW_LANG_C99]
!1 = metadata !{metadata !"1.c", metadata !"/home/czuo/locabug/tests"}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4, metadata !22}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"foo", metadata !"foo", metadata !"", i32 6, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i64, i8*, i32*)* @foo, null, null, metadata !13, i32 7} ; [ DW_TAG_subprogram ] [line 6] [def] [scope 7] [foo]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/czuo/locabug/tests/1.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{null, metadata !8, metadata !9, metadata !11}
!8 = metadata !{i32 786468, null, null, metadata !"long long unsigned int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!9 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!10 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!11 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !12} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int]
!12 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!13 = metadata !{metadata !14, metadata !15, metadata !16, metadata !17, metadata !21}
!14 = metadata !{i32 786689, metadata !4, metadata !"n", metadata !5, i32 16777222, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [n] [line 6]
!15 = metadata !{i32 786689, metadata !4, metadata !"src", metadata !5, i32 33554438, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 6]
!16 = metadata !{i32 786689, metadata !4, metadata !"bar", metadata !5, i32 50331654, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [bar] [line 6]
!17 = metadata !{i32 786688, metadata !4, metadata !"buff", metadata !5, i32 8, metadata !18, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [buff] [line 8]
!18 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 512, i64 8, i32 0, i32 0, metadata !10, metadata !19, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 512, align 8, offset 0] [from char]
!19 = metadata !{metadata !20}
!20 = metadata !{i32 786465, i64 0, i64 64}       ; [ DW_TAG_subrange_type ] [0, 63]
!21 = metadata !{i32 786688, metadata !4, metadata !"m", metadata !5, i32 11, metadata !12, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [m] [line 11]
!22 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 25, metadata !23, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i8**)* @main, null, null, metadata !26, i32 26} ; [ DW_TAG_subprogram ] [line 25] [def] [scope 26] [main]
!23 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !24, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!24 = metadata !{metadata !12, metadata !12, metadata !25}
!25 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !9} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!26 = metadata !{metadata !27, metadata !28}
!27 = metadata !{i32 786689, metadata !22, metadata !"argc", metadata !5, i32 16777241, metadata !12, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argc] [line 25]
!28 = metadata !{i32 786689, metadata !22, metadata !"argv", metadata !5, i32 33554457, metadata !25, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argv] [line 25]
!29 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!30 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!31 = metadata !{metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)"}
!32 = metadata !{i32 8, i32 0, metadata !4, null} ; [ DW_TAG_imported_declaration ]
!33 = metadata !{i32 11, i32 0, metadata !4, null}
!34 = metadata !{metadata !35, metadata !35, i64 0}
!35 = metadata !{metadata !"int", metadata !36, i64 0}
!36 = metadata !{metadata !"omnipotent char", metadata !37, i64 0}
!37 = metadata !{metadata !"Simple C/C++ TBAA"}
!38 = metadata !{i32 12, i32 0, metadata !39, null}
!39 = metadata !{i32 786443, metadata !1, metadata !4, i32 12, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/czuo/locabug/tests/1.c]
!40 = metadata !{i32 13, i32 0, metadata !39, null}
!41 = metadata !{i32 15, i32 0, metadata !39, null}
!42 = metadata !{i32 17, i32 0, metadata !43, null}
!43 = metadata !{i32 786443, metadata !1, metadata !4, i32 17, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/czuo/locabug/tests/1.c]
!44 = metadata !{i32 18, i32 0, metadata !43, null}
!45 = metadata !{i32 20, i32 0, metadata !4, null}
!46 = metadata !{metadata !36, metadata !36, i64 0}
!47 = metadata !{i32 22, i32 0, metadata !4, null}
!48 = metadata !{i32 23, i32 0, metadata !4, null}
!49 = metadata !{i32 27, i32 0, metadata !22, null}
