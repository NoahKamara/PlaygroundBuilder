//
//  File.swift
//  
//
//  Created by Noah Kamara on 11.07.22.
//

import PlaygroundBuilder

struct Modules {
    static var empty = Module("Empty Module")
    
    static var sourceFiles = Module("Source Files Module") {
        Source("Source 01")
    }
}
