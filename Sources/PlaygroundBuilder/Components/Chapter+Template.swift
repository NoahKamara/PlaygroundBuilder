//
//  File.swift
//  
//
//  Created by Noah Kamara on 11.07.22.
//

import Foundation

public struct Template {
    static let `default`: Self = .init()
    
    var content: SourceContent
    var source: Source { .init(name: "Template", content: content)}
    
    public init(content: SourceContent) {
        self.content = content
    }
    
    public init() {
        self.init(content: "")
    }
    
    public init(at path: String) {
        self.init(content: .bySource(path: path))
    }
    
    public init(content: String) {
        self.init(content: .byString(string: content))
    }
    
    public init(@SourceContentBuilder content: () -> [any SourceCode]) {
        let string = content().map(\.source).joined(separator: "\n")
        self.init(content: .byString(string: string))
    }
}
