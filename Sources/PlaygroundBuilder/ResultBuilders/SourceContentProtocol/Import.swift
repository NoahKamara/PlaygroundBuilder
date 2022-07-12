//
//  File.swift
//  
//
//  Created by Noah Kamara on 12.07.22.
//

import Foundation

public struct Import: SourceCode {
    public var source: String {
        return "import "+framework
    }
    
    var framework: String
    
    public init(_ framework: String) {
        self.framework = framework
    }
    
    public init(_ framework: PlaygroundsFramework) {
        self.framework = framework.rawValue
    }
}

public enum PlaygroundsFramework: String {
    case Foundation
    case PlaygroundBluetooth
    case PlaygroundSupport
}
