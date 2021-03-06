//
//  Print.swift
//  Vist
//
//  Created by Josef Willsher on 04/12/2015.
//  Copyright © 2015 vistlang. All rights reserved.
//


private let tab = "  "
func * (a: Int, b: String) -> String {
    var l = String()
    l.reserveCapacity(a*b.characters.count)
    var c = 0
    while c < a {
        l += b
        c += 1
    }
    return l
}

protocol ASTPrintable {
    
    func _astDescription(indentLevel n: Int) -> (isTrivial: Bool, description: String)

    static var _astName: String { get }
    var _astName_instance: String? { get }
}

extension ASTNode {
    
    func astDescription() -> String {
        return _astDescription(indentLevel: 0).description
    }
    
    func dump() {
        print(astDescription())
    }
}

extension ASTPrintable {
    
    func _astDescription(indentLevel n: Int) -> (isTrivial: Bool, description: String) {
        
        let children = Mirror(reflecting: self).children
        
        var f: [(String, (Bool, String))] = []
        f.reserveCapacity(Int(children.count))
        
        if case let decl as FuncDecl = self {
            // FIXME: Workaround for crashing runtime on reflection
            f.append(("name", decl.name._astDescription(indentLevel: n+1)))
            if let impl = decl.impl { f.append(("impl", impl._astDescription(indentLevel: n+1))) }
            f.append(("typeRepr", decl.typeRepr._astDescription(indentLevel: n+1)))
            f.append(("impl", decl.attrs._astDescription(indentLevel: n+1)))
            if let gen = decl.genericParameters { f.append(("genericParameters", gen._astDescription(indentLevel: n+1))) }
            if let mangled = decl.mangledName { f.append(("mangledName", mangled._astDescription(indentLevel: n+1))) }
        }
        else if case let decl as InitDecl = self {
            // FIXME: Workaround for crashing runtime on reflection
            f.append(("typeRepr", decl.typeRepr._astDescription(indentLevel: n+1)))
            if let impl = decl.impl { f.append(("impl", impl._astDescription(indentLevel: n+1))) }
            if let mangled = decl.mangledName { f.append(("mangledName", mangled._astDescription(indentLevel: n+1))) }
        }
        else if case let decl as DeinitDecl = self {
            // FIXME: Workaround for crashing runtime on reflection
            if let impl = decl.impl { f.append(("impl", impl._astDescription(indentLevel: n+1))) }
            if let mangled = decl.mangledName { f.append(("mangledName", mangled._astDescription(indentLevel: n+1))) }
        }
        else if case let decl as VariableGroupDecl = self {
            // FIXME: Workaround for crashing runtime on reflection
            f.append(("declared", decl.declared._astDescription(indentLevel: n+1)))
        }
        else {
            for (label, value) in children {
                if case let v as ASTPrintable = value, let l = label, label != "parent"  {
                    f.append((l, v._astDescription(indentLevel: n+1)))
                }
            }
        }
        
        var isTrivial = true
        let s = f.map { child -> (name: String, valueString: String) in
            let x = child.1
            if !x.0 {
                isTrivial = false
            }
            return (name: child.0, valueString: x.1)
        }
        
        if isTrivial {
            if let instance = _astName_instance {
                return (true, instance)
            }
            let a = s.map { "\($0.name)=\($0.valueString)" }
            return (a.count < 4, "(" + Self._astName + " " + a.joined(separator: " ") + ")")
        }
        return (false, "(" + Self._astName + s.map { "\n\(n*tab)(\($0.name) \($0.valueString))" }.joined(separator: ""))
    }
    
    var _astName_instance: String? { return nil }
}


extension Array : ASTPrintable {
    
    func _astDescription(indentLevel n: Int) -> (isTrivial: Bool, description: String) {
        
        let des = flatMap { $0 as? ASTPrintable }
            .map { $0._astDescription(indentLevel: n+2)}
        let str = des.map { "\n\((n+1)*tab)" + $0.description }
        let trivial = !des.contains { !$0.isTrivial }
        
        return (trivial, str.joined(separator: ""))
    }
    
    static var _astName: String {
        let t = Element.self as? ASTPrintable.Type
        return "[\(t?._astName ?? "")]"
    }
    
}

extension AST : ASTPrintable {
    static var _astName: String { return "AST" }
}
extension ConceptDecl : ASTPrintable {
    static var _astName: String { return "concept_decl" }
}
extension TypeDecl : ASTPrintable {
    static var _astName: String { return "struct_decl" }
}
extension FuncDecl : ASTPrintable {
    static var _astName: String { return "func_decl" }
}
extension VariableGroupDecl : ASTPrintable {
    static var _astName: String { return "variable_decl_group" }
}
extension InitDecl : ASTPrintable {
    static var _astName: String { return "initialiser_decl" }
}
extension DeinitDecl : ASTPrintable {
    static var _astName: String { return "deinitialiser_decl" }
}
extension TypeRepr : ASTPrintable {
    static var _astName: String { return "type_repr" }
    var _astName_instance: String? {
        switch self {
        case .function(let fn): return fn._astName_instance
        case .void: return "()"
        case .tuple(let tys): return "(" + tys.map { $0._astName_instance ?? "" }.joined(separator: ", ") + ")"
        case .type(let str): return "\(str)"
        }
    }
    func _astDescription(indentLevel n: Int) -> (isTrivial: Bool, description: String) {
        return (true, "'\(_astName_instance ?? "")'")
    }
}
extension FunctionTypeRepr : ASTPrintable {
    static var _astName: String { return "function_type_repr" }
    var _astName_instance: String? {
        return "\(paramType._astName_instance ?? "") -> \(returnType._astName_instance ?? "")"
    }
    func _astDescription(indentLevel n: Int) -> (isTrivial: Bool, description: String) {
        return (true, "'\(_astName_instance ?? "")'")
    }
}
extension FunctionBodyExpr : ASTPrintable {
    static var _astName: String { return "func_impl_expr" }
}
extension FunctionCallExpr : ASTPrintable {
    static var _astName: String { return "func_call_expr" }
}
extension VariableDecl : ASTPrintable {
    static var _astName: String { return "variable_decl" }
}
extension IntegerLiteral : ASTPrintable {
    static var _astName: String { return "int_literal" }
}
extension BooleanLiteral : ASTPrintable {
    static var _astName: String { return "bool_literal" }
}
extension StringLiteral : ASTPrintable {
    static var _astName: String { return "string_literal" }
}
extension FloatingPointLiteral : ASTPrintable {
    static var _astName: String { return "float_literal" }
}
extension SelfExpr : ASTPrintable {
    static var _astName: String { return "self_expr" }
}
extension Int : ASTPrintable {
    var _astName_instance: String? { return "\(self)" }
    static var _astName: String { return " " }
}
extension UInt32 : ASTPrintable {
    var _astName_instance: String? { return "\(self)" }
    static var _astName: String { return " " }
}
extension Bool : ASTPrintable {
    var _astName_instance: String? { return "\(self)" }
    static var _astName: String { return " " }
}
extension String : ASTPrintable {
    var _astName_instance: String? { return "\"\(self)\"" }
    static var _astName: String { return " " }
}
extension Float : ASTPrintable {
    var _astName_instance: String? { return "\(self)" }
    static var _astName: String { return " " }
}
extension VoidExpr : ASTPrintable {
    static var _astName: String { return "void_expr" }
}
extension BinaryExpr : ASTPrintable {
    static var _astName: String { return "binary_operator_expr" }
}
extension PrefixExpr : ASTPrintable {
    static var _astName: String { return "prefix_operator_expr" }
}
extension PostfixExpr : ASTPrintable {
    static var _astName: String { return "postfix_operator_expr" }
}
extension BlockExpr : ASTPrintable {
    static var _astName: String { return "block_expr" }
}
extension ConditionalStmt : ASTPrintable {
    static var _astName: String { return "if_stmt" }
}
extension ElseIfBlockStmt : ASTPrintable {
    static var _astName: String { return "if_clause_stmt" }
}
extension VariableExpr : ASTPrintable {
    static var _astName: String { return "variable_expr" }
}
extension TupleExpr : ASTPrintable {
    static var _astName: String { return "tuple_expr" }
}
extension MutationExpr : ASTPrintable {
    static var _astName: String { return "mutation_expr" }
}
extension PropertyLookupExpr : ASTPrintable {
    static var _astName: String { return "property_lookup_expr" }
}
extension TupleMemberLookupExpr : ASTPrintable {
    static var _astName: String { return "tuple_member_lookup_expr" }
}
extension ArrayExpr : ASTPrintable {
    static var _astName: String { return "array_expr" }
}
extension ArraySubscriptExpr : ASTPrintable {
    static var _astName: String { return "array_subscript_expr" }
}
extension MethodCallExpr : ASTPrintable {
    static var _astName: String { return "method_call_expr" }
}
extension CommentExpr : ASTPrintable {
    static var _astName: String { return "comment_expr" }
}
extension ForInLoopStmt : ASTPrintable {
    static var _astName: String { return "for_in_loop_stmt" }
}
extension WhileLoopStmt : ASTPrintable {
    static var _astName: String { return "while_loop_stmt" }
}
extension ReturnStmt : ASTPrintable {
    static var _astName: String { return "return_stmt" }
}
extension YieldStmt : ASTPrintable {
    static var _astName: String { return "yield_stmt" }
}
extension ClosureExpr : ASTPrintable {
    static var _astName: String { return "closure_expr" }
}
extension CoercionExpr : ASTPrintable {
    static var _astName: String { return "coercion_expr" }
}
extension ImplicitCoercionExpr : ASTPrintable {
    static var _astName: String { return "implicit_coercion_expr" }
}
extension TypeMatchPattern : ASTPrintable {
    static var _astName: String { return "type_match_pattern" }
}
extension ConditionalPattern : ASTPrintable {
    static var _astName: String { return "condition_pattern" }
}
extension Optional : ASTPrintable {
    func _astDescription(indentLevel n: Int) -> (isTrivial: Bool, description: String) {
        guard case let val as ASTPrintable = self else { return (true, "nil") }
        return val._astDescription(indentLevel: n)
    }
    static var _astName: String { return "" }
}

extension Type {
    var _astName_instance: String? { return prettyName }
    static var _astName: String { return "type" }
    
    func _astDescription(indentLevel n: Int) -> (isTrivial: Bool, description: String) {
        return (true, prettyName)
    }
}


