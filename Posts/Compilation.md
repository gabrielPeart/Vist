# Compilation overview

As a statically typed language, the vist compiler has to be able to generate a lot of information about the vist source. This type information allows the compiler to generate optimisable LLVM and performant machine code.

```swift
let a = 1
print a + 2
```

The `+` operator and integers are lowered to a native CPU addition instruction (which can be statically folded) on native int types.

```asm
_main:                                  ## @main
## BB#0:                                ## %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movl	$3, %eax
	movl	%eax, %edi
	popq	%rbp
	jmp		"_-Uprint_i64"          ## TAILCALL
```

### The standard library

Much of vist’s behaviour is implemented in the standard library — types like Int and String are *written in Vist*; their layout and behaviour is not hardcoded into the compiler, but their interface is exposed to it; `String` has an initialiser `init Builtin.OpaquePointer Builtin.Int Builtin.Bool = (ptr count isUTF8Encoded)`. To generate a Vist string literal the compiler emits a call to this function, passing in the constant string (stored in the data section of the binary) with the statically known buffer size and encoding. The user’s code is dynamically linked to the standard library where this initialiser constructs a heap buffer and generates a String instance from CPU native Builtin types.

Basic operators like `+` and `&&` are also implemented in the stdlib; `+` being defined as `func + :: Int Int -> Int = (l r)`. The body of this function extracts the CPU level integers from the `Int` structs and passes them to the `Builtin.i_add` function — a direct call to the `i_add` VIR instruction which will be lowered to a native CPU add instruction.

### Compilation

A vist program is first transformed into a series of tokens: `let`, `identifier="a"`, `assign`, `int_literal=1`, `identifier="print"`, `identifier="a"`...

These are then parsed to form an AST (abstract syntax tree).

```
(AST:
  exprs=([]:
    #0=(variable_decl:
      name=("a"),
      isMutable=(false),
      value=(int_literal:
        val=(1),
        size=(64),
      ),
    ),
    #1=(func_call_expr:
      name=("print"),
      args=(tuple_expr:
        elements=([]:
          #0=(binary_operator_expr:
            op=("+"),
            lhs=(variable_expr: name=("a")),
            rhs=(int_literal:
              val=(2),
              size=(64),
            ),
          ),
        ),
      ),
    ),
  ),
)

```

I then run a semantic analysis pass which adds type information to the tree, check it is valid Vist code, and diagnosing type errors. The semantic analysis pass works out that `a` has type `Int` and `print`, a function in the standard library, has type `Int -> ()`.

From the type annotated AST the compiler generates VIR — an SSA representation of the program which has many of the high level semantics of Vist. The high level instructions like `retain_object` and `existential_open` allow the VIR optimiser to work with code which doesn’t obfuscate the semantics of the language. 

```
type %Int = { %Builtin.Int64 }

func @main : &thin () -> %Builtin.Void {
$entry:
  %0 = int_literal 1  	// user: %1
  %1 = struct %I (%0: %Builtin.Int64)  	// user: %a
  variable_decl %a = %1: %Int  	// user: %4
  %2 = int_literal 2  	// user: %3
  %3 = struct %I (%2: %Builtin.Int64)  	// user: %4
  %4 = call @-P_tII (%a: %Int, %3: %Int)  	// user: %5
  %5 = call @print_tI (%4: %Int) 
  return ()
}

func @-P_tII : &thin (%Int, %Int) -> %Int

func @print_tI : &thin (%Int) -> %Builtin.Void
```

The VIR is lowered to LLVM by mapping VIR instructions into one or more LLVM ones. Low level concepts like function calls, basic integer operations, or stack allocations are transformed directly into the respective LLVM instructions/intrinsics, and higher level operations become sequences of LLVM instructions; reference counting operations become bitcasts and calls to runtime functions which modify the reference count, VIR’s basic block parameters become LLVM phi instructions, string literals become calls to stdlib initialisers, existential concept operations become operations boxing and unboxing the value and its metadata.


```llvm
%Int.st = type { i64 }

define void @main() {
entry:
  call void @print_tI(%Int.st { i64 3 })
  ret void
}

declare void @print_tI(%Int.st)
```

### The runtime

Vist has many dynamic features which benefit from having the static type information — analysing concept conformances allows Vist to generate witness tables as metadata. A witness table is an array of the functions in a type which *witness* a concept’s required methods, it is a record of the conformance.

Constructing a protocol existential … 

The runtime also implements Vist’s memory management system: automatic reference counting. When declaring a `ref type` the instance is stored in the heap along with a reference count. As the  shared instance can outlive the life of a function, the compiler cannot know when to deallocate the object; instead, when a variable captures an instance it *retains* it and when the variable dies it gets *released*. These operations increment and decrement the reference count respectively, and when the count falls to 0 (and the object is no longer referenced) it is deallocated. 

When generating VIR the compiler inserts `retain_object` whenever a variable captures a reference object or when it is passed into a function and `release_object` calls when these variables exit scope. The reference counting is implemented in the runtime — `vist_releaseObject` for example decrements the ref count and deallocates it if it falls to 0. The VIR instructions are lowered to a call to these runtime functions.

