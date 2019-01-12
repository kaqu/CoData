import Foundation
import Futura

fileprivate let timeSeed: () -> UInt64 = { Date().timeIntervalSinceReferenceDate.bitPattern }
fileprivate let nextSeed: () -> UInt64 = {
    var sequenceSeed: UInt64 = 0
    let mtx: Mutex.Pointer = Mutex.make(recursive: false)
    return {
        Mutex.lock(mtx)
        defer { Mutex.unlock(mtx) }
        defer { sequenceSeed += 1 }
        return sequenceSeed
    }
}()

/// Unique identifier matching one or no database records.
public struct StorageID<Data: Codable>: Codable {
    public let rawValue: UInt64

    internal init(_ rawValue: UInt64) {
        self.rawValue = rawValue
    }

    internal init() {
        let typeHash: Int = "\(Data.self)".hashValue
        self.rawValue = (timeSeed() << 20)
            | (UInt64(typeHash * typeHash.signum()) & 0b111_1111_1000_0000_0000)
            | (nextSeed() & 0b1111_1111_1111)
    }
}
