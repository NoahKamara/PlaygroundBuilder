//
//  File.swift
//  
//
//  Created by Noah Kamara on 11.07.22.
//

import Foundation

protocol AnyModule {
    var name: String { get }
    var sources: Sources { get }
}
