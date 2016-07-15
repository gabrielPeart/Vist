//
//  Inliner.swift
//  Vist
//
//  Created by Josef Willsher on 20/06/2016.
//  Copyright © 2016 vistlang. All rights reserved.
//

/// Inline pass inlines single block functions
enum InlinePass : OptimisationPass {
    
    typealias PassTarget = Module
    static let minOptLevel: OptLevel = .low
    
    /// Inline functions in `module`
    /// - note: entrypoint for the inline pass
    static func run(on module: Module) throws {
        try module.functions.forEach(run(on:))
    }
    
    /// Run the inline opt on `function`
    private static func run(on function: Function) throws {
        // if we have already inlined this function, don't attempt to do it again
        //  - this prevents cyclic inlining & unnecessary work for scanning an
        //    already optimised block
        guard !function.hasHadInline else { return }
        // Mark as inlined
        function.hasHadInline = true
        
        for inst in function.instructions {
            switch inst {
                // If the inst is a call...
            case let call as FunctionCallInst:
                // ...inline the called function's body first...
                try run(on: call.function)
                // ...then inline this call.
                var explosion = Explosion(replacing: call)
                if try inline(call, explosion: &explosion) {
                    // If it was inlined, replace the inst with the explosion
                    try explosion.replaceInst()
                }
                
            case _ as FunctionApplyInst:
                break // TODO: Implement for function applys too (need this for existential container opts
                      //       who's method dispatch is through ApplyInsts)
                      //       --> Get the fn pointer then inline with inline(_:explosion:)
            default:
                break // the inst isn't a call or apply
            }
        }
        
    }
    
    /// - returns: whether the call was inlined
    static func inline(_ call: FunctionCallInst, explosion: inout Explosion<FunctionCallInst>) throws -> Bool {
        
        // Can we inline this call?
        // FIXME: Inlining multi block functions. (May need a dom tree analysis pass to do this)
        guard call.function.isInlineable && call.function.shouldInline(at: .high) else {
            return false
        }
        
        let block = call.function.blocks![0]
        var alreadyInlined: [String: Value] = [:]
        
        // Add params
        for (arg, param) in zip(call.args, block.parameters ?? []) {
            alreadyInlined[param.name] = arg.value!
        }
        
        /// Get the inlined value to replace the original inst's operand
        func getValue(replacing val: Operand) -> Value {
            return alreadyInlined[val.name] // get the operand from the list of inlined vals
                ?? val.value!.copy() // if its not in the block (it's a literal and) we can copy it as is
        }
        
        // Forward pass through block insts
        // FIXME: Should be through dominator tree in a multi block
        for sourceInst in block.instructions {
            
            // Create a copy of the instruction
            let inlinedInst = sourceInst.copy()
            // ...and record it by name
            alreadyInlined[sourceInst.name] = inlinedInst
            
            switch inlinedInst {
                // return insts simply want passing out as the tail of the inlined vals.
                // Its users are fixed at the end of the explosion's inlining
            case let returnInst as ReturnInst:
                let inlinedInst = getValue(replacing: returnInst.returnValue)
                explosion.insertTail(inlinedInst)
                break // return must be last inst in block
                
            default:
                // fix-up the user of the inst's args
                inlinedInst.setInstArgs(args: inlinedInst.args.map { arg in
                    let operand = arg.formCopy(nullValue: true)
                    let v = getValue(replacing: arg)
                    arg.value = nil
                    arg.user = nil
                    operand.value = v
                    operand.user = inlinedInst
                    return operand
                })
                // Modify name of inlined var (just to make it more descriptive)
                // "%var" --> "%demangled.var"
                if let n = inlinedInst.irName {
                    inlinedInst.irName = "\(call.function.name.demangleName()).\(n)"
                }
                
                // Add the inst
                explosion.insert(inst: inlinedInst)
            }
        }
        
        return true
    }
}

private extension Function {
    
    /// Can we inline this function?
    var isInlineable: Bool {
        return blocks.map { $0.count <= 1 } ?? false
    }
    
    // TODO: Determine whether this function is favourable to inline
    /// Do we want to inline this function at `optLevel`
    func shouldInline(at optLevel: OptLevel) -> Bool {
        return true
    }
}

