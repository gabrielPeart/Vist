; ModuleID = 'example.ll'
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.11.0"

<<<<<<< HEAD
=======
%Int = type { i64 }
%Range = type { %Int, %Int }
%HalfOpenRange = type { %Int, %Int }
%Bool = type { i1 }
>>>>>>> parent of 0bc95a6... Started working on LLVM wrapper
%String = type { i8*, %Int, %Int }
%Int = type { i64 }

<<<<<<< HEAD
@0 = private unnamed_addr constant [17 x i8] c"\F0\9F\A4\94\F0\9F\A4\94\F0\9F\A4\94\F0\9F\A4\94\00"
=======
@a.globlstorage = unnamed_addr global %Int* null
@0 = private unnamed_addr constant [4 x i8] c"out\00"

declare %Range @-D-D-D_tII(%Int, %Int)

; Function Attrs: alwaysinline nounwind readnone
define %HalfOpenRange @HalfOpenRange_tII(%Int %"$0", %Int %"$1") #0 {
entry:
  %"$0.fca.0.extract" = extractvalue %Int %"$0", 0
  %"$1.fca.0.extract" = extractvalue %Int %"$1", 0
  %.fca.0.0.insert = insertvalue %HalfOpenRange undef, i64 %"$0.fca.0.extract", 0, 0
  %.fca.1.0.insert = insertvalue %HalfOpenRange %.fca.0.0.insert, i64 %"$1.fca.0.extract", 1, 0
  ret %HalfOpenRange %.fca.1.0.insert
}

declare void @generate_mRPtI(%Range, void (%Int)*)

declare %Bool @-L_tII(%Int, %Int)

; Function Attrs: alwaysinline
define void @main.loop_thunk(%Int %x) #1 {
entry:
  %0 = load %Int** @a.globlstorage, align 8
  %1 = load %Int* %0, align 8
  %2 = tail call %Int @-A_tII(%Int %x, %Int %1), !stdlib.call.optim !0
  store %Int %2, %Int* %0, align 8
  tail call void @print_tI(%Int %2), !stdlib.call.optim !0
  ret void
}

declare void @print_tI(%Int)

declare %String @String_topi64b(i8*, i64, i1)
>>>>>>> parent of 0bc95a6... Started working on LLVM wrapper

declare void @print_tString(%String)

declare %Int @-P_tII(%Int, %Int)

define void @generate_mHalfOpenRangePtI(%HalfOpenRange %self, void (%Int)* nocapture %loop_thunk) {
entry:
  %start = extractvalue %HalfOpenRange %self, 0
  %end = extractvalue %HalfOpenRange %self, 1
  %0 = tail call %Bool @-L_tII(%Int %start, %Int %end), !stdlib.call.optim !0
  %cond110 = extractvalue %Bool %0, 0
  br i1 %cond110, label %loop.preheader, label %loop.exit

loop.preheader:                                   ; preds = %entry
  br label %loop

loop:                                             ; preds = %loop.preheader, %loop
  %start.sink11 = phi %Int [ %1, %loop ], [ %start, %loop.preheader ]
  tail call void %loop_thunk(%Int %start.sink11)
  %1 = tail call %Int @-P_tII(%Int %start.sink11, %Int { i64 1 }), !stdlib.call.optim !0
  %2 = tail call %Bool @-L_tII(%Int %1, %Int %end), !stdlib.call.optim !0
  %cond1 = extractvalue %Bool %2, 0
  br i1 %cond1, label %loop, label %loop.exit.loopexit

loop.exit.loopexit:                               ; preds = %loop
  br label %loop.exit

loop.exit:                                        ; preds = %loop.exit.loopexit, %entry
  ret void
}

define void @main() {
entry:
  %0 = tail call %String @String_topi64b(i8* getelementptr inbounds ([17 x i8]* @0, i64 0, i64 0), i64 17, i1 false), !stdlib.call.optim !0
  tail call void @print_tString(%String %0), !stdlib.call.optim !0
  ret void
}

<<<<<<< HEAD
declare %String @String_topi64b(i8*, i64, i1)
=======
declare %Int @-A_tII(%Int, %Int)

attributes #0 = { alwaysinline nounwind readnone }
attributes #1 = { alwaysinline }
>>>>>>> parent of 0bc95a6... Started working on LLVM wrapper

!0 = !{!"stdlib.call.optim"}
