//
//  File.swift
//  
//
//  Created by Noah Kamara on 11.07.22.
//

import Foundation

enum SourceContentVariable: String {
    var variableValue: String { "#\(rawValue.uppercased())#" }

    case filepath
    case filename
}


struct SourceContentEnvironment {
    var filePath: URL
    var fileName: String { filePath.lastPathComponent }
    
    func value(for variable: SourceContentVariable) -> String {
        switch variable {
            case .filepath:
                return filePath.absoluteString
            case .filename:
                return fileName
        }
    }
}
