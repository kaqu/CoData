/// Data stored in database with its identifier
public struct Stored<Record: Codable> {
    public let storageID: StorageID<Record>
    public let record: Record
    
    internal init(_ record: Record, storageID: StorageID<Record>) {
        self.storageID = storageID
        self.record = record
    }
}
