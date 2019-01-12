import Foundation
import Futura

public protocol Storage {
    /// Tries to load data record with given StorageID.
    /// Returns Future fulfilled with data record matching given StorageID or failed with suitable error.
    func load<Data: Codable>(_ storageID: StorageID<Data>) -> Future<Data>
    /// Tires to load all data records matching given filter or all of given type if no filter provided.
    /// Returns Future fulfilled with all data records matching given filter or failed with suitable error.
    func load<Data: Codable>(_ type: Data.Type, filter: Filter<Data>?) -> Future<[Stored<Data>]>
    /// Saves data record.
    /// Returns Future fulfilled with StorageID assigned to saved data or failed with suitable error.
    func save<Data: Codable>(_ data: Data) -> Future<StorageID<Data>>
    /// Tries to update data record with given StorageID.
    /// Returns Future fulfilled with Void or failed with suitable error.
    func update<Data: Codable>(_ storageID: StorageID<Data>, with data: Data) -> Future<Void>
    /// Tries to update all data records matching given filter.
    /// Returns Future fulfilled with number of updated records or failed with suitable error
    func update<Data: Codable>(allMatching filter: Filter<Data>, with data: Data) -> Future<UInt>
    /// Tries to delete data record with given StorageID.
    /// Returns Future fulfilled with Void or failed with suitable error
    func delete<Data: Codable>(_ data: StorageID<Data>) -> Future<Void>
    /// Tries to delete all data records matching given filter.
    /// Returns Future fulfilled with number of deleted records or failed with suitable error
    func delete<Data: Codable>(allMatching filter: Filter<Data>) -> Future<UInt>
}
