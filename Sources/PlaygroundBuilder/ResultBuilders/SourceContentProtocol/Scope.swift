//
//  File.swift
//  
//
//  Created by Noah Kamara on 12.07.22.
//

import Foundation

public struct Scope: SourceCode {
    let definition: String
    let content: [any SourceCode]
    
    @SourceContentBuilder
    var sourceContent: some SourceCode {
        definition+" {"
        ForEach(content) { item in
            Indented(item)
        }
        "}"
    }
    
    public var source: String {
        sourceContent.source
    }
    
    init(definition: String, content: [String]) {
        self.definition = definition
        self.content = content
    }
    
    public init(_ definition: String, @SourceContentBuilder contents: () -> [String]) {
        self.init(definition: definition, content: contents())
    }
    
    public init(_ definition: String) {
        self.init(definition: definition, content: [])
    }
}
