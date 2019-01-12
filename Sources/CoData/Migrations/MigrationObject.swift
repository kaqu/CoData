//
//  MigrationObject.swift
//  CoData
//
//  Created by Kacper Kaliński on 12/01/2019.
//

import Foundation

@dynamicMemberLookup
public final class MigrationObject<Record: Codable> {
    
    public let schemaVersion: UInt
    internal var dataDict: [String: Any] = [:]
    
    subscript<T: Codable>(dynamicMember member: String) -> T {
        fatalError()
    }
    
    internal init(schemaVersion: UInt) {
        self.schemaVersion = schemaVersion
    }
}
