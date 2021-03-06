//
//  Optimiser.swift
//  Vist
//
//  Created by Josef Willsher on 12/03/2016.
//  Copyright © 2016 vistlang. All rights reserved.
//

enum OptLevel : Int {
    case off, low, high
}

struct PassManager {
    let module: Module, optLevel: OptLevel, opts: CompileOptions
    
    func runPasses() throws {
        
        // inline functions
        try create(pass: StdLibInlinePass.self, runOn: module)
        if !opts.contains(.disableInline) {
            try create(pass: InlinePass.self, runOn: module)
        }
        
        // run post inline opts
        for function in module.functions where function.hasBody {
            try create(pass: DCEPass.self, runOn: function)
            try create(pass: CopyElisionPass.self, runOn: function)
            try create(pass: RegisterPromotionPass.self, runOn: function)
            try create(pass: ExistentialUnboxPass.self, runOn: function)
            try create(pass: AggrFlattenPass.self, runOn: function)
            try create(pass: ConstantFoldingPass.self, runOn: function)
            try create(pass: StrengthReductionPass.self, runOn: function)
            try create(pass: CFGFoldPass.self, runOn: function)
            try create(pass: DCEPass.self, runOn: function)
            try create(pass: ARCSimplifyPass.self, runOn: function)
            try create(pass: RegisterPromotionPass.self, runOn: function)
        }
        
    }
}

protocol OptimisationPass {
    /// What the pass is run on, normally function or module
    associatedtype PassTarget
    /// The minimum opt level this pass will be run
    static var minOptLevel: OptLevel { get }
    /// Runs the pass
    static func run(on: PassTarget) throws
    /// The pass's name presented to the command line
    static var name: String { get }
}

extension PassManager {
    func create<PassType : OptimisationPass>(pass: PassType.Type, runOn target: PassType.PassTarget) throws {
        guard optLevel.rawValue >= pass.minOptLevel.rawValue else { return }
        return try PassType.run(on: target)
    }
}

/// An opt pass statistic type
enum OptStatistics {
    func description() -> String {
        return ""
    }
}


// MARK: Utils

extension CompileOptions {
    func optLevel() -> OptLevel {
        if contains(.Ohigh) { return .high }
        else if contains(.O) { return .low }
        else { return .off }
    }
}
extension Function {
    var instructions: LazyCollection<[Inst]> { return blocks.map { $0.flatMap { $0.instructions }.lazy } ?? [Inst]().lazy }
}


enum OptError : VistError {
    case invalidValue(Value)
    
    var description: String {
        switch self {
        case .invalidValue(let inst): return "Invalid value '\(inst.valueName)'"
        }
    }
}

