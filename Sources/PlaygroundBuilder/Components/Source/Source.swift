//
//  File.swift
//  
//
//  Created by Noah Kamara on 11.07.22.
//

import Foundation

public struct Source {
    var name: String
    var content: SourceContent
    
    public init(name: String, content: SourceContent) {
        self.name = name
        self.content = content
    }
    
    public init(_ name: String? = nil, at path: String) {
        let fileName = URL(fileURLWithPath: path).lastPathComponent
        let altName = String(fileName.prefix(while: { $0 != "." }))
        
        self.init(name: name ?? altName, content: .bySource(path: path))
    }
    
    public init(_ name: String, content: String) {
        self.init(name: name, content: .byString(string: content))
    }
    
    public init(_ name: String, @SourceContentBuilder content: () -> [any SourceCode]) {
        let string = content().map(\.source).joined(separator: "\n")
        self.init(name: name, content: .byString(string: string))
    }
    
    public init(_ name: String) {
        self.init(name: name, content: .byString(string: ""))
    }
}
