import Foundation

internal final class ArchiveDecoder: Decoder {
    var codingPath: [CodingKey]
    
    var userInfo: [CodingUserInfoKey : Any]
    
    func container<Key>(keyedBy type: Key.Type) throws -> KeyedDecodingContainer<Key> where Key : CodingKey {
        fatalError()
    }
    
    func unkeyedContainer() throws -> UnkeyedDecodingContainer {
        fatalError()
    }
    
    func singleValueContainer() throws -> SingleValueDecodingContainer {
        fatalError()
    }
    
    
    init() {
        fatalError()
    }
}

struct User: Codable {
    var name: String
    var surname: String
    var age: UInt8
}
