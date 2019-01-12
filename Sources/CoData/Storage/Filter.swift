import Foundation

public struct Filter<Data> {
    internal let filter: (Data) -> Bool

    public init(_ filter: @escaping (Data) -> Bool) {
        self.filter = filter
    }

    public init(_ filters: Filter<Data>...) {
        self.filter = { data in
            filters.reduce(into: true, { result, filter in
                result = result && filter.filter(data)
            })
        }
    }

    internal init<T: Equatable>(_ keyPath: KeyPath<Data, T>, equal value: T) {
        self.filter = { data in
            data[keyPath: keyPath] == value
        }
    }

    internal init<T: Equatable>(_ keyPath: KeyPath<Data, T>, notEqual value: T) {
        self.filter = { data in
            data[keyPath: keyPath] != value
        }
    }

    internal init<T: Comparable>(_ keyPath: KeyPath<Data, T>, lessThan value: T) {
        self.filter = { data in
            data[keyPath: keyPath] < value
        }
    }

    internal init<T: Comparable>(_ keyPath: KeyPath<Data, T>, lessThanOrEqual value: T) {
        self.filter = { data in
            data[keyPath: keyPath] <= value
        }
    }

    internal init<T: Comparable>(_ keyPath: KeyPath<Data, T>, greaterThan value: T) {
        self.filter = { data in
            data[keyPath: keyPath] > value
        }
    }

    internal init<T: Comparable>(_ keyPath: KeyPath<Data, T>, greaterThanOrEqual value: T) {
        self.filter = { data in
            data[keyPath: keyPath] >= value
        }
    }
}

public func == <Data: Codable, T: Equatable>(_ lhs: KeyPath<Data, T>, _ rhs: T) -> Filter<Data> {
    return .init(lhs, equal: rhs)
}

public func != <Data: Codable, T: Equatable>(_ lhs: KeyPath<Data, T>, _ rhs: T) -> Filter<Data> {
    return .init(lhs, notEqual: rhs)
}

public func < <Data: Codable, T: Comparable>(_ lhs: KeyPath<Data, T>, _ rhs: T) -> Filter<Data> {
    return .init(lhs, lessThan: rhs)
}

public func <= <Data: Codable, T: Comparable>(_ lhs: KeyPath<Data, T>, _ rhs: T) -> Filter<Data> {
    return .init(lhs, lessThanOrEqual: rhs)
}

public func > <Data: Codable, T: Comparable>(_ lhs: KeyPath<Data, T>, _ rhs: T) -> Filter<Data> {
    return .init(lhs, greaterThan: rhs)
}

public func >= <Data: Codable, T: Comparable>(_ lhs: KeyPath<Data, T>, _ rhs: T) -> Filter<Data> {
    return .init(lhs, greaterThanOrEqual: rhs)
}

public func && <Data: Codable>(_ lhs: Filter<Data>, _ rhs: Filter<Data>) -> Filter<Data> {
    return .init(lhs, rhs)
}
