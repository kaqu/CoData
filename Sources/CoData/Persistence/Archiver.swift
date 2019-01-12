import Futura

public protocol Archiver {
    /// Archives data to disk
    func archive<Record: Codable>(_ data: Stored<Record>) -> Future<Void>
    /// Restores data from disk
    func restore<Record: Codable>(_ storageID: StorageID<Record>) -> Future<Record>
    /// Restores all data of given type from disk
    func restoreAll<Record: Codable>(_ type: Record.Type) -> Future<Stored<Record>>
}
