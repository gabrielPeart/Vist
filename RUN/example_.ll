; ModuleID = 'vist_module'
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.11.0"

@.str = private unnamed_addr constant [6 x i8] c"%lli\0A\00", align 1
@.str1 = private unnamed_addr constant [4 x i8] c"%i\0A\00", align 1
@.str2 = private unnamed_addr constant [4 x i8] c"%f\0A\00", align 1
@.str3 = private unnamed_addr constant [6 x i8] c"true\0A\00", align 1
@.str4 = private unnamed_addr constant [7 x i8] c"false\0A\00", align 1

; Function Attrs: noinline ssp uwtable
define void @"_$print_i64"(i64 %i) #0 {
  %1 = alloca i64, align 8
  store i64 %i, i64* %1, align 8
  %2 = load i64* %1, align 8
  %3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8]* @.str, i32 0, i32 0), i64 %2)
  ret void
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: noinline ssp uwtable
define void @"_$print_i32"(i32 %i) #0 {
  %1 = alloca i32, align 4
  store i32 %i, i32* %1, align 4
  %2 = load i32* %1, align 4
  %3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i32 0, i32 0), i32 %2)
  ret void
}

; Function Attrs: noinline ssp uwtable
define void @"_$print_FP64"(double %d) #0 {
  %1 = alloca double, align 8
  store double %d, double* %1, align 8
  %2 = load double* %1, align 8
  %3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str2, i32 0, i32 0), double %2)
  ret void
}

; Function Attrs: noinline ssp uwtable
define void @"_$print_FP32"(float %d) #0 {
  %1 = alloca float, align 4
  store float %d, float* %1, align 4
  %2 = load float* %1, align 4
  %3 = fpext float %2 to double
  %4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str2, i32 0, i32 0), double %3)
  ret void
}

; Function Attrs: noinline ssp uwtable
define void @"_$print_b"(i1 zeroext %b) #0 {
  %1 = alloca i8, align 1
  %2 = zext i1 %b to i8
  store i8 %2, i8* %1, align 1
  %3 = load i8* %1, align 1
  %4 = trunc i8 %3 to i1
  br i1 %4, label %5, label %7

; <label>:5                                       ; preds = %0
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8]* @.str3, i32 0, i32 0))
  br label %9

; <label>:7                                       ; preds = %0
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([7 x i8]* @.str4, i32 0, i32 0))
  br label %9

; <label>:9                                       ; preds = %7, %5
  ret void
}

; Function Attrs: noinline ssp uwtable
define void @"_$fatalError_"() #0 {
  call void @abort() #5
  unreachable
                                                  ; No predecessors!
  ret void
}

; Function Attrs: noreturn
declare void @abort() #2

; Function Attrs: alwaysinline
define { i64 } @_Int_S.i64({ i64 } %o) #3 {
entry:
  %0 = alloca { i64 }
  %value = extractvalue { i64 } %o, 0
  %value_ptr = getelementptr inbounds { i64 }* %0, i32 0, i32 0
  store i64 %value, i64* %value_ptr
  %1 = load { i64 }* %0
  ret { i64 } %1
}

; Function Attrs: alwaysinline
define { i64 } @_Int_i64(i64 %v) #3 {
entry:
  %0 = alloca { i64 }
  %value_ptr = getelementptr inbounds { i64 }* %0, i32 0, i32 0
  store i64 %v, i64* %value_ptr
  %1 = load { i64 }* %0
  ret { i64 } %1
}

; Function Attrs: alwaysinline
define { i1 } @_Bool_S.b({ i1 } %o) #3 {
entry:
  %0 = alloca { i1 }
  %value = extractvalue { i1 } %o, 0
  %value_ptr = getelementptr inbounds { i1 }* %0, i32 0, i32 0
  store i1 %value, i1* %value_ptr
  %1 = load { i1 }* %0
  ret { i1 } %1
}

; Function Attrs: alwaysinline
define { i1 } @_Bool_b(i1 %v) #3 {
entry:
  %0 = alloca { i1 }
  %value_ptr = getelementptr inbounds { i1 }* %0, i32 0, i32 0
  store i1 %v, i1* %value_ptr
  %1 = load { i1 }* %0
  ret { i1 } %1
}

; Function Attrs: alwaysinline
define { double } @_Double_S.FP64({ double } %o) #3 {
entry:
  %0 = alloca { double }
  %value = extractvalue { double } %o, 0
  %value_ptr = getelementptr inbounds { double }* %0, i32 0, i32 0
  store double %value, double* %value_ptr
  %1 = load { double }* %0
  ret { double } %1
}

; Function Attrs: alwaysinline
define { double } @_Double_FP64(double %v) #3 {
entry:
  %0 = alloca { double }
  %value_ptr = getelementptr inbounds { double }* %0, i32 0, i32 0
  store double %v, double* %value_ptr
  %1 = load { double }* %0
  ret { double } %1
}

; Function Attrs: alwaysinline
define void @_print_S.i64({ i64 } %a) #3 {
entry:
  %value = extractvalue { i64 } %a, 0
  call void @"_$print_i64"(i64 %value)
  ret void
}

; Function Attrs: alwaysinline
define void @_print_S.b({ i1 } %a) #3 {
entry:
  %value = extractvalue { i1 } %a, 0
  call void @"_$print_b"(i1 %value)
  ret void
}

; Function Attrs: alwaysinline
define void @_print_S.FP64({ double } %a) #3 {
entry:
  %value = extractvalue { double } %a, 0
  call void @"_$print_FP64"(double %value)
  ret void
}

; Function Attrs: alwaysinline noreturn
define void @_fatalError_() #4 {
entry:
  call void @"_$fatalError_"()
  ret void
}

; Function Attrs: alwaysinline
define void @_assert_S.b({ i1 } %"$0") #3 {
entry:
  %b = extractvalue { i1 } %"$0", 0
  br i1 %b, label %then0, label %cont0

cont:                                             ; preds = %else1, %then0
  ret void

cont0:                                            ; preds = %entry
  br label %else1

then0:                                            ; preds = %entry
  br label %cont

else1:                                            ; preds = %cont0
  call void @_fatalError_()
  br label %cont
}

; Function Attrs: alwaysinline
define { i64 } @"_+_S.i64S.i64"({ i64 } %a, { i64 } %b) #3 {
entry:
  %value = extractvalue { i64 } %a, 0
  %value1 = extractvalue { i64 } %b, 0
  %add_res = add i64 %value, %value1
  %Int_res = call { i64 } @_Int_i64(i64 %add_res)
  ret { i64 } %Int_res
}

; Function Attrs: alwaysinline
define { i64 } @_-_S.i64S.i64({ i64 } %a, { i64 } %b) #3 {
entry:
  %value = extractvalue { i64 } %a, 0
  %value1 = extractvalue { i64 } %b, 0
  %sub_res = sub i64 %value, %value1
  %Int_res = call { i64 } @_Int_i64(i64 %sub_res)
  ret { i64 } %Int_res
}

; Function Attrs: alwaysinline
define { i64 } @"_*_S.i64S.i64"({ i64 } %a, { i64 } %b) #3 {
entry:
  %value = extractvalue { i64 } %a, 0
  %value1 = extractvalue { i64 } %b, 0
  %mul_res = mul i64 %value, %value1
  %Int_res = call { i64 } @_Int_i64(i64 %mul_res)
  ret { i64 } %Int_res
}

; Function Attrs: alwaysinline
define { i64 } @"_/_S.i64S.i64"({ i64 } %a, { i64 } %b) #3 {
entry:
  %value = extractvalue { i64 } %a, 0
  %value1 = extractvalue { i64 } %b, 0
  %div_res = udiv i64 %value, %value1
  %Int_res = call { i64 } @_Int_i64(i64 %div_res)
  ret { i64 } %Int_res
}

; Function Attrs: alwaysinline
define { i64 } @"_%_S.i64S.i64"({ i64 } %a, { i64 } %b) #3 {
entry:
  %value = extractvalue { i64 } %a, 0
  %value1 = extractvalue { i64 } %b, 0
  %rem_res = urem i64 %value, %value1
  %Int_res = call { i64 } @_Int_i64(i64 %rem_res)
  ret { i64 } %Int_res
}

; Function Attrs: alwaysinline
define { i1 } @"_<_S.i64S.i64"({ i64 } %a, { i64 } %b) #3 {
entry:
  %value = extractvalue { i64 } %a, 0
  %value1 = extractvalue { i64 } %b, 0
  %cmp_lt_res = icmp slt i64 %value, %value1
  %Bool_res = call { i1 } @_Bool_b(i1 %cmp_lt_res)
  ret { i1 } %Bool_res
}

; Function Attrs: alwaysinline
define { i1 } @"_<=_S.i64S.i64"({ i64 } %a, { i64 } %b) #3 {
entry:
  %value = extractvalue { i64 } %a, 0
  %value1 = extractvalue { i64 } %b, 0
  %cmp_lte_res = icmp sle i64 %value, %value1
  %Bool_res = call { i1 } @_Bool_b(i1 %cmp_lte_res)
  ret { i1 } %Bool_res
}

; Function Attrs: alwaysinline
define { i1 } @"_>_S.i64S.i64"({ i64 } %a, { i64 } %b) #3 {
entry:
  %value = extractvalue { i64 } %a, 0
  %value1 = extractvalue { i64 } %b, 0
  %cmp_gt_res = icmp sgt i64 %value, %value1
  %Bool_res = call { i1 } @_Bool_b(i1 %cmp_gt_res)
  ret { i1 } %Bool_res
}

; Function Attrs: alwaysinline
define { i1 } @"_>=_S.i64S.i64"({ i64 } %a, { i64 } %b) #3 {
entry:
  %value = extractvalue { i64 } %a, 0
  %value1 = extractvalue { i64 } %b, 0
  %cmp_gte_res = icmp sge i64 %value, %value1
  %Bool_res = call { i1 } @_Bool_b(i1 %cmp_gte_res)
  ret { i1 } %Bool_res
}

; Function Attrs: alwaysinline
define { i1 } @"_==_S.i64S.i64"({ i64 } %a, { i64 } %b) #3 {
entry:
  %value = extractvalue { i64 } %a, 0
  %value1 = extractvalue { i64 } %b, 0
  %cmp_eq_res = icmp eq i64 %value, %value1
  %Bool_res = call { i1 } @_Bool_b(i1 %cmp_eq_res)
  ret { i1 } %Bool_res
}

; Function Attrs: alwaysinline
define { i1 } @"_!=_S.i64S.i64"({ i64 } %a, { i64 } %b) #3 {
entry:
  %value = extractvalue { i64 } %a, 0
  %value1 = extractvalue { i64 } %b, 0
  %cmp_neq_res = icmp ne i64 %value, %value1
  %Bool_res = call { i1 } @_Bool_b(i1 %cmp_neq_res)
  ret { i1 } %Bool_res
}

; Function Attrs: alwaysinline
define { i1 } @"_&&_S.bS.b"({ i1 } %a, { i1 } %b) #3 {
entry:
  %value = extractvalue { i1 } %a, 0
  %value1 = extractvalue { i1 } %b, 0
  %cmp_and_res = and i1 %value, %value1
  %Bool_res = call { i1 } @_Bool_b(i1 %cmp_and_res)
  ret { i1 } %Bool_res
}

; Function Attrs: alwaysinline
define { i1 } @"_||_S.bS.b"({ i1 } %a, { i1 } %b) #3 {
entry:
  %value = extractvalue { i1 } %a, 0
  %value1 = extractvalue { i1 } %b, 0
  %cmp_or_res = or i1 %value, %value1
  %Bool_res = call { i1 } @_Bool_b(i1 %cmp_or_res)
  ret { i1 } %Bool_res
}

; Function Attrs: alwaysinline
define { double } @"_+_S.FP64S.FP64"({ double } %a, { double } %b) #3 {
entry:
  %value = extractvalue { double } %a, 0
  %value1 = extractvalue { double } %b, 0
  %add_res = fadd double %value, %value1
  %Double_res = call { double } @_Double_FP64(double %add_res)
  ret { double } %Double_res
}

; Function Attrs: alwaysinline
define { double } @_-_S.FP64S.FP64({ double } %a, { double } %b) #3 {
entry:
  %value = extractvalue { double } %a, 0
  %value1 = extractvalue { double } %b, 0
  %sub_res = fsub double %value, %value1
  %Double_res = call { double } @_Double_FP64(double %sub_res)
  ret { double } %Double_res
}

; Function Attrs: alwaysinline
define { double } @"_*_S.FP64S.FP64"({ double } %a, { double } %b) #3 {
entry:
  %value = extractvalue { double } %a, 0
  %value1 = extractvalue { double } %b, 0
  %mul_res = fmul double %value, %value1
  %Double_res = call { double } @_Double_FP64(double %mul_res)
  ret { double } %Double_res
}

; Function Attrs: alwaysinline
define { double } @"_/_S.FP64S.FP64"({ double } %a, { double } %b) #3 {
entry:
  %value = extractvalue { double } %a, 0
  %value1 = extractvalue { double } %b, 0
  %div_res = fdiv double %value, %value1
  %Double_res = call { double } @_Double_FP64(double %div_res)
  ret { double } %Double_res
}

; Function Attrs: alwaysinline
define { double } @"_%_S.FP64S.FP64"({ double } %a, { double } %b) #3 {
entry:
  %value = extractvalue { double } %a, 0
  %value1 = extractvalue { double } %b, 0
  %rem_res = frem double %value, %value1
  %Double_res = call { double } @_Double_FP64(double %rem_res)
  ret { double } %Double_res
}

; Function Attrs: alwaysinline
define { i1 } @"_<_S.FP64S.FP64"({ double } %a, { double } %b) #3 {
entry:
  %value = extractvalue { double } %a, 0
  %value1 = extractvalue { double } %b, 0
  %cmp_lt_res = fcmp olt double %value, %value1
  %Bool_res = call { i1 } @_Bool_b(i1 %cmp_lt_res)
  ret { i1 } %Bool_res
}

; Function Attrs: alwaysinline
define { i1 } @"_<=_S.FP64S.FP64"({ double } %a, { double } %b) #3 {
entry:
  %value = extractvalue { double } %a, 0
  %value1 = extractvalue { double } %b, 0
  %cmp_lte_res = fcmp ole double %value, %value1
  %Bool_res = call { i1 } @_Bool_b(i1 %cmp_lte_res)
  ret { i1 } %Bool_res
}

; Function Attrs: alwaysinline
define { i1 } @"_>_S.FP64S.FP64"({ double } %a, { double } %b) #3 {
entry:
  %value = extractvalue { double } %a, 0
  %value1 = extractvalue { double } %b, 0
  %cmp_gt_res = fcmp ogt double %value, %value1
  %Bool_res = call { i1 } @_Bool_b(i1 %cmp_gt_res)
  ret { i1 } %Bool_res
}

; Function Attrs: alwaysinline
define { i1 } @"_>=_S.FP64S.FP64"({ double } %a, { double } %b) #3 {
entry:
  %value = extractvalue { double } %a, 0
  %value1 = extractvalue { double } %b, 0
  %cmp_gte_res = fcmp oge double %value, %value1
  %Bool_res = call { i1 } @_Bool_b(i1 %cmp_gte_res)
  ret { i1 } %Bool_res
}

; Function Attrs: alwaysinline
define { i1 } @"_==_S.FP64S.FP64"({ double } %a, { double } %b) #3 {
entry:
  %value = extractvalue { double } %a, 0
  %value1 = extractvalue { double } %b, 0
  %cmp_eq_res = fcmp oeq double %value, %value1
  %Bool_res = call { i1 } @_Bool_b(i1 %cmp_eq_res)
  ret { i1 } %Bool_res
}

; Function Attrs: alwaysinline
define { i1 } @"_!=_S.FP64S.FP64"({ double } %a, { double } %b) #3 {
entry:
  %value = extractvalue { double } %a, 0
  %value1 = extractvalue { double } %b, 0
  %cmp_neq_res = fcmp one double %value, %value1
  %Bool_res = call { i1 } @_Bool_b(i1 %cmp_neq_res)
  ret { i1 } %Bool_res
}

define i64 @main() {
entry:
  %Int_res = call { i64 } @_Int_i64(i64 5)
  %0 = alloca { i64 }
  store { i64 } %Int_res, { i64 }* %0
  %Int_res1 = call { i64 } @_Int_i64(i64 100)
  %1 = alloca { i64 }
  store { i64 } %Int_res1, { i64 }* %1
  %u = load { i64 }* %0
  %v = load { i64 }* %1
  %..._res = call { { i64 }, { i64 } } @_..._S.i64S.i64({ i64 } %u, { i64 } %v)
  %2 = alloca { { i64 }, { i64 } }
  store { { i64 }, { i64 } } %..._res, { { i64 }, { i64 } }* %2
  %start_ptr = getelementptr inbounds { { i64 }, { i64 } }* %2, i32 0, i32 0
  %start = load { i64 }* %start_ptr
  call void @_print_S.i64({ i64 } %start)
  %u2 = load { i64 }* %0
  call void @_print_S.i64({ i64 } %u2)
  %Double_res = call { double } @_Double_FP64(double 2.000000e+00)
  %3 = alloca { double }
  store { double } %Double_res, { double }* %3
  %y = load { double }* %3
  call void @_print_S.FP64({ double } %y)
  %Int_res3 = call { i64 } @_Int_i64(i64 6)
  %Int_res4 = call { i64 } @_Int_i64(i64 10)
  %-_res = call { i64 } @_-_S.i64S.i64({ i64 } %Int_res3, { i64 } %Int_res4)
  %4 = alloca { i64 }
  store { i64 } %-_res, { i64 }* %4
  %a = load { i64 }* %4
  call void @_print_S.i64({ i64 } %a)
  %Bool_res = call { i1 } @_Bool_b(i1 true)
  call void @_assert_S.b({ i1 } %Bool_res)
  %Int_res5 = call { i64 } @_Int_i64(i64 1)
  call void @_print_S.i64({ i64 } %Int_res5)
  %a6 = load { i64 }* %4
  %Int_res7 = call { i64 } @_Int_i64(i64 1000)
  %"<_res" = call { i1 } @"_<_S.i64S.i64"({ i64 } %a6, { i64 } %Int_res7)
  %value = extractvalue { i1 } %"<_res", 0
  br i1 %value, label %loop, label %afterloop

loop:                                             ; preds = %loop, %entry
  %a8 = load { i64 }* %4
  %Int_res9 = call { i64 } @_Int_i64(i64 5)
  %"+_res" = call { i64 } @"_+_S.i64S.i64"({ i64 } %a8, { i64 } %Int_res9)
  store { i64 } %"+_res", { i64 }* %4
  %a10 = load { i64 }* %4
  call void @_print_S.i64({ i64 } %a10)
  %a11 = load { i64 }* %4
  %Int_res12 = call { i64 } @_Int_i64(i64 1000)
  %"<_res13" = call { i1 } @"_<_S.i64S.i64"({ i64 } %a11, { i64 } %Int_res12)
  %value14 = extractvalue { i1 } %"<_res13", 0
  br i1 %value14, label %loop, label %afterloop

afterloop:                                        ; preds = %loop, %entry
  ret i64 0
}

; Function Attrs: alwaysinline
define void @_meme_S.b({ i1 } %"$0") #3 {
entry:
  %value = extractvalue { i1 } %"$0", 0
  br i1 %value, label %then0, label %cont0

cont:                                             ; preds = %else1, %then0
  ret void

cont0:                                            ; preds = %entry
  br label %else1

then0:                                            ; preds = %entry
  br label %cont

else1:                                            ; preds = %cont0
  call void @_fatalError_()
  br label %cont
}

; Function Attrs: alwaysinline
define { { i64 }, { i64 } } @_Range_S.i64S.i64({ i64 } %"$0", { i64 } %"$1") #3 {
entry:
  %0 = alloca { { i64 }, { i64 } }
  %start_ptr = getelementptr inbounds { { i64 }, { i64 } }* %0, i32 0, i32 0
  store { i64 } %"$0", { i64 }* %start_ptr
  %end_ptr = getelementptr inbounds { { i64 }, { i64 } }* %0, i32 0, i32 1
  store { i64 } %"$1", { i64 }* %end_ptr
  %1 = load { { i64 }, { i64 } }* %0
  ret { { i64 }, { i64 } } %1
}

; Function Attrs: alwaysinline
define { { i64 }, { i64 } } @_..._S.i64S.i64({ i64 } %"$0", { i64 } %"$1") #3 {
entry:
  %Range_res = call { { i64 }, { i64 } } @_Range_S.i64S.i64({ i64 } %"$0", { i64 } %"$1")
  ret { { i64 }, { i64 } } %Range_res
}

attributes #0 = { noinline ssp uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="core2" "target-features"="+ssse3,+cx16,+sse,+sse2,+sse3" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="core2" "target-features"="+ssse3,+cx16,+sse,+sse2,+sse3" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="core2" "target-features"="+ssse3,+cx16,+sse,+sse2,+sse3" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { alwaysinline }
attributes #4 = { alwaysinline noreturn }
attributes #5 = { noreturn }

!llvm.ident = !{!0}
!llvm.module.flags = !{!1}

!0 = !{!"Apple LLVM version 7.0.2 (clang-700.1.81)"}
!1 = !{i32 1, !"PIC Level", i32 2}
