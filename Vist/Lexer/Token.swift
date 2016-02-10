//
//  Token.swift
//  Vist
//
//  Created by Josef Willsher on 17/08/2015.
//  Copyright © 2015 vistlang. All rights reserved.
//

typealias Pos = (Int, Int)

struct SourceRange {
    let start: Pos
    let end: Pos
    
    static func at(pos: Pos) -> SourceRange { return SourceRange(start: pos, end: pos) }
}

extension SourceRange : CustomStringConvertible {
    
    var description: String {
        if start == end {
            return "(l:\(start.0), c:\(start.1))"
        } else {
            return "from:(l:\(start.0), c:\(start.1)) to:(l:\(end.0), c:\(end.1))"
        }
    }
}

struct SourceLoc {
    let range: SourceRange
    let string: String
    
    static func zero() -> SourceLoc {
        return SourceLoc(range: SourceRange(start: (0,0), end: (0,0)), string: "")
    }
}

enum Token {
    case Let, Var, Func, Return, Void
    case EOF
    case If, Else, For, In, While, Do
    case Type, Reference, Init, Operator, Concept
    case Assign, SqbrOpen, SqbrClose, Comma, Period, Colon, Semicolon, OpenParen, CloseParen, Returns, Bar, OpenBrace, CloseBrace
    case InfixOperator(String), PrefixOperator(String), PostfixOperator(String)
    case Identifier(String), FloatingPoint(Double), Integer(Int), Boolean(Bool)
    case Char(Character), Comment(String), StringLiteral(String)
    case At
    case WhiteSpace
    
    var isValidParamToken: Bool {
        switch self {
        case .Identifier, .SqbrOpen, .OpenParen, OpenBrace, FloatingPoint, Integer, Boolean, Char, StringLiteral:
            return true
            
        default:
            return false
        }
    }
    var isCloseParen: Bool {
        if case .CloseParen = self { return true } else { return false }
    }
}

let operators: [String: Token] = [
    "=": .Assign,
    "[": .SqbrOpen,
    "]": .SqbrClose,
    ",": .Comma,
    ".": .Period,
    ":": .Colon,
    ";": .Semicolon,
    "(": .OpenParen,
    ")": .CloseParen,
    "->": .Returns,
    "|": .Bar,
    "}": .CloseBrace,
    "{": .OpenBrace,
    "@": .At
]

let stdlibOperators: [String] = ["<", ">", "<=", ">=", "/", "+", "-", "*", "%", "&&", "||", "...", "..<", "==", "!="]
