//
//  main.swift
//  Vist
//
//  Created by Josef Willsher on 16/08/2015.
//  Copyright © 2015 vistlang. All rights reserved.
//
import class Foundation.NSTask

do {
    let flags = Array(Process.arguments.dropFirst())
    try compile(withFlags: flags, inDirectory: NSTask().currentDirectoryPath)
}
catch {
    print(error, terminator: "\n\n")
}
