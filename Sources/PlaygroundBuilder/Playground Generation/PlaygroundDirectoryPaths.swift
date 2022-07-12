//
//  File.swift
//  
//
//  Created by Noah Kamara on 11.07.22.
//

import Foundation

struct PlaygroundLocations {
    private let base: URL
    
    var all: [URL] {
        [
            base,
            contentsDir,
            chaptersDir,
            modulesDir
        ]
    }
    var contentsDir: URL { base.appendingPathComponent("Contents", isDirectory: true) }
    var chaptersDir: URL { contentsDir.appendingPathComponent("Chapters", isDirectory: true) }
    var modulesDir: URL { contentsDir.appendingPathComponent("UserModules", isDirectory: true) }
    
    var manifest: URL { contentsDir.appendingPathComponent("Manifest.plist", isDirectory: false) }
    
    
    func moduleSources(module: Module) -> URL {
        modulesDir
            .appendingPathComponent(module.name+".playgroundmodule", isDirectory: true)
            .appendingPathComponent("Sources", isDirectory: true)
    }
    
    func chapterDir(chapter: Chapter) -> URL {
        chaptersDir
            .appendingPathComponent(chapter.name+".playgroundchapter", isDirectory: true)
    }
    
    init(_ playbookPath: URL) {
        self.base = playbookPath
    }
}
