//
//  File.swift
//  
//
//  Created by Noah Kamara on 11.07.22.
//

import PlaygroundBuilder

struct Sources {
    static let empty = Source("Empty Source") {}
    
    static let complete = Source("Complete Source") {
        Comment("This is a Comment")
        Comment {
            "This is a multiline comment"
            "2"
            "3"
        }
    }
    
    static let completeLines = [
        "// This is a Comment",
        "// This is a multiline comment",
        "// 2",
        "// 3",
    ]
}
