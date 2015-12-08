//
//  Compile.swift
//  Vist
//
//  Created by Josef Willsher on 08/12/2015.
//  Copyright © 2015 vistlang. All rights reserved.
//

import Foundation
import LLVM


func compileDocument(fileName: String) throws {
    
    let doc = try! String(contentsOfFile: fileName, encoding: NSUTF8StringEncoding)
    print("------------------SOURCE-------------------\n\n\(doc)\n\n\n-------------------TOKS--------------------\n")
    
    // http://llvm.org/docs/tutorial/LangImpl1.html#language
    
    var lexer = Lexer(code: doc)
    let tokens = try lexer.getTokens()
    
    tokens
        .map {"\($0.0): \t\t\t\t\t\($0.1.range.start)--\($0.1.range.end)"}
        .forEach { print($0) }
    
    var parser = Parser(tokens: tokens)
    
    print("\n\n--------------------AST---------------------\n")
    let ast = try parser.parse()
    print(ast.description())
    
    print("\n\n-----------------LLVM IR------------------\n")
    
    let a = try ast.codeGen()
    
    LLVMDumpValue(a)

}