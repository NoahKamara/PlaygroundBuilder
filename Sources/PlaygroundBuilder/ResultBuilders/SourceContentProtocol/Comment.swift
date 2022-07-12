//
//  File.swift
//  
//
//  Created by Noah Kamara on 11.07.22.
//

import Foundation

public struct Comment: SourceCode {
    public var source: String {
        return "// "+content.joined(separator: "\n// ")
    }
    
    var content: [String] = []
    
    public init(_ content: String) {
        self.content = content.split(separator: "\n").map(String.init)
    }
    
    public init(_ content: [String]) {
        self.content = content
    }
    
    public init(@StringSourceBuilder contents: () -> String) {
        self.init(contents())
    }
}

@resultBuilder
public enum StringSourceBuilder {
    public static func buildBlock(_ components: String...) -> String {
        components.joined(separator: "\n")
    }
}
