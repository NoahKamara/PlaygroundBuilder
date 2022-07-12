//
//  File.swift
//  
//
//  Created by Noah Kamara on 11.07.22.
//

import Foundation

public enum SourceContentError: Error, CustomStringConvertible, CustomDebugStringConvertible {
    case fileNotFound(path: String)
    case stringDecodingFailed
    
    public var debugDescription: String { description }
    public var description: String {
        switch self {
            case .fileNotFound(let path):
                return "SourceContentError:FileNotFound: '\(path)'"
            case .stringDecodingFailed:
                return "SourceContentError:String Decoding Failed"
        }
    }
}

public struct SourceContent {
    public static func bySource(path: String) -> Self {
        return .init {
            return try String(contentsOfFile: path)
        }
    }
    
    public static func byString(string: String) -> Self {
        .init {
            return string
        }
    }
    
    public static func custom(content: @escaping (() async -> String)) -> Self {
        .init(content: content)
    }
    
    var content:(() async throws -> String)
    
    public func load() async throws -> String {
        try await content()
    }
    
    init(content: @escaping (() async throws -> String)) {
        self.content = content
    }
}
