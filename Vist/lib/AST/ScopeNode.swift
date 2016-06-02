//
//  ScopeNode.swift
//  Vist
//
//  Created by Josef Willsher on 06/02/2016.
//  Copyright © 2016 vistlang. All rights reserved.
//


/// AST nodes which have children
///
/// for example blocks, the global scope, structs
///
protocol ScopeNode {
    var childNodes: [ASTNode] { get }
}

extension ScopeNode {
    
    func walkChildren<Ret>(inCollector collector: ErrorCollector? = nil, fn: @noescape (ASTNode) throws -> Ret) throws {
        _ = try childNodes.walkChildren(collector: collector, fn)
    }
}

extension Collection where Iterator.Element : ASTNode {
    
    /// Maps the input function over the children, which are types conforming to ASTNode
    ///
    /// Catches errors and continues walking the tree, throwing them all at
    /// in an ErrorCollection at the end
    ///
    /// ```
    /// try initialisers.walkChildren { i in
    ///     try i.codeGen(stackFrame)
    /// }
    /// ```
    ///
    @discardableResult
    func walkChildren<Ret>(collector: ErrorCollector? = nil, _ fn: @noescape (Iterator.Element) throws -> Ret) throws -> [Ret] {

        collector?.caught = false
        let errorCollector = collector ?? ErrorCollector()
        var res: [Ret] = []
        
        for exp in self {
            do {
                try res.append(fn(exp))
            }
            catch let error as VistError {
                errorCollector.errors.append(error)
            }
        }
        
        if collector == nil {
            try errorCollector.throwIfErrors()
        }
        return res
    }
}

extension Collection where Iterator.Element == ASTNode {
    
    /// Maps the input function over the ASTNode children
    ///
    /// Catches errors and continues walking the tree, throwing them all at 
    /// in an ErrorCollection at the end
    ///
    /// ```
    /// try block.exprs.walkChildren { exp in
    ///     try exp.nodeCodeGen(stackFrame)
    /// }
    /// ```
    @discardableResult
    func walkChildren<Ret>(collector: ErrorCollector? = nil, _ fn: @noescape (ASTNode) throws -> Ret) throws -> [Ret] {
        
        collector?.caught = false
        let errorCollector = collector ?? ErrorCollector()
        var res: [Ret] = []
        
        for exp in self {
            do {
                try res.append(fn(exp))
            }
            catch let error as VistError {
                errorCollector.errors.append(error)
            }
        }
        
        if collector == nil {
            try errorCollector.throwIfErrors()
        }
        
        return res
    }
}

extension Collection where Iterator.Element : ASTNode {
    
    /// flatMaps `$0 as? T` over the collection
    func mapAs<T>(_: T.Type) -> [T] {
        return flatMap { $0 as? T }
    }
}

/// Abstracts the collection of errors, so multiple throwing functions can throw and add to this
///
/// Requires any errors to be thrown with the `throwIfErrors()` function
///
final class ErrorCollector {
    
    private var errors: [VistError] = []
    private var caught = false
    private var file: StaticString, line: UInt, function: String
    
    // on init, captures scope
    // so if not thrown fatal error has helpful info
    init(file: StaticString = #file, line: UInt = #line, function: String = #function) {
        self.file = file
        self.line = line
        self.function = function
    }
    
    /// Runs a code block and catches any errors
    @discardableResult
    func run<T>(block: @noescape () throws -> T) throws -> T? {
        caught = false

        do {
            return try block()
        }
        catch let error as VistError {
            errors.append(error)
        }
        return nil
    }
    
    /// Throws all errors collected
    func throwIfErrors() throws {
        caught = true
        do {
            try errors.throwIfErrors()
        }
        catch let error as VistError {
            throw error
        }
    }
    
    deinit {
        if !caught {
            fatalError("Error thrown and not handled\nCollection initialised on line \(line), in function '\(function)', in file \(file)'")
        }
    }
}


