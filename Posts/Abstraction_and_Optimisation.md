##Abstraction & Optimisation

[Like Swift](http://arstechnica.com/apple/2014/10/os-x-10-10/22/), Vist tries to keep the standard library defined separately from the compiler; this allows the language implementation to be separated from its compilation which while theoretically more elegant, imposes implementation obstacles. The difficulty here is maintaining performance—I need to guarantee that calls to these functions will be transformed into the native calls and that they will be inlined *as early as possible*, so LLVM can work its magic.

The standard library has access to a special set of native functions and types with prefix `LLVM.` For example, the standard library’s `+` operator is [defined as](../Vist/stdlib/stdlib.vist)

```swift
@inline @operator(80)
func + :: Int Int -> Int = (a b) {
	let v = LLVM.i_add a.value b.value
	condFail v.1
	return Int v.0
}
```

The call to `LLVM.i_add` returns a tuple of type `(LLVM.Int LLVM.Bool)`—the second element is used as a check for overflow, which is done by a call to the stdlib’s `condFail` function. Then the result (of type LLVM.Int64) is wrapped in an Int type using `Int`’s initialiser.

(`@inline` declares that this function requires being inlined, and `@operator(80)` declares that `+` is an infix operator with precedence 80.)

The `Int` type has 1 property `value` of type `LLVM.Int64`, which is the native hardware supported i64 object. The stdlib functions which take `Int`s (such as `+`) extract this value using to pass into the hardware supported functions. Vist automatically generates a *memberwise initialiser* which lets you create an `Int` instance by passing the initialiser a `LLVM.Int64`.

This is how the compiler turns literals like `50`, `true`, and `40.1` into the `Int`, `Bool`, and `Double` types the Vist writers can use; the compiler gets special knowledge of these initialisers and functions existing [baked into it](../Vist/AST/StdLibDef.swift), and wraps any literal with a call to that function. This means code like

```swift
let a = 1 + 2
print a
```

ends up getting transformed into

```llvm
define void @main() {
entry:
	%0 = call { i64 } @_Int_i64(i64 1), !stdlib.call.optim !0
	%1 = call { i64 } @_Int_i64(i64 2), !stdlib.call.optim !0
	%"+.res" = call { i64 } @"_+_S.i64_S.i64"({ i64 } %0, { i64 } %1), !stdlib.call.optim !0
	call void @_print_S.i64({ i64 } %"+.res"), !stdlib.call.optim !0
	ret void
}
declare { i64 } @_Int_i64(i64)
declare { i64 } @"_+_S.i64_S.i64"({ i64 }, { i64 })
declare void @_print_S.i64({ i64 })
```

This is obviously too complicated! Our efforts to simplify the compiler’s architecture has led to our IR getting much more complex, and our generated program slower. Moreover, our added indirection is stopping important optimisations being performed—as LLVM’s optimiser has no knowledge of what `_+_S.i64_S.i64` (the `+` function’s mangled name) does, it cannot reason about its behaviour, and fold the `1 + 2` to a `3` as we would hope.

To get around this, I have [an optimisation pass](../Vist/Optimiser/StdLibInline.cpp) which (when it sees the `!stdlib.call.optim` metadata on any of my stdlib functions) can extract its implementation from a LLVM [(bitcode)](http://llvm.org/docs/BitCodeFormat.html) file of of my [stdlib](../Vist/StdLib/stdlib.ll), and [inlines](https://en.wikipedia.org/wiki/Inline_expansion) it before the rest of the optimisations. This means our program can become

```llvm
define void @main() #0 {
entry:
	tail call void @"_$print_i64"(i64 3)
	ret void
}
declare void @"_$print_i64"(i64) #1
```

Much better, I’d say.

Here, inlining the integer’s initialisers has let the optimiser know what is going on inside that little `Int` struct, which means it can see through all the [`insertvalue`](http://llvm.org/docs/LangRef.html#insertvalue-instruction) and [`extractvalue`](http://llvm.org/docs/LangRef.html#extractvalue-instruction) instructions (made by calling my `Int` initialiser and by getting the raw value using `.value`), flattening my structs and allowing it to be reduce it to a final `i64 3`, a native object.

Even better, inlining the `+` function lets [the optimiser](http://llvm.org/docs/Passes.html) get rid of my conditional branches (from the overflow checks), and even lets the `llvm.sadd.with.overflow.i64` call be calculated statically!

All thats left is a call to the `_$print_i64` function—one of the [runtime functions](../Vist/Runtime/runtime.cpp) which just calls `printf` from the c standard library on my number.

And thats it, we now link my code with the standard library (to allow some last minute, link-time optimisations) and assemble the object files to generate the executable. The assembly looks like this

```assembly
	.section	__TEXT,__text,regular,pure_instructions
	.macosx_version_min 10, 11
	.globl	_main
	.align	4, 0x90
_main:                  # @main function
## BB#0:                # %entry block
	pushq	%rbp
	movq	%rsp, %rbp
	movl	$3, %eax    # call on 3
	movl	%eax, %edi
	popq	%rbp
	jmp	__$print_i64    # call @_$print_i64

	.globl	__$print_i64
	.align	4, 0x90
__$print_i64:           # @"_$print_i64" function
## BB#0:                # %entry block
	pushq	%rbp
	movq	%rsp, %rbp
	leaq	L_.str(%rip), %rax
	xorl	%ecx, %ecx
	movb	%cl, %dl
	movq	%rdi, -8(%rbp)
	movq	%rax, %rdi
	movq	-8(%rbp), %rsi
	movb	%dl, %al
	popq	%rbp
	jmp	_printf         # call @printf

	.section	__TEXT,__cstring,cstring_literals
L_.str:
	.asciz	"%lli\n"    # @.str string used to print the int
.subsections_via_symbols
```