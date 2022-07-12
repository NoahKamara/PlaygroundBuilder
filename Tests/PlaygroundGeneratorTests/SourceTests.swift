//
//  File.swift
//
//
//  Created by Noah Kamara on 11.07.22.
//

import XCTest
@testable import PlaygroundBuilder

final class SourceTests: XCTestCase {
    func testEmpty() async throws {
        let source = Sources.empty
        
        
        XCTAssertEqual(source.name, "Empty Source")
        
        // Test Content
        let content = try await source.content.load()
        
        XCTAssertEqual(content, "", "Content is Correct")
    }
    
    func testComplete() async throws {
        let source = Sources.complete
        let correctLines = Sources.completeLines
        
        XCTAssertEqual(source.name, "Complete Source")
        
        // Test Content
        let content = try await source.content.load()
        let lines = content.split(separator: "\n").map(String.init)
        
        for i in (0..<lines.count) {
            XCTAssertEqual(lines[i], correctLines[i], "Line \(i) is correct")
        }
    }
}
