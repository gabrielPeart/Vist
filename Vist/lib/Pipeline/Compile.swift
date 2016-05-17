//
//  Compile.swift
//  Vist
//
//  Created by Josef Willsher on 08/12/2015.
//  Copyright © 2015 vistlang. All rights reserved.
//

import class Foundation.NSTask
import class Foundation.NSPipe
import class Foundation.NSFileManager
import Foundation.NSString


struct CompileOptions : OptionSetType {
    
    let rawValue: Int
    init(rawValue: Int) { self.rawValue = rawValue }
    
    static let dumpAST = CompileOptions(rawValue: 1 << 1)
    static let dumpVIR = CompileOptions(rawValue: 1 << 2)
    static let dumpLLVMIR = CompileOptions(rawValue: 1 << 3)
    static let dumpASM = CompileOptions(rawValue: 1 << 4)
    
    static let buildAndRun = CompileOptions(rawValue: 1 << 5)
    static let verbose = CompileOptions(rawValue: 1 << 6)
    static let preserveTempFiles = CompileOptions(rawValue: 1 << 7)

    static let disableStdLibInlinePass = CompileOptions(rawValue: 1 << 8)
    private static let runVIROptPasses = CompileOptions(rawValue: 1 << 9)
    private static let runLLVMOptPasses = CompileOptions(rawValue: 1 << 10)
    static let aggressiveOptimisation = CompileOptions(rawValue: 1 << 11)
    /// No optimisations
    static let Onone: CompileOptions = []
    /// No optimisations, dont even inline stdlib symbols
    static let O0: CompileOptions = [disableStdLibInlinePass]
    /// Low opt level
    static let O: CompileOptions = [runVIROptPasses, runLLVMOptPasses]
    /// High opt level
    static let Ohigh: CompileOptions = [O, aggressiveOptimisation]
    
    static let produceLib = CompileOptions(rawValue: 1 << 12)
    /// Compiles stdlib.vist
    private static let compileStdLib = CompileOptions(rawValue: 1 << 13)
    /// Parses the document as if it were the stdlib, exposing Builtin types and functions
    private static let parseStdLib = CompileOptions(rawValue: 1 << 14)
    /// Compiles the standard libary before the input files
    static let buildStdLib: CompileOptions = [compileStdLib, parseStdLib, produceLib, buildRuntime, linkWithRuntime, Ohigh, disableStdLibInlinePass,
                                              verbose, preserveTempFiles]
    
    /// Compiles the runtime
    static let buildRuntime = CompileOptions(rawValue: 1 << 15)
    static let debugRuntime = CompileOptions(rawValue: 1 << 16)
    /// Links the input files with the runtime
    private static let linkWithRuntime = CompileOptions(rawValue: 1 << 17)
    /// Parse this file as stdlib code and link manually with runtime
    static let doNotLinkStdLib: CompileOptions = [buildRuntime, linkWithRuntime, parseStdLib]
}

/// Compiles series of files
/// - parameter fileNames: The file paths to compile
/// - parameter inDirectory: The current working directory
/// - parameter out: Override stdout 
/// - parameter options: An option set of compilation flags
func compileDocuments(
    fileNames: [String],
    inDirectory currentDirectory: String,
    out: NSPipe? = nil,
    options: CompileOptions
    ) throws {
    
    var head: AST? = nil
    var all: [AST] = []
    
    let globalScope = SemaScope.globalScope(options.contains(.parseStdLib))
    
    for (index, fileName) in fileNames.enumerate() {
        
        let path = "\(currentDirectory)/\(fileName)"
        let doc = try String(contentsOfFile: path, encoding: NSUTF8StringEncoding)
        if options.contains(.verbose) { print("----------------------------SOURCE-----------------------------", doc, "\n\n-----------------------------TOKS------------------------------\n") }
        
        // Lex code
        let tokens = try doc.getTokens()
        
        if options.contains(.verbose) {
            tokens
                .map {"\($0.0): \t\t\t\t\t\($0.1.range.start)--\($0.1.range.end)"}
                .forEach { print($0) }
            print("\n\n------------------------------AST-------------------------------\n")
        }
        
        // parse tokens & generate AST
        let ast = try Parser.parseWith(tokens, isStdLib: options.contains(.parseStdLib))
        
        if options.contains(.dumpAST) { print(ast.astString); return }
        if options.contains(.verbose) { print(ast.astString) }
        
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
    
    if options.contains(.verbose) { print("\n------------------------SEMA & LINK AST----------------------------\n") }
    
    guard let main = head else { fatalError("No main file supplied") }
    let ast = main
    
    // TODO: parralelise file compilation
    
    try sema(ast, globalScope: globalScope)
    if options.contains(.dumpAST) { print(ast.astString); return }
    if options.contains(.verbose) { print(ast.astString, "\n----------------------------VIR GEN-------------------------------\n") }
    
    let file = fileNames.first!.stringByReplacingOccurrencesOfString(".vist", withString: "")
    
    
    let virModule = Module()
    
    try ast.emitVIR(module: virModule, isLibrary: options.contains(.produceLib))
    try virModule.vir.writeToFile("\(currentDirectory)/\(file)_.vir", atomically: true, encoding: NSUTF8StringEncoding)
    
    if options.contains(.verbose) { print(virModule.vir, "\n----------------------------VIR OPT-------------------------------\n") }
    
    try virModule.runPasses(optLevel: options.optLevel())
    try virModule.vir.writeToFile("\(currentDirectory)/\(file).vir", atomically: true, encoding: NSUTF8StringEncoding)
    
    if options.contains(.dumpVIR) { print(virModule.vir); return }
    if options.contains(.verbose) { print(virModule.vir) }
    
    if options.contains(.buildRuntime) {
        buildRuntime(debugRuntime: options.contains(.debugRuntime))
    }

    let stdlibDirectory = "\(SOURCE_ROOT)/Vist/stdlib"

    var llvmModule = LLVMModuleCreateWithName(file)
    if options.contains(.linkWithRuntime) {
        importFile("shims.c", directory: stdlibDirectory, into: &llvmModule)
    }
    configModule(llvmModule)
    
    
    
//    var t = "meme".withCString { c in
//        TypeMetadata(conceptConformances: nil, numConformances: 0, name: UnsafeMutablePointer(c))
//    }
//    t.__lower()
    
    let IGF: IRGenFunction = (LLVMBuilder(), LLVMModule(name: ""))
    var wt = UnsafeMutablePointer<ValueWitness>.alloc(1)
    let witnessTable = WitnessTable(witnesses: wt, numWitnesses: 0)
    try witnessTable.__lower(IGF)
    
    
    
    defer {
        // remove files
        if !options.contains(.preserveTempFiles) {
            for file in ["\(file).ll", "\(file)_.ll", "\(file).s", "\(file).vir", "\(file)_.vir"] {
                _ = try? NSFileManager.defaultManager().removeItemAtPath("\(currentDirectory)/\(file)")
            }
        }
    }
    
    // Generate LLVM IR code for program
    if options.contains(.verbose) { print("\n-----------------------------IR LOWER------------------------------\n") }
    try virModule.virLower(LLVMModule(ref: llvmModule), isStdLib: options.contains(.parseStdLib))
    
    // print and write to file
    try String.fromCString(LLVMPrintModuleToString(llvmModule))?.writeToFile("\(currentDirectory)/\(file)_.ll", atomically: true, encoding: NSUTF8StringEncoding)
    
    if options.contains(.verbose) { LLVMDumpModule(llvmModule); print("\n\n----------------------------OPTIM----------------------------\n") }
    
    
    //run my optimisation passes
    
    if !options.contains(.disableStdLibInlinePass) {
        performLLVMOptimisations(llvmModule,
                                 Int32(options.optLevel().rawValue),
                                 options.contains(.compileStdLib))
    }
    try String.fromCString(LLVMPrintModuleToString(llvmModule))?.writeToFile("\(currentDirectory)/\(file).ll", atomically: true, encoding: NSUTF8StringEncoding)
    
    if options.contains(.runLLVMOptPasses) {
        NSTask.execute(.opt,
                       files: ["\(file).ll"],
                       outputName: "\(file).ll",
                       cwd: currentDirectory,
                       args: "-S", "-O3")
    }
    
    let llvmIR = try String(contentsOfFile: "\(currentDirectory)/\(file).ll", encoding: NSUTF8StringEncoding) ?? ""
    if options.contains(.dumpLLVMIR) { print(llvmIR); return }
    if options.contains(.verbose) { print(llvmIR, "\n\n----------------------------LINK-----------------------------\n") }
    
    let libVistPath = "/usr/local/lib/libvist.dylib"
    let libVistRuntimePath = "/usr/local/lib/libvistruntime.dylib"
    
    if options.contains(.compileStdLib) {
        
        // .ll -> .bc
        // for optimiser
        NSTask.execute(.assemble,
                       files: ["\(file).ll"],
                       outputName: "\(file).bc",
                       cwd: currentDirectory)
        
        // .ll -> .dylib
        // to link against program
        NSTask.execute(.clang,
                       files: [libVistRuntimePath, "\(file).bc"],
                       outputName: libVistPath,
                       cwd: currentDirectory,
                       args: "-dynamiclib")
    }
    else {
        
        // .ll -> .s
        // for printing/saving
        NSTask.execute(.clang,
                       files: ["\(file).ll"],
                       cwd: currentDirectory,
                       args: "-S")
        
        let asm = try String(contentsOfFile: "\(currentDirectory)/\(file).s", encoding: NSUTF8StringEncoding)
        
        if options.contains(.dumpASM) { print(asm); return }
        if options.contains(.verbose) { print(asm) }
        
        
        let inputFiles = options.contains(.doNotLinkStdLib) ? ["\(file).ll"] : [libVistRuntimePath, libVistPath, "\(file).ll"]
        // .ll -> exec
        NSTask.execute(.clang,
                       files: inputFiles,
                       outputName: file,
                       cwd: currentDirectory)
        
        if options.contains(.buildAndRun) {
            if options.contains(.verbose) { print("\n\n-----------------------------RUN-----------------------------\n") }
            runExecutable(file, inDirectory: currentDirectory, out: out)
        }
        
    }
    
}


func runExecutable(
    file: String,
    inDirectory: String,
    out: NSPipe? = nil
    ) {
    
    /// Run the program
    let runTask = NSTask()
    runTask.currentDirectoryPath = inDirectory
    runTask.launchPath = "\(inDirectory)/\(file)"
    
    if let out = out {
        runTask.standardOutput = out
    }
    
    runTask.launch()
    runTask.waitUntilExit()
    
    if case .UncaughtSignal = runTask.terminationReason {
        let message = "Program terminated with exit code: \(runTask.terminationStatus)"
        if let o = out {
            o.fileHandleForWriting.writeData(message.dataUsingEncoding(NSUTF8StringEncoding)!)
        }
        else {
            print(message)
        }
    }
}


func buildRuntime(debugRuntime debug: Bool) {
    
    let runtimeDirectory = "\(SOURCE_ROOT)/Vist/stdlib/runtime"
    let libVistRuntimePath = "/usr/local/lib/libvistruntime.dylib"
    
    // .cpp -> .dylib
    // to link against program
    NSTask.execute(.clang,
                   files: ["runtime.cpp", "Metadata.cpp", "RefcountedObject.cpp"],
                   outputName: libVistRuntimePath,
                   cwd: runtimeDirectory,
                   args: "-dynamiclib", "-std=c++14", "-lstdc++", "-includeruntime.h", "-DRUNTIME", debug ? "-DREFCOUNT_DEBUG" : "")
    
}


