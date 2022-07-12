//
//  File.swift
//  
//
//  Created by Noah Kamara on 11.07.22.
//

import Foundation

public typealias Sources = [Source]

@resultBuilder
public enum SourcesBuilder {
    public static func buildBlock() -> Sources {
        return []
    }
    
    public static func buildBlock(_ sources: Source...) -> Sources {
        sources
    }
}
