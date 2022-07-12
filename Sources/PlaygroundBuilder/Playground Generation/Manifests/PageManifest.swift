//
//  File.swift
//  
//
//  Created by Noah Kamara on 11.07.22.
//

import Foundation

struct PageManifest: Encodable {
    var name: String
    var liveViewEdgeToEdge: Bool = false
    var liveViewMode: LiveViewMode = .hiddenByDefault
    
    enum CodingKeys: String, CodingKey {
        case name = "Name"
        case liveViewEdgeToEdge = "LiveViewEdgeToEdge"
        case liveViewMode = "LiveViewMode"
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(liveViewEdgeToEdge, forKey: .liveViewEdgeToEdge)
        try container.encode(liveViewMode, forKey: .liveViewMode)
    }
    
    init(name: String, liveViewEdgeToEdge: Bool, liveViewMode: LiveViewMode) {
        self.name = name
        self.liveViewEdgeToEdge = liveViewEdgeToEdge
        self.liveViewMode = liveViewMode
    }
    
    init(page: Source) {
        self.init(name: page.name, liveViewEdgeToEdge: false, liveViewMode: .hiddenByDefault)
    }
}

enum LiveViewMode: String, Encodable {
    case hiddenByDefault = "HiddenByDefault"
}
