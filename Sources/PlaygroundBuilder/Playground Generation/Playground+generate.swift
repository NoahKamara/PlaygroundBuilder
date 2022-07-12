//
//  File.swift
//  
//
//  Created by Noah Kamara on 11.07.22.
//

import Foundation

extension Playground {
    private func generateManifestPlist() -> PlaygroundManifest {
        let chapters = body.chapters.map({ $0.name + ".playgroundchapter" })
        let contentIdentifer = "com.noahkamara.\(UUID().uuidString.split(separator: "-").last!)"
        
        return PlaygroundManifest(
            chapters: chapters,
            contentIdentifier: contentIdentifer
        )
    }
    
    public func generate(at path: String) async throws {
        let outDirectory = URL(fileURLWithPath: path)
        
        // Generate Directory Structure
        let pgDirectory = outDirectory.appendingPathComponent(body.name+".playgroundbook")
        let paths = PlaygroundLocations(pgDirectory)
        
        let fileManager = FileManager.default
        
        /// Delete Existing
        if fileManager.fileExists(atPath: pgDirectory.path) {
            try fileManager.removeItem(at: pgDirectory)
        }
        
        print("CREATING PATHS")
        try paths.all.forEach { path in
            try fileManager.createDirectory(at: path, withIntermediateDirectories: true, attributes: nil)
        }
        
        //MARK: Manifest.plist
        // Generate
        let pgManifest = generateManifestPlist()
        
        // Encode
        let encoder = PropertyListEncoder()
        encoder.outputFormat = .xml
        let pgManifestData = try encoder.encode(pgManifest)
        
        // Write to file
        try pgManifestData.write(to: paths.manifest)
        
        
        // MARK: Create User Modules
        for module in body.modules {
            let moduleDir = paths.moduleSources(module: module)
            
            // Create Module/Sources Directories
            try fileManager.createDirectory(at: moduleDir, withIntermediateDirectories: true)
            
            // Create Sources
            for source in module.sources {
                let filePath = moduleDir
                    .appendingPathComponent(source.name+".swift")
                
                let content = try await source.content.load()
                
                try content.write(to: filePath,
                              atomically: true,
                              encoding: .utf8)
            }
        }
        
        // MARK: Create Chapters
        for chapter in body.chapters {
            let chapterDir = paths.chapterDir(chapter: chapter)
            
            // Create Chapter Directory
            try fileManager.createDirectory(at: chapterDir, withIntermediateDirectories: true)
            
            // Create Manifest.plist
            let chapterManifest = ChapterManifest(chapter: chapter)
            let data = try encoder.encode(chapterManifest)
            try data.write(to: chapterDir.appendingPathComponent("Manifest.plist"))
            
            // Create Pages Dir
            let pagesDir = chapterDir.appendingPathComponent("Pages")
            
            // Create Template & Pages
            var sources = [chapter.template.source]
            sources.append(contentsOf: chapter.pages)
            
            for source in sources {
                let pageDir = pagesDir.appendingPathComponent(source.name+".playgroundpage")
                let manifestPath = pageDir.appendingPathComponent("Manifest.plist")
                let filePath = pageDir.appendingPathComponent("main.swift")
                
                // Create Page Directory
                try fileManager.createDirectory(at: pageDir, withIntermediateDirectories: true)
                
                let manifest = PageManifest(page: source)
                let data = try encoder.encode(manifest)
                try data.write(to: manifestPath)
                
                let content = try await source.content.load()
                try content.write(to: filePath,
                                  atomically: true,
                                  encoding: .utf8)
            }
        }
    }
}
