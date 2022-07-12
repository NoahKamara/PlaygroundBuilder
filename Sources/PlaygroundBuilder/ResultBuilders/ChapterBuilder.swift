//
//  File.swift
//  
//
//  Created by Noah Kamara on 11.07.22.
//

import Foundation

public typealias ChapterContent = (template: Template, pages: [Source])

@resultBuilder
public enum ChapterBuilder {
    public static func buildBlock(_ template: Template, _ pages: Source...) -> ChapterContent {
        return ChapterContent(template: template, pages: pages)
    }
    
    public static func buildBlock(_ pages: Source...) -> ChapterContent {
        return (template: .default, pages: pages)
    }
}
