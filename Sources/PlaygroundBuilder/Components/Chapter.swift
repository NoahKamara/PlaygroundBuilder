//
//  File.swift
//  
//
//  Created by Noah Kamara on 11.07.22.
//

import Foundation

public struct Chapter {
    internal let name: String
    internal let template: Template
    internal let pages: [Source]
    
    init(name: String, template: Template, pages: [Source]) {
        self.name = name
        self.template = template
        self.pages = pages
    }
    
    public init(_ name: String, @ChapterBuilder content: () -> ChapterContent) {
        let content = content()
        self.init(name: name, template: content.template, pages: content.pages)
    }
    
    public init(_ name: String) {
        self.init(name: name, template: .default, pages: [])
    }
}

