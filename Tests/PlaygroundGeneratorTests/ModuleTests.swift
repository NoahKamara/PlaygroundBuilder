//
//  File.swift
//
//
//  Created by Noah Kamara on 11.07.22.
//

import XCTest
@testable import PlaygroundBuilder

final class ModuleTests: XCTestCase {
    func testEmptyModule() {
        let module = Modules.empty
        
        XCTAssertEqual(module.name, "Empty_Module", "Title set correctly")
        XCTAssertEqual(module.sources.count, 0, "Sources set correctly")
    }
    
    func testSourceFileModule() {
        let module = Modules.sourceFiles
        
        XCTAssertEqual(module.name, "Source_Files_Module", "Title set correctly")
        XCTAssertEqual(module.sources.first!.name, "Source 01", "Sources set correctly")
    }
}
