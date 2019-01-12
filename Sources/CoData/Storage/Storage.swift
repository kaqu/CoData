import Foundation
import Futura

/// All pending Futures ends with error and all active Signals becomes terminated when storage becomes dealocated.
public protocol Storage {
    /// Tries to load data record with given StorageID.
    /// Returns Future fulfilled with data record matching given StorageID or failed with suitable error.
    func load<Record: Codable>(_ storageID: StorageID<Record>) -> Future<Record>
    /// Tires to load all data records matching given filter.
    /// Returns Future fulfilled with all data records matching given filter or failed with suitable error.
    func load<Record: Codable>(_ filter: Filter<Record>) -> Future<[Stored<Record>]>
    /// Observes data record with given StorageID.
    /// Returns Signal that gets value every time observed record becomes updated and terminates when becomes deleted.
    func observe<Record: Codable>(_ storageID: StorageID<Record>) -> Signal<Record>
    /// Observes data records matching given filter.
    /// Returns Signal that gets value every time any record matching filter becomes added, deleted or updated.
    func observe<Record: Codable>(_ filter: Filter<Record>) -> Signal<StorageEvent<Record>>
    /// Saves data record.
    /// Returns Future fulfilled with StorageID assigned to saved data or failed with suitable error.
    func save<Record: Codable>(_ record: Record) -> Future<StorageID<Record>>
    /// Tries to update data record with given StorageID.
    /// Returns Future fulfilled with Void or failed with suitable error.
    func update<Record: Codable>(_ storageID: StorageID<Record>, with data: Record) -> Future<Void>
    /// Tries to update all data records matching given filter.
    /// Returns Future fulfilled with number of updated records or failed with suitable error
    func update<Record: Codable>(allMatching filter: Filter<Record>, with data: Record) -> Future<UInt>
    /// Tries to delete data record with given StorageID.
    /// Returns Future fulfilled with Void or failed with suitable error
    func delete<Record: Codable>(_ storageID: StorageID<Record>) -> Future<Void>
    /// Tries to delete all data records matching given filter.
    /// Returns Future fulfilled with number of deleted records or failed with suitable error
    func delete<Record: Codable>(_ filter: Filter<Record>) -> Future<UInt>
}
