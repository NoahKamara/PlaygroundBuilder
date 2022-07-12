//
//  File.swift
//
//
//  Created by Noah Kamara on 11.07.22.
//

import XCTest
@testable import PlaygroundBuilder

struct MyPlayground: Playground {
    
    @SourceContentBuilder
    var sourceHeader: SourceCode {
        Comment("This is a Sourcefile")
        EmptyLine(lines: 1)
    }
    
    var body: PlaygroundWrapper {
        Chapter("Chapter 1") {
            Template {
                sourceHeader
                Import("PlaygroundBuilder")
                EmptyLine()
                Scope("struct MyPlayground: Playground") {
                    Scope("var body: PlaygroundWrapper")
                }
                
                EmptyLine(lines: 2)
                
                Import(.PlaygroundSupport)
                
                Scope("Task") {
                    "try await MyPlayground().generate(at: \"\")"
                    "print(\"done\")"
                    "PlaygroundPage.current.finishExecution()"
                }
                
                "PlaygroundPage.current.needsIndefiniteExecution = true"
            }
            Source("Page 1") {
                sourceHeader
                Import("PlaygroundBuilder")
                EmptyLine()
                Scope("struct MyPlayground: Playground") {
                    Scope("var body: PlaygroundWrapper") {
                        Scope("Chapter(\"Chapter 1\")") {
                            Scope("Template") {
                                "Comment(\"This is a Template\")"
                            }
                            Scope("Source(\"Page 1\")") {
                                "Comment(\"This is Page 1\")"
                            }
                        }
                        Scope("Module(\"Module 1\")") {
                            Scope("Source(\"Main\")") {
                                "Comment(\"This is the Main.swift file of Module 1\")"
                            }
                            
                            Scope("Source(\"Source_01\")") {
                                "Comment(\"This is the Main.swift file of Module 1\")"
                                "let value: String = \"Source 01\""
                            }
                        }
                    }
                }
                
                EmptyLine(lines: 2)
                
                Import(.PlaygroundSupport)
                
                Scope("Task") {
                    "try await MyPlayground().generate(at: \"\")"
                    "print(\"done\")"
                    "PlaygroundPage.current.finishExecution()"
                }
                
                "PlaygroundPage.current.needsIndefiniteExecution = true"
            }
        }
        
        Module("PlaygroundBuilder", at: "/Users/noahkamara/Downloads/PlaygroundBuilder")
    }
}

final class GenerationTests: XCTestCase {
//    func testGeneration() async throws {
//        try await MyPlayground().generate(at: "/Users/noahkamara/Developer/PlaygroundBuilder/Build")
//    }
    
    func testGenerationSync() async throws {
        try await MyPlayground().generate(at: "/Users/noahkamara/Developer/PlaygroundBuilder/Build")
    }
}
