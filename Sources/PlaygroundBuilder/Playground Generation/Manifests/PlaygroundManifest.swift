//
//  File.swift
//
//
//  Created by Noah Kamara on 11.07.22.
//

import Foundation

struct PlaygroundManifest {
    let chapters: [String]
    let contentIdentifier: String
    let contentVersion: String
    let deploymentTarget: String
    let developmentRegion: String
    let hasMeaningfulResetPoint: Bool
    let swiftVersion: String
    let userAutoImportedAuxiliaryModules: [String]
    let userModuleMode: String
    let version: String
    
    init(chapters: [String],
         contentIdentifier: String,
         contentVersion: String = "1.0",
         deploymentTarget: String = "ios-current",
         developmentRegion: String = "en",
         hasMeaningfulResetPoint: Bool = true,
         swiftVersion: String = "5.6",
         userAutoImportedAuxiliaryModules: [String] = [],
         userModuleMode: String = "Full",
         version: String = "8.0"
    ) {
        self.chapters = chapters
        self.contentIdentifier = contentIdentifier
        self.contentVersion = contentVersion
        self.deploymentTarget = deploymentTarget
        self.developmentRegion = developmentRegion
        self.hasMeaningfulResetPoint = hasMeaningfulResetPoint
        self.swiftVersion = swiftVersion
        self.userAutoImportedAuxiliaryModules = userAutoImportedAuxiliaryModules
        self.userModuleMode = userModuleMode
        self.version = version
    }
}

extension PlaygroundManifest: Encodable {
    enum CodingKeys: String, CodingKey {
        case chapters = "Chapters"
        case contentIdentifier = "ContentIdentifier"
        case contentVersion = "ContentVersion"
        case deploymentTarget = "DeploymentTarget"
        case developmentRegion = "DevelopmentRegion"
        case hasMeaningfulResetPoint = "HasMeaningfulResetPoint"
        case swiftVersion = "SwiftVersion"
        case userAutoImportedAuxiliaryModules = "UserAutoImportedAuxiliaryModules"
        case userModuleMode = "UserModuleMode"
        case version = "Version"
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(chapters, forKey: .chapters)
        try container.encode(contentIdentifier, forKey: .contentIdentifier)
        try container.encode(contentVersion, forKey: .contentVersion)
        try container.encode(deploymentTarget, forKey: .deploymentTarget)
        try container.encode(developmentRegion, forKey: .developmentRegion)
        try container.encode(hasMeaningfulResetPoint, forKey: .hasMeaningfulResetPoint)
        try container.encode(swiftVersion, forKey: .swiftVersion)
        try container.encode(userAutoImportedAuxiliaryModules, forKey: .userAutoImportedAuxiliaryModules)
        try container.encode(userModuleMode, forKey: .userModuleMode)
        try container.encode(version, forKey: .version)
    }
}
