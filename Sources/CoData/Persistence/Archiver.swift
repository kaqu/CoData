import Futura

public protocol Archiver {
    /// Archives data to disk
    func archive<Data: Codable>(_ data: Stored<Data>) -> Future<Void>
    /// Restores data from disk
    func restore<Data: Codable>(_ storageID: StorageID<Data>) -> Future<Data>
    /// Restores all data of given type from disk
    func restoreAll<Data: Codable>(_ type: Data.Type) -> Future<Stored<Data>>
}
