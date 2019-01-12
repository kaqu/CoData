/// Data stored in database with its identifier
public struct Stored<Data: Codable>: Codable {
    public let storageID: StorageID<Data>
    public let data: Data
    
    internal init(_ data: Data, storageID: StorageID<Data>) {
        self.storageID = storageID
        self.data = data
    }
}
