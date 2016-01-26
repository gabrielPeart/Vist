//
//  Compile.swift
//  Vist
//
//  Created by Josef Willsher on 08/12/2015.
//  Copyright © 2015 vistlang. All rights reserved.
//

import Foundation

private let llvmDirectory = "/usr/local/Cellar/llvm/3.6.2/bin"
private let stdLibDirectory = "\(SOURCE_ROOT)/Vist/stdlib"
private let runtimeDirectory = "\(SOURCE_ROOT)/Vist/Runtime"


// IDEA to have multiple file compilation:
//   - A FunctionPrototype AST object which is added to ast of other files
//   - When IRGen'd it adds the function decl to the module
//      - Is this how a FnDecl behaves with nil impl already?
//   - Also need a way to do this out-of-order so all functions (and types) are defined first


public func compileDocuments(fileNames: [String],
    verbose: Bool = true,
    dumpAST: Bool = false,
    irOnly: Bool = false,
    asmOnly: Bool = false,
    buildOnly: Bool = false,
    profile: Bool = true,
    optim: Bool = true,
    preserve: Bool = false,
    generateLibrary: Bool = false,
    isStdLib: Bool = false)
    throws {
        
        let currentDirectory = isStdLib ? stdLibDirectory : NSTask().currentDirectoryPath
        
        var head: AST? = nil
        var all: [AST] = []
        
        let globalScope = SemaScope(isStdLib: isStdLib)
        
        for (index, fileName) in fileNames.enumerate() {
            
            let path = "\(currentDirectory)/\(fileName)"
            let doc = try String(contentsOfFile: path, encoding: NSUTF8StringEncoding)
            if verbose { print("----------------------------SOURCE-----------------------------\n\n\(doc)\n\n\n-----------------------------TOKS------------------------------\n") }
            
            // http://llvm.org/docs/tutorial/LangImpl1.html#language
            
            
            // Lex code
            var lexer = Lexer(code: doc)
            let tokens = try lexer.getTokens()
            
            if verbose { tokens
                .map {"\($0.0): \t\t\t\t\t\($0.1.range.start)--\($0.1.range.end)"}
                .forEach { print($0) } }
            
            
            if verbose { print("\n\n------------------------------AST-------------------------------\n") }
            
            // parse tokens & generate AST
            var parser = Parser(tokens: tokens, isStdLib: true) // TODO: Update this when have better type support
            let ast = try parser.parse()
            if dumpAST { print(ast); return }
            if verbose { print(ast) }
            
            
            if let h = head {
                head = try astLink(h, other: [ast])
            }

            if index == 0 {
                head = ast
            }
            else {
                all.append(ast)
            }
        }
        
        if verbose { print("\n------------------------SEMA & LINK AST----------------------------\n") }
        
        guard let main = head else { fatalError("No main file supplied") }
        let ast = main
        
        
        
        try sema(ast, globalScope: globalScope)
        if verbose { print(ast) }
        
        let file = fileNames.first!.stringByReplacingOccurrencesOfString(".vist", withString: "")
        
        
        
        
        
        var module = LLVMModuleCreateWithName("vist_module")
        // Create vist program module and link against the helper bytecode

        if isStdLib {
            linkModule(&module, withFile: "\(runtimeDirectory)/runtime.bc")
        }
        
        configModule(module)

        
        
        
        
        if verbose { print("\n---------------------------LLVM IR----------------------------\n") }
        
        // Generate LLVM IR code for program
        
        let s = StackFrame()
        
        try ast.IRGen(module: module, isLibrary: generateLibrary, stackFrame: s)
        
        // print and write to file
        try String.fromCString(LLVMPrintModuleToString(module))?.writeToFile("\(currentDirectory)/\(file)_.ll", atomically: true, encoding: NSUTF8StringEncoding)
        
        if verbose { LLVMDumpModule(module) }
        
        
        //run my optimisation passes
                
        if verbose { print("\n\n----------------------------OPTIM----------------------------\n") }

        let fileTask = NSTask()
        fileTask.currentDirectoryPath = currentDirectory
        fileTask.launchPath = "/usr/bin/touch"
        fileTask.arguments = ["\(file).ll"]
        
        fileTask.launch()
        fileTask.waitUntilExit()

        if optim || isStdLib {
            performLLVMOptimisations(module, 3)
        }
        else {
            performLLVMOptimisations(module, 0)
        }
        
        try String.fromCString(LLVMPrintModuleToString(module))?.writeToFile("\(currentDirectory)/\(file).ll", atomically: true, encoding: NSUTF8StringEncoding)
        
        if verbose { LLVMDumpModule(module) }

        LLVMDisposeModule(module)
        
        if irOnly { return }
        
        
        
        
        if verbose { print("\n\n-----------------------------ASM-----------------------------\n") }
        

        if !isStdLib {
            /// compiles the LLVM IR to assembly
            let compileIRtoASMTask = NSTask()
            compileIRtoASMTask.currentDirectoryPath = currentDirectory
            compileIRtoASMTask.launchPath = "/usr/bin/clang"
            compileIRtoASMTask.arguments = ["-S", "\(file).ll"]
            
            compileIRtoASMTask.launch()
            compileIRtoASMTask.waitUntilExit()
            
            let asm = try String(contentsOfFile: "\(currentDirectory)/\(file).s", encoding: NSUTF8StringEncoding)
            
            if asmOnly { print(asm); return }
            if verbose { print(asm) }
        }
        
        
        if isStdLib {
            
            // generate .o file to link against program
            let objFileTask = NSTask()
            objFileTask.currentDirectoryPath = currentDirectory
            objFileTask.launchPath = "/usr/bin/clang"
            objFileTask.arguments = ["-c", "\(file).ll"]
            
            objFileTask.launch()
            objFileTask.waitUntilExit()
            
            // generate .bc file for optimiser
            let assembleTask = NSTask()
            assembleTask.currentDirectoryPath = runtimeDirectory
            assembleTask.launchPath = "\(llvmDirectory)/llvm-as"
            assembleTask.arguments = ["\(file).ll"]
            
            assembleTask.launch()
            assembleTask.waitUntilExit()
        }
        else {

            /// link file to stdlib and compile
            let compileTask = NSTask()
            compileTask.currentDirectoryPath = currentDirectory
            compileTask.launchPath = "/usr/bin/clang"
            compileTask.arguments = ["-o", "\(file)", "\(stdLibDirectory)/stdlib.o", "\(file).ll"]
            
            compileTask.launch()
            compileTask.waitUntilExit()
            
            if buildOnly { return }
            
            
            if verbose { print("\n\n-----------------------------RUN-----------------------------\n") }
            
            /// Run the program
            let runTask = NSTask()
            runTask.currentDirectoryPath = currentDirectory
            runTask.launchPath = "\(currentDirectory)/\(file)"
            
            
            runTask.launch()
            let t0 = CFAbsoluteTimeGetCurrent()
            
            runTask.waitUntilExit()
            
            if case .UncaughtSignal = runTask.terminationReason {
                print("**Fatal Error** program ended with exit code \(runTask.terminationStatus)")
            }
            
            if profile {
                let t = CFAbsoluteTimeGetCurrent() - t0 - 0.062
                let f = NSNumberFormatter()
                f.maximumFractionDigits = 2
                f.minimumFractionDigits = 2
                print("\n--------\nTime elapsed: \(f.stringFromNumber(t)!)s")
            }

        }
        
        
        
        // remove files
        if !preserve {
            for file in ["\(file).ll", "\(file)_.ll", "\(file).s"] {
                
                let rmTask = NSTask()
                rmTask.currentDirectoryPath = currentDirectory
                rmTask.launchPath = "/bin/rm"
                rmTask.arguments = [file]
                
                rmTask.launch()
                rmTask.waitUntilExit()
            }
        }
        
        

        
}



func buildRuntime() {
    
    let runtimeDirectory = "\(SOURCE_ROOT)/Vist/Runtime"

    /// Generate LLVM IR File for the helper c++ code
    let runtimeIRGenTask = NSTask()
    runtimeIRGenTask.currentDirectoryPath = runtimeDirectory
    runtimeIRGenTask.launchPath = "/usr/bin/llvm-gcc"
    runtimeIRGenTask.arguments = ["runtime.cpp", "-S", "-emit-llvm"]
    
    runtimeIRGenTask.launch()
    runtimeIRGenTask.waitUntilExit()
    
    /// Turn that LLVM IR code into LLVM bytecode
    let assembleTask = NSTask()
    assembleTask.currentDirectoryPath = runtimeDirectory
    assembleTask.launchPath = "\(llvmDirectory)/llvm-as"
    assembleTask.arguments = ["runtime.ll"]
    
    assembleTask.launch()
    assembleTask.waitUntilExit()
}


