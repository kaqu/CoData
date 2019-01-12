import Foundation
import Futura

fileprivate let timeSeed: () -> UInt64 = { Date().timeIntervalSinceReferenceDate.bitPattern }
fileprivate let sequence: () -> UInt64 = {
    var current: UInt64 = 0
    let mtx: Mutex.Pointer = Mutex.make(recursive: false)
    return {
        Mutex.lock(mtx)
        defer { Mutex.unlock(mtx) }
        defer { current += 1 }
        return current
    }
}()

/// Unique identifier matching zero or one database record.
public struct StorageID<Record: Codable>: Codable {
    public let rawValue: UInt64

    internal init(_ rawValue: UInt64) {
        self.rawValue = rawValue
    }

    internal init() {
        self.rawValue = (timeSeed() << 12)
            | (sequence() & 0b1111_1111_1111)
    }
}
