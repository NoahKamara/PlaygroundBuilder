//
//  File.swift
//  
//
//  Created by Noah Kamara on 11.07.22.
//

import Foundation

public protocol Playground {
    @PlaygroundBuilder var body: PlaygroundWrapper { get }
}

public protocol PlaygroundComponent {}

public struct PlaygroundWrapper {
    var name: String = "My Playground"
    var chapters: [Chapter] = []
    var modules: [Module] = []
}


