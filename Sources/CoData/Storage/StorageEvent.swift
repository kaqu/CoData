import Foundation

public enum StorageEvent<Record: Codable> {
    case insert(Stored<Record>)
    case update(Stored<Record>)
    case delete(Stored<Record>)
}

extension StorageEvent {
    public var stored: Stored<Record> {
        switch self {
            case let .insert(record):
                return record
            case let .update(record):
                return record
            case let .delete(record):
                return record
        }
    }

    public var record: Record {
        return stored.record
    }
}
