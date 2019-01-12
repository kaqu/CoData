import Foundation

public struct Filter<Record> {
    public static var all: Filter<Record> { return .init { _ in true } }
    
    internal let filter: (Record) -> Bool

    public init(_ filter: @escaping (Record) -> Bool) {
        self.filter = filter
    }

    public init(_ filters: Filter<Record>...) {
        self.filter = { data in
            filters.reduce(into: true, { result, filter in
                result = result && filter.filter(data)
            })
        }
    }
}

internal extension Filter {
    init<Value: Equatable>(_ keyPath: KeyPath<Record, Value>, equal value: Value) {
        self.filter = { data in
            data[keyPath: keyPath] == value
        }
    }

    init<Value: Equatable>(_ keyPath: KeyPath<Record, Value>, notEqual value: Value) {
        self.filter = { data in
            data[keyPath: keyPath] != value
        }
    }

    init<Value: Comparable>(_ keyPath: KeyPath<Record, Value>, lessValuehan value: Value) {
        self.filter = { data in
            data[keyPath: keyPath] < value
        }
    }

    init<Value: Comparable>(_ keyPath: KeyPath<Record, Value>, lessValuehanOrEqual value: Value) {
        self.filter = { data in
            data[keyPath: keyPath] <= value
        }
    }

    init<Value: Comparable>(_ keyPath: KeyPath<Record, Value>, greaterValuehan value: Value) {
        self.filter = { data in
            data[keyPath: keyPath] > value
        }
    }

    init<Value: Comparable>(_ keyPath: KeyPath<Record, Value>, greaterValuehanOrEqual value: Value) {
        self.filter = { data in
            data[keyPath: keyPath] >= value
        }
    }
}

public extension Decodable {
    static var all: Filter<Self> { return .init { _ in true } }
}

public func == <Record: Codable, Value: Equatable>(_ lhs: KeyPath<Record, Value>, _ rhs: Value) -> Filter<Record> {
    return .init(lhs, equal: rhs)
}

public func != <Record: Codable, Value: Equatable>(_ lhs: KeyPath<Record, Value>, _ rhs: Value) -> Filter<Record> {
    return .init(lhs, notEqual: rhs)
}

public func < <Record: Codable, Value: Comparable>(_ lhs: KeyPath<Record, Value>, _ rhs: Value) -> Filter<Record> {
    return .init(lhs, lessValuehan: rhs)
}

public func <= <Record: Codable, Value: Comparable>(_ lhs: KeyPath<Record, Value>, _ rhs: Value) -> Filter<Record> {
    return .init(lhs, lessValuehanOrEqual: rhs)
}

public func > <Record: Codable, Value: Comparable>(_ lhs: KeyPath<Record, Value>, _ rhs: Value) -> Filter<Record> {
    return .init(lhs, greaterValuehan: rhs)
}

public func >= <Record: Codable, Value: Comparable>(_ lhs: KeyPath<Record, Value>, _ rhs: Value) -> Filter<Record> {
    return .init(lhs, greaterValuehanOrEqual: rhs)
}

public func && <Record: Codable>(_ lhs: Filter<Record>, _ rhs: Filter<Record>) -> Filter<Record> {
    return .init(lhs, rhs)
}
