//
//  File.swift
//  
//
//  Created by Noah Kamara on 11.07.22.
//

import PlaygroundBuilder

struct Playgrounds {
    static var minimum = EmptyPlayground()
}


extension Playgrounds {
    struct EmptyPlayground: Playground {
        var body: PlaygroundWrapper {
            Chapter("Chapter 01") {
                Source("Source 01")
            }
        }
    }
}
