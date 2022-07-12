//
//  File.swift
//  
//
//  Created by Noah Kamara on 11.07.22.
//

import XCTest
@testable import PlaygroundBuilder

final class ChapterTests: XCTestCase {
    func testEmptyChapter() {
        let chapter = Chapters.empty
        
        XCTAssertEqual(chapter.name, "Empty Chapter", "Title set correctly")
        XCTAssertTrue(chapter.pages.isEmpty, "Pages set correctly")
    }
    
    func testTemplateOnlyChapter() {
        let chapter = Chapters.templateOnly
        
        XCTAssertEqual(chapter.name, "Template Only Chapter", "Title set correctly")
        XCTAssertTrue(chapter.pages.isEmpty, "Pages set correctly")
    }
    
    func testPagesOnlyChapter() {
        let chapter = Chapters.pagesOnly
        
        XCTAssertEqual(chapter.name, "Pages Only Chapter", "Title set correctly")
        XCTAssertEqual(chapter.pages.first?.name, "Source 01", "Pages set correctly")
    }
    
    func testTemplatesAndPagesChapter() {
        let chapter = Chapters.templateAndPages
        
        XCTAssertEqual(chapter.name, "Pages and Templates Chapter", "Title set correctly")
        XCTAssertEqual(chapter.pages.first?.name, "Source 01", "Pages set correctly")
    }
}
