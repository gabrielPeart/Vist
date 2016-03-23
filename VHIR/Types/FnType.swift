//
//  FnType.swift
//  Vist
//
//  Created by Josef Willsher on 17/01/2016.
//  Copyright © 2016 vistlang. All rights reserved.
//

enum CallingConvention {
    case thin
    case method(selfType: Ty)
    //case thick(contextPtr: )
    
    var name: String {
        switch self {
        case .thin: return "thin"
        case .method: return "method"
        }
    }
    func usingTypesIn(module: Module) -> CallingConvention {
        switch self {
        case .thin: return self
        case .method(let selfType): return .method(selfType: selfType.usingTypesIn(module))
        }
    }
}


struct FnType: Ty {
    let params: [Ty], returns: Ty
    var metadata: [String]
    let callingConvention: CallingConvention
    
    init(params: [Ty], returns: Ty = BuiltinType.void, metadata: [String] = [], callingConvention: CallingConvention = .thin) {
        self.params = params
        self.returns = returns
        self.metadata = metadata
        self.callingConvention = callingConvention
    }
    func lowerType(module: Module) -> LLVMTypeRef {
        
        let ret: LLVMTypeRef
        if case _ as FnType = returns {
            ret = BuiltinType.pointer(to: returns).lowerType(module)
        }
        else {
            ret = returns.lowerType(module)
        }
        
        var members = nonVoid.map {$0.lowerType(module)}
        
        let els = members.ptr()
        defer { els.destroy(members.count) }
        
        return LLVMFunctionType(ret, els, UInt32(members.count), false)
    }
    
    /// Replaces the function's memeber types with the module's typealias
    func usingTypesIn(module: Module) -> Ty {
        let params = self.params.map { $0.usingTypesIn(module) }
        let returns = self.returns.usingTypesIn(module)
        let convention = self.callingConvention.usingTypesIn(module)
        return FnType(params: params, returns: returns, metadata: metadata, callingConvention: convention)
    }
    
    func lowerType(module: LLVMTypeRef) -> LLVMTypeRef {
        
        let ret: LLVMTypeRef
        if case _ as FnType = returns {
            ret = BuiltinType.pointer(to: returns).lowerType(module)
        }
        else {
            ret = returns.lowerType(module)
        }
        
        var members: [LLVMValueRef] = []
        
        if case .method(let ty) = callingConvention {
            members.append(BuiltinType.pointer(to: ty).lowerType(module))
        }
        
        members += nonVoid.map {$0.lowerType(module)}
        
        let els = members.ptr()
        defer { els.destroy(members.count) }
        
        return LLVMFunctionType(ret, els, UInt32(members.count), false)
    }
    
    /// The type used by the IR -- it uses info from the calling convention
    /// to construct the type which should be used in IR
    var vhirType: FnType {
        switch  callingConvention {
        case .thin:
            return self
        case .method(let selfType):
            let selfPtr = BuiltinType.pointer(to: selfType)
            return FnType(params: [selfPtr] + params,
                          returns: returns,
                          metadata: metadata,
                          callingConvention: .method(selfType: selfType))
        }
    }
    
    static func taking(params: Ty..., ret: Ty = BuiltinType.void) -> FnType {
        return FnType(params: params, returns: ret)
    }
    static func returning(ret: Ty) -> FnType {
        return FnType(params: [], returns: ret)
    }
    
    var nonVoid: [Ty]  {
        return params.filter { if case BuiltinType.void = $0 { return false } else { return true } }
    }
    
    func addMetadataTo(call: LLVMValueRef) {
        
        for metadata in self.metadata {
            
            let attrLength = UInt32(metadata.characters.count)
            let mdString = LLVMMDString(metadata, attrLength)
            
            let attrs = [mdString].ptr()
            defer { attrs.destroy(1) }
            let mdNode = LLVMMDNode(attrs, 1)
            
            let kindID = LLVMGetMDKindID(metadata, attrLength)
            
            LLVMSetMetadata(call, kindID, mdNode)
        }
    }
    
    var mangledName: String {
        return params
            .map { $0.mangledName }
            .joinWithSeparator("_")
    }
    
    /// Returns a version of this type, but with a defined parent
    func withParent(parent: StorageType) -> FnType {
        return FnType(params: params, returns: returns, metadata: metadata, callingConvention: .method(selfType: parent))
    }
    /// Returns a version of this type, but with a parent of type i8 (so ptrs to it are i8*)
    func withOpaqueParent() -> FnType {
        return FnType(params: params, returns: returns, metadata: metadata, callingConvention: .method(selfType: BuiltinType.int(size: 8)))
    }
}





