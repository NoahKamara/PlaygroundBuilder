//
//  File.swift
//  
//
//  Created by Noah Kamara on 11.07.22.
//

import PlaygroundBuilder

struct Chapters {
    static var empty = Chapter("Empty Chapter")
    
    static var templateOnly = Chapter("Template Only Chapter") {
        Template()
    }
    
    static var pagesOnly = Chapter("Pages Only Chapter") {
        Source("Source 01")
    }
    
    static var templateAndPages = Chapter("Pages and Templates Chapter") {
        Template()
        Source("Source 01")
    }
}
