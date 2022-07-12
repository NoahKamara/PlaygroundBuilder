//
//  File.swift
//  
//
//  Created by Noah Kamara on 11.07.22.
//

//extension Never: SourceCode {
//    public typealias SRC = Never
//    public var source: SRC { fatalError() }
//}

extension String: SourceCode {
    public var source: String {
        self
    }
}
