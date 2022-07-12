//
//  File.swift
//  
//
//  Created by Noah Kamara on 12.07.22.
//

import Foundation

public struct Indented: SourceCode {
    let content: [String]
    var level: Int = 1
    
    public var source: String {
        let indentString = String(Array(repeating: "\t", count: level))
        return content.map { line in
            indentString+line
        }.joined(separator: "\n")
    }
    
    init<Content: SourceCode>(_ content: Content, level: Int = 1) {
        self.content = content.source.split(separator: "\n").map(String.init)
    }
    
    init(_ content: any SourceCode, level: Int = 1) {
        self.content = content.source.split(separator: "\n").map(String.init)
    }
}
