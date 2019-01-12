import Foundation
import Futura

public protocol Storage {
    /// Tries to load data record with given StorageID.
    /// Returns Future fulfilled with data record matching given StorageID or failed with suitable error.
    func load<Record: Codable>(_ storageID: StorageID<Record>) -> Future<Record>
    /// Tires to load all data records matching given filter.
    /// Returns Future fulfilled with all data records matching given filter or failed with suitable error.
    func load<Record: Codable>(_ filter: Filter<Record>) -> Future<[Stored<Record>]>
    /// Saves data record.
    /// Returns Future fulfilled with StorageID assigned to saved data or failed with suitable error.
    func save<Record: Codable>(_ data: Record) -> Future<StorageID<Record>>
    /// Tries to update data record with given StorageID.
    /// Returns Future fulfilled with Void or failed with suitable error.
    func update<Record: Codable>(_ storageID: StorageID<Record>, with data: Record) -> Future<Void>
    /// Tries to update all data records matching given filter.
    /// Returns Future fulfilled with number of updated records or failed with suitable error
    func update<Record: Codable>(allMatching filter: Filter<Record>, with data: Record) -> Future<UInt>
    /// Tries to delete data record with given StorageID.
    /// Returns Future fulfilled with Void or failed with suitable error
    func delete<Record: Codable>(_ data: StorageID<Record>) -> Future<Void>
    /// Tries to delete all data records matching given filter.
    /// Returns Future fulfilled with number of deleted records or failed with suitable error
    func delete<Record: Codable>(allMatching filter: Filter<Record>) -> Future<UInt>
}
