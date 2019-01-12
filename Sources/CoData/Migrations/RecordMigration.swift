

public struct RecordMigration<Record: Codable> {
    internal let migration: (MigrationObject<Record>) throws -> Record
    
    public init(migration: @escaping (MigrationObject<Record>) throws -> Record) {
        self.migration = migration
    }
}
