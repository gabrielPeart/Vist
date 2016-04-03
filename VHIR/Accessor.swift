//
//  Accessor.swift
//  Vist
//
//  Created by Josef Willsher on 12/03/2016.
//  Copyright © 2016 vistlang. All rights reserved.
//

/// Provides means of reading a value from memory
///
/// A `getter` allows loading of a value, and conformants may also provide a ``setter
protocol Accessor {
    /// Gets the value from the stored object
    func getter() throws -> Value
    /// Returns copy of this acccessor with reference semantics
    /// - note: not guaranteed to be a reference to the original.
    func asReferenceAccessor() throws -> GetSetAccessor
    
    var storedType: Ty? { get }
    
    func getMemCopy() throws -> GetSetAccessor
    
    func releaseIfRefcounted() throws
    func retainIfRefcounted() throws
    func releaseUnretainedIfRefcounted() throws
}


/// An Accessor which allows setting, as well as self lookup by ptr
protocol GetSetAccessor : Accessor {
    var mem: LValue { get }
    /// Stores `val` in the stored object
    func setter(val: Operand) throws
    /// The pointer to the stored object
    func reference() throws -> PtrOperand
    
    /// Return the aggregate reference -- not guaranteed to be the same
    /// as the location `reference` uses to access elements
    func aggregateReference() -> PtrOperand
}



extension Accessor {
    
    func getMemCopy() throws -> GetSetAccessor {
        return try getter().accessor().asReferenceAccessor()
    }
    
    func releaseIfRefcounted() { }
    func retainIfRefcounted() { }
    func releaseUnretainedIfRefcounted() { }
}

extension GetSetAccessor {
    // if its already a red accessor we're done
    func asReferenceAccessor() throws -> GetSetAccessor { return self }
    
    var storedType: Ty? { return mem.memType }
    
    func getter() throws -> Value {
        return try mem.module.builder.buildLoad(from: reference())
    }
    
    func setter(val: Operand) throws {
        try mem.module.builder.buildStore(val, in: reference())
    }
    
    func reference() -> PtrOperand { return PtrOperand(mem) }
    
    // default impl of `aggregateReference` is the same as `reference`
    func aggregateReference() -> PtrOperand { return PtrOperand(mem) }
    
    func aggregateGetter() throws -> Value {
        return try mem.module.builder.buildLoad(from: aggregateReference())
    }
    func aggregateSetter(val: Operand) throws {
        try mem.module.builder.buildStore(val, in: aggregateReference())
    }
}

// TODO: this
// should getter return an operand/ptroperand
// make `try getter().allocGetSetAccessor()` try `value.allocGetSetAccessor()`

// MARK: Implementations

/// Provides access to values by exposing a getter which returns the value
final class ValAccessor : Accessor {
    
    private var value: Value
    init(value: Value) { self.value = value }
    
    func getter() -> Value { return value }
    
    /// Alloc a new accessor and store self into it.
    /// - returns: a reference backed *copy* of `self`
    func asReferenceAccessor() throws -> GetSetAccessor {
        return try getter().allocGetSetAccessor()
    }
    
    var storedType: Ty? { return value.type }
}

// Helper function for constructing a reference copy
extension Value {
    /// Builds a reference accessor which can store into & load from
    /// the memory it allocates
    func allocGetSetAccessor() throws -> GetSetAccessor {
        let accessor = RefAccessor(memory: try module.builder.buildAlloc(type!))
        try accessor.setter(Operand(self))
        return accessor
    }
}


/// Provides access to a value with backing memory
final class RefAccessor : GetSetAccessor {
    var mem: LValue
    init(memory: LValue) { self.mem = memory }
}

final class RefCountedAccessor : GetSetAccessor {
    var mem: LValue
    
    init(refcountedBox: LValue, _reference: Value? = nil) {
        self.mem = refcountedBox
        self._reference = _reference
    }
    
    var _reference: Value? // lazy member reference
    func reference() throws -> PtrOperand {
        if let r = _reference { return try PtrOperand.fromReferenceRValue(r) }
        
        let ref = try mem.module.builder.buildStructElementPtr(aggregateReference(), property: "object")
        let load = try mem.module.builder.buildLoad(from: PtrOperand(ref), irName: mem.irName.map { "\($0).instance" })
        
        return try PtrOperand.fromReferenceRValue(load)
    }
    
    func aggregateReference() -> PtrOperand {
        return PtrOperand(mem)
    }
    
    func retain() throws {
        let function = try mem.module.getOrInsertRawRuntimeFunction(named: "vist_retainObject")!
        let bc = try mem.module.builder.buildBitcast(from: PtrOperand(mem), newType: Runtime.refcountedObjectType)
        try mem.module.builder.buildFunctionCall(function, args: [Operand(bc)])
    }
    
    func releaseUnretained() throws {
        let function = try mem.module.getOrInsertRawRuntimeFunction(named: "vist_releaseUnretainedObject")!
        let bc = try mem.module.builder.buildBitcast(from: PtrOperand(mem), newType: Runtime.refcountedObjectType)
        try mem.module.builder.buildFunctionCall(function, args: [Operand(bc)])
    }
    
    func release() throws {
        let function = try mem.module.getOrInsertRawRuntimeFunction(named: "vist_releaseObject")!
        let bc = try mem.module.builder.buildBitcast(from: PtrOperand(mem), newType: Runtime.refcountedObjectType)
        try mem.module.builder.buildFunctionCall(function, args: [Operand(bc)])
    }
    
    func getMemCopy() throws -> GetSetAccessor {
        try retain()
        let val = try mem.module.builder.buildLoad(from: PtrOperand(mem)).allocGetSetAccessor()
        return RefCountedAccessor(refcountedBox: PtrOperand(try val.reference()), _reference: _reference)
    }
    
    func releaseIfRefcounted() throws { try release() }
    func retainIfRefcounted() throws { try retain() }
    func releaseUnretainedIfRefcounted() throws { try releaseUnretained() }
}

// TODO: make a LazyRefAccessor wrap a GetSetAccessor

/// A Ref accessor whose accessor is evaluated on demand. Useful for values
/// which might not be used
final class LazyRefAccessor : GetSetAccessor {
    private var build: () throws -> LValue
    private var val: LValue?
    
    var mem: LValue {
        if let v = val { return v }
        val = try! build()
        return val!
    }
    
    init(fn: () throws -> LValue) { build = fn }
}


// mutliple users share PtrOperand because this returns the same copy


