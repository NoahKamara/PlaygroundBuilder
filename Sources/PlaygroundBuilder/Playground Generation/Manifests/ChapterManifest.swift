//
//  File.swift
//  
//
//  Created by Noah Kamara on 11.07.22.
//

import Foundation

struct ChapterManifest: Encodable {
    var name: String
    var templatePageFilename: String
    var initialUserPages: [String]
    
    enum CodingKeys: String, CodingKey {
        case name = "Name"
        case templatePageFilename = "TemplatePageFilename"
        case initialUserPages = "InitialUserPages"
    }
    
    init(name: String, templatePageFilename: String, initialUserPages: [String]) {
        self.name = name
        self.templatePageFilename = templatePageFilename
        self.initialUserPages = initialUserPages
    }
    
    init(chapter: Chapter) {
        self.init(name: chapter.name,
                  templatePageFilename: "Template.playgroundpage",
                  initialUserPages: chapter.pages.map({ $0.name+".playgroundpage" }))
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(templatePageFilename, forKey: .templatePageFilename)
        try container.encode(initialUserPages, forKey: .initialUserPages)
    }
}
