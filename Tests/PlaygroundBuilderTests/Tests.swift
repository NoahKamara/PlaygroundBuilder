//
//  File.swift
//  
//
//  Created by Noah Kamara on 10.07.22.
//

import XCTest
import PlaygroundBuilder

struct MyPlayground: Playground {
    var body: some Playground {
        Name("My Playground")
        
        Page("Page 1", sourcePath: "Page 1")
        
        LocalModule("LocalKit") {
            SourceFile("Source_01", content: .bySource(path: "Source_01"))
            SourceFile("Source_02", content: .bySource(path: "Source_02"))
            SourceFile("Source_03", content: .bySource(path: "Source_03"))
        }
        
        LocalModule("LocalKit") {
            SourceFile("Source_01", content: .bySource(path: "Source_01"))
            SourceFile("Source_02", content: .bySource(path: "Source_02"))
            SourceFile("Source_03", content: .bySource(path: "Source_03"))
        }
        //        Page("Page 1", sourcePath: "Page 1")
        //        Page("Page 2", sourcePath: "Page 2")
        //        Page("Page 3", sourcePath: "Page 3")
        //
        //        Module("Module_1") {
        //            SourceFile("Module_1_File_1", sourcePath: "Module_1_File_1")
        //            SourceFile("Module_1_File_2", sourcePath: "Module_1_File_1")
        //        }
        //        Module("Module_2") {
        //            SourceFile("Module_2_File_1", sourcePath: "Module_2_File_1")
        //            SourceFile("Module_2_File_2", sourcePath: "Module_2_File_1")
        //        }
    }
}

final class Tests: XCTestCase {
    let buildPath = "/Users/noahkamara/Developer/PlaygroundBuilder/Build"
    func testExample() throws {
        try MyPlayground().generate(at: buildPath)
    }
}
