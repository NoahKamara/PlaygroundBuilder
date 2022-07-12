//
//  File.swift
//  
//
//  Created by Noah Kamara on 11.07.22.
//

import Foundation

public class Module: AnyModule {
    var name: String
    var sources: Sources
    
    init(name: String, sources: Sources) {
        self.name = name.replacingOccurrences(of: " ", with: "_")
        self.sources = sources
    }
    
    public convenience init(_ name: String, @SourcesBuilder sources: () -> Sources) {
        self.init(name: name, sources: sources())
    }
    
    public convenience init(_ name: String) {
        self.init(name: name, sources: Sources())
    }
    
    public convenience init(_ name: String, at path: String) {
        let fm = FileManager.default
        guard let contents = fm.enumerator(at: URL(fileURLWithPath: path),
                                           includingPropertiesForKeys: nil,
                                           options: [.skipsHiddenFiles, .skipsPackageDescendants],
                                           errorHandler: nil
        ) else {
            fatalError("ERROR")
        }
        
        var sources = [Source]()
        if let enumerator = FileManager.default.enumerator(at: URL(fileURLWithPath: path),
                                                           includingPropertiesForKeys: [.isRegularFileKey],
                                                           options: [.skipsHiddenFiles, .skipsPackageDescendants]) {
            for case let fileURL as URL in enumerator {
                do {
                    let fileAttributes = try fileURL.resourceValues(forKeys:[.isRegularFileKey])
                    if fileAttributes.isRegularFile! {
                        sources.append(Source(at: fileURL.path))
                    }
                } catch { print(error, fileURL) }
            }
        }
        self.init(name: name, sources: sources)
    }
}
