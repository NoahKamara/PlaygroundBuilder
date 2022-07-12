//
//  File.swift
//  
//
//  Created by Noah Kamara on 11.07.22.
//

import Foundation

extension Module: PlaygroundComponent {}
extension Chapter: PlaygroundComponent {}

@resultBuilder
public enum PlaygroundBuilder {
    public static func buildBlock() -> PlaygroundWrapper {
        return PlaygroundWrapper()
    }
    
    public static func buildBlock(_ components: (any PlaygroundComponent)...) -> PlaygroundWrapper {
        var wrapper = PlaygroundWrapper()
        
        components.forEach { component in
            if let module = component as? Module {
                wrapper.modules.append(module)
            }
            
            else if let chapter = component as? Chapter {
                wrapper.chapters.append(chapter)
            }
            
            else {
                fatalError("Did not recognize component \(component)")
            }
        }
        
        return wrapper
    }
}
