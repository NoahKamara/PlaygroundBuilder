//
//  File.swift
//  
//
//  Created by Noah Kamara on 12.07.22.
//

import Foundation

public struct ForEach<Data: Sequence, Content> {
    let data: Data
    let content: (Data.Element) -> Content
    
    init(_ data: Data, content: @escaping (Data.Element) -> Content) {
        self.data = data
        self.content = content
    }
}
extension ForEach: SourceCode where Content: SourceCode {
    public var source: String {
        data.map { element in
            content(element).source
        }.joined(separator: "\n")
    }
}
