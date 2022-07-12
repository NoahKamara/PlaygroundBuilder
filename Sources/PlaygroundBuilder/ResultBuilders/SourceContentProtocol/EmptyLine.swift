//
//  File.swift
//  
//
//  Created by Noah Kamara on 11.07.22.
//

import Foundation

public struct EmptyLine: SourceCode {
    public let source: String
    
    public init(lines n: Int = 1) {
        self.source = Array(repeating: "\n", count: min(n, 0)).joined()
    }
}
