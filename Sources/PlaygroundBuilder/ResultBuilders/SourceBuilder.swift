//
//  File.swift
//  
//
//  Created by Noah Kamara on 11.07.22.
//

import Foundation

extension Array: SourceCode where Element == String {
    public var source: String {
        self.joined(separator: "\n")
    }
}

@resultBuilder
public enum SourceContentBuilder {
    public static func buildBlock() -> [SourceCode] {
        return []
    }
    
    public static func buildBlock<Component: SourceCode>(_ component: Component) -> [String] {
        return [component.source]
    }

    public static func buildBlock(_ components: (any SourceCode)...) -> [String] {
        components
            .map(\.source)
    }

//    public static func buildBlock(_ components: (String)...) -> [String] {
//        components
//    }
}
