; ModuleID = 'runtime.cpp'
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.11.0"

%struct.RefcountedObject = type { i8*, i32 }

@.str = private unnamed_addr constant [10 x i8] c"alloc %i\0A\00", align 1
@.str.1 = private unnamed_addr constant [12 x i8] c"dealloc %i\0A\00", align 1
@.str.2 = private unnamed_addr constant [12 x i8] c"release %i\0A\00", align 1
@.str.3 = private unnamed_addr constant [11 x i8] c"retain %i\0A\00", align 1
@.str.4 = private unnamed_addr constant [6 x i8] c"%lli\0A\00", align 1
@.str.5 = private unnamed_addr constant [4 x i8] c"%i\0A\00", align 1
@.str.6 = private unnamed_addr constant [4 x i8] c"%f\0A\00", align 1
@.str.7 = private unnamed_addr constant [6 x i8] c"true\0A\00", align 1
@.str.8 = private unnamed_addr constant [7 x i8] c"false\0A\00", align 1
@.str.9 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1

; Function Attrs: alwaysinline nounwind ssp uwtable
define void @_Z17incrementRefCountP16RefcountedObject(%struct.RefcountedObject* %object) #0 {
  %1 = alloca %struct.RefcountedObject*, align 8
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store %struct.RefcountedObject* %object, %struct.RefcountedObject** %1, align 8
  %4 = load %struct.RefcountedObject*, %struct.RefcountedObject** %1, align 8
  %5 = getelementptr inbounds %struct.RefcountedObject, %struct.RefcountedObject* %4, i32 0, i32 1
  store i32 1, i32* %2, align 4
  %6 = load i32, i32* %2, align 4
  %7 = atomicrmw add i32* %5, i32 %6 monotonic
  store i32 %7, i32* %3, align 4
  %8 = load i32, i32* %3, align 4
  ret void
}

; Function Attrs: alwaysinline nounwind ssp uwtable
define void @_Z17decrementRefCountP16RefcountedObject(%struct.RefcountedObject* %object) #0 {
  %1 = alloca %struct.RefcountedObject*, align 8
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store %struct.RefcountedObject* %object, %struct.RefcountedObject** %1, align 8
  %4 = load %struct.RefcountedObject*, %struct.RefcountedObject** %1, align 8
  %5 = getelementptr inbounds %struct.RefcountedObject, %struct.RefcountedObject* %4, i32 0, i32 1
  store i32 1, i32* %2, align 4
  %6 = load i32, i32* %2, align 4
  %7 = atomicrmw sub i32* %5, i32 %6 monotonic
  store i32 %7, i32* %3, align 4
  %8 = load i32, i32* %3, align 4
  ret void
}

; Function Attrs: noinline ssp uwtable
define { i8*, i32 } @vist_allocObject(i32 %size) #1 {
  %1 = alloca %struct.RefcountedObject, align 8
  %2 = alloca i32, align 4
  %object = alloca i8*, align 8
  %refCount = alloca i32, align 4
  store i32 %size, i32* %2, align 4
  %3 = load i32, i32* %2, align 4
  %4 = zext i32 %3 to i64
  %5 = call i8* @malloc(i64 %4)
  store i8* %5, i8** %object, align 8
  store i32 1, i32* %refCount, align 4
  %6 = load i32, i32* %refCount, align 4
  %7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i32 0, i32 0), i32 %6)
  %8 = getelementptr inbounds %struct.RefcountedObject, %struct.RefcountedObject* %1, i32 0, i32 0
  %9 = load i8*, i8** %object, align 8
  store i8* %9, i8** %8, align 8
  %10 = getelementptr inbounds %struct.RefcountedObject, %struct.RefcountedObject* %1, i32 0, i32 1
  %11 = load i32, i32* %refCount, align 4
  store i32 %11, i32* %10, align 8
  %12 = bitcast %struct.RefcountedObject* %1 to { i8*, i32 }*
  %13 = load { i8*, i32 }, { i8*, i32 }* %12, align 8
  ret { i8*, i32 } %13
}

declare i8* @malloc(i64) #2

declare i32 @printf(i8*, ...) #2

; Function Attrs: noinline ssp uwtable
define void @vist_deallocObject(%struct.RefcountedObject* %object) #1 {
  %1 = alloca %struct.RefcountedObject*, align 8
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca %struct.RefcountedObject*, align 8
  store %struct.RefcountedObject* %object, %struct.RefcountedObject** %4, align 8
  %5 = load %struct.RefcountedObject*, %struct.RefcountedObject** %4, align 8
  %6 = getelementptr inbounds %struct.RefcountedObject, %struct.RefcountedObject* %5, i32 0, i32 0
  %7 = load i8*, i8** %6, align 8
  call void @free(i8* %7)
  %8 = load %struct.RefcountedObject*, %struct.RefcountedObject** %4, align 8
  store %struct.RefcountedObject* %8, %struct.RefcountedObject** %1, align 8
  %9 = load %struct.RefcountedObject*, %struct.RefcountedObject** %1, align 8
  %10 = getelementptr inbounds %struct.RefcountedObject, %struct.RefcountedObject* %9, i32 0, i32 1
  store i32 1, i32* %2, align 4
  %11 = load i32, i32* %2, align 4
  %12 = atomicrmw sub i32* %10, i32 %11 monotonic
  store i32 %12, i32* %3, align 4
  %13 = load i32, i32* %3, align 4
  %14 = load %struct.RefcountedObject*, %struct.RefcountedObject** %4, align 8
  %15 = getelementptr inbounds %struct.RefcountedObject, %struct.RefcountedObject* %14, i32 0, i32 1
  %16 = load i32, i32* %15, align 8
  %17 = icmp ne i32 %16, 0
  br i1 %17, label %18, label %19

; <label>:18                                      ; preds = %0
  call void @abort() #5
  unreachable

; <label>:19                                      ; preds = %0
  %20 = load %struct.RefcountedObject*, %struct.RefcountedObject** %4, align 8
  %21 = getelementptr inbounds %struct.RefcountedObject, %struct.RefcountedObject* %20, i32 0, i32 1
  %22 = load i32, i32* %21, align 8
  %23 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0), i32 %22)
  ret void
}

declare void @free(i8*) #2

; Function Attrs: noreturn
declare void @abort() #3

; Function Attrs: noinline ssp uwtable
define void @vist_releaseObject(%struct.RefcountedObject* %object) #1 {
  %1 = alloca %struct.RefcountedObject*, align 8
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca %struct.RefcountedObject*, align 8
  store %struct.RefcountedObject* %object, %struct.RefcountedObject** %4, align 8
  %5 = load %struct.RefcountedObject*, %struct.RefcountedObject** %4, align 8
  %6 = getelementptr inbounds %struct.RefcountedObject, %struct.RefcountedObject* %5, i32 0, i32 1
  %7 = load i32, i32* %6, align 8
  %8 = icmp eq i32 %7, 1
  br i1 %8, label %9, label %11

; <label>:9                                       ; preds = %0
  %10 = load %struct.RefcountedObject*, %struct.RefcountedObject** %4, align 8
  call void @vist_deallocObject(%struct.RefcountedObject* %10)
  br label %18

; <label>:11                                      ; preds = %0
  %12 = load %struct.RefcountedObject*, %struct.RefcountedObject** %4, align 8
  store %struct.RefcountedObject* %12, %struct.RefcountedObject** %1, align 8
  %13 = load %struct.RefcountedObject*, %struct.RefcountedObject** %1, align 8
  %14 = getelementptr inbounds %struct.RefcountedObject, %struct.RefcountedObject* %13, i32 0, i32 1
  store i32 1, i32* %2, align 4
  %15 = load i32, i32* %2, align 4
  %16 = atomicrmw sub i32* %14, i32 %15 monotonic
  store i32 %16, i32* %3, align 4
  %17 = load i32, i32* %3, align 4
  br label %18

; <label>:18                                      ; preds = %11, %9
  %19 = load %struct.RefcountedObject*, %struct.RefcountedObject** %4, align 8
  %20 = getelementptr inbounds %struct.RefcountedObject, %struct.RefcountedObject* %19, i32 0, i32 1
  %21 = load i32, i32* %20, align 8
  %22 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.2, i32 0, i32 0), i32 %21)
  ret void
}

; Function Attrs: noinline ssp uwtable
define void @vist_retainObject(%struct.RefcountedObject* %object) #1 {
  %1 = alloca %struct.RefcountedObject*, align 8
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca %struct.RefcountedObject*, align 8
  store %struct.RefcountedObject* %object, %struct.RefcountedObject** %4, align 8
  %5 = load %struct.RefcountedObject*, %struct.RefcountedObject** %4, align 8
  store %struct.RefcountedObject* %5, %struct.RefcountedObject** %1, align 8
  %6 = load %struct.RefcountedObject*, %struct.RefcountedObject** %1, align 8
  %7 = getelementptr inbounds %struct.RefcountedObject, %struct.RefcountedObject* %6, i32 0, i32 1
  store i32 1, i32* %2, align 4
  %8 = load i32, i32* %2, align 4
  %9 = atomicrmw add i32* %7, i32 %8 monotonic
  store i32 %9, i32* %3, align 4
  %10 = load i32, i32* %3, align 4
  %11 = load %struct.RefcountedObject*, %struct.RefcountedObject** %4, align 8
  %12 = getelementptr inbounds %struct.RefcountedObject, %struct.RefcountedObject* %11, i32 0, i32 1
  %13 = load i32, i32* %12, align 8
  %14 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.3, i32 0, i32 0), i32 %13)
  ret void
}

; Function Attrs: noinline ssp uwtable
define void @vist_releaseRetainedObject(%struct.RefcountedObject* %object) #1 {
  %1 = alloca %struct.RefcountedObject*, align 8
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca %struct.RefcountedObject*, align 8
  store %struct.RefcountedObject* %object, %struct.RefcountedObject** %4, align 8
  %5 = load %struct.RefcountedObject*, %struct.RefcountedObject** %4, align 8
  store %struct.RefcountedObject* %5, %struct.RefcountedObject** %1, align 8
  %6 = load %struct.RefcountedObject*, %struct.RefcountedObject** %1, align 8
  %7 = getelementptr inbounds %struct.RefcountedObject, %struct.RefcountedObject* %6, i32 0, i32 1
  store i32 1, i32* %2, align 4
  %8 = load i32, i32* %2, align 4
  %9 = atomicrmw add i32* %7, i32 %8 monotonic
  store i32 %9, i32* %3, align 4
  %10 = load i32, i32* %3, align 4
  %11 = load %struct.RefcountedObject*, %struct.RefcountedObject** %4, align 8
  %12 = getelementptr inbounds %struct.RefcountedObject, %struct.RefcountedObject* %11, i32 0, i32 1
  %13 = load i32, i32* %12, align 8
  %14 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.3, i32 0, i32 0), i32 %13)
  ret void
}

; Function Attrs: noinline nounwind ssp uwtable
define i32 @vist_getObjectRefcount(%struct.RefcountedObject* %object) #4 {
  %1 = alloca %struct.RefcountedObject*, align 8
  store %struct.RefcountedObject* %object, %struct.RefcountedObject** %1, align 8
  %2 = load %struct.RefcountedObject*, %struct.RefcountedObject** %1, align 8
  %3 = getelementptr inbounds %struct.RefcountedObject, %struct.RefcountedObject* %2, i32 0, i32 1
  %4 = load i32, i32* %3, align 8
  ret i32 %4
}

; Function Attrs: noinline nounwind ssp uwtable
define zeroext i1 @vist_objectHasUniqueReference(%struct.RefcountedObject* %object) #4 {
  %1 = alloca %struct.RefcountedObject*, align 8
  store %struct.RefcountedObject* %object, %struct.RefcountedObject** %1, align 8
  %2 = load %struct.RefcountedObject*, %struct.RefcountedObject** %1, align 8
  %3 = getelementptr inbounds %struct.RefcountedObject, %struct.RefcountedObject* %2, i32 0, i32 1
  %4 = load i32, i32* %3, align 8
  %5 = icmp eq i32 %4, 1
  ret i1 %5
}

; Function Attrs: noinline ssp uwtable
define void @"vist$Uprint_ti64"(i64 %i) #1 {
  %1 = alloca i64, align 8
  store i64 %i, i64* %1, align 8
  %2 = load i64, i64* %1, align 8
  %3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.4, i32 0, i32 0), i64 %2)
  ret void
}

; Function Attrs: noinline ssp uwtable
define void @"vist$Uprint_ti32"(i32 %i) #1 {
  %1 = alloca i32, align 4
  store i32 %i, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.5, i32 0, i32 0), i32 %2)
  ret void
}

; Function Attrs: noinline ssp uwtable
define void @"vist$Uprint_tf64"(double %d) #1 {
  %1 = alloca double, align 8
  store double %d, double* %1, align 8
  %2 = load double, double* %1, align 8
  %3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.6, i32 0, i32 0), double %2)
  ret void
}

; Function Attrs: noinline ssp uwtable
define void @"vist$Uprint_tf32"(float %d) #1 {
  %1 = alloca float, align 4
  store float %d, float* %1, align 4
  %2 = load float, float* %1, align 4
  %3 = fpext float %2 to double
  %4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.6, i32 0, i32 0), double %3)
  ret void
}

; Function Attrs: noinline ssp uwtable
define void @"vist$Uprint_tb"(i1 zeroext %b) #1 {
  %1 = alloca i8, align 1
  %2 = zext i1 %b to i8
  store i8 %2, i8* %1, align 1
  %3 = load i8, i8* %1, align 1
  %4 = trunc i8 %3 to i1
  %5 = select i1 %4, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.7, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.8, i32 0, i32 0)
  %6 = call i32 (i8*, ...) @printf(i8* %5)
  ret void
}

; Function Attrs: noinline ssp uwtable
define void @"vist$Uprint_top"(i8* %str) #1 {
  %1 = alloca i8*, align 8
  store i8* %str, i8** %1, align 8
  %2 = load i8*, i8** %1, align 8
  %3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.9, i32 0, i32 0), i8* %2)
  ret void
}

attributes #0 = { alwaysinline nounwind ssp uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="core2" "target-features"="+cx16,+fxsr,+mmx,+sse,+sse2,+sse3,+ssse3" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline ssp uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="core2" "target-features"="+cx16,+fxsr,+mmx,+sse,+sse2,+sse3,+ssse3" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="core2" "target-features"="+cx16,+fxsr,+mmx,+sse,+sse2,+sse3,+ssse3" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="core2" "target-features"="+cx16,+fxsr,+mmx,+sse,+sse2,+sse3,+ssse3" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noinline nounwind ssp uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="core2" "target-features"="+cx16,+fxsr,+mmx,+sse,+sse2,+sse3,+ssse3" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"PIC Level", i32 2}
!1 = !{!"Apple LLVM version 7.3.0 (clang-703.0.29)"}
