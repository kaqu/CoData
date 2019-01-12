# CoData

Swift NoSQL database for Codable with Futura support.

## Usage

Main goal is to have easiest possible and swifty interface to access database.
Data should only conform to Codable protocol to be allowed to store in database.
Expressive filters should allow to make easy and readable queries.
Filters may be used also to observe data flow and database changes.

Example:

``` swift
struct User: Codable {
    var name: String
    var surname: String
    var age: UInt8
}

...

let storage: Storage = ...
storage.load(User.allRecords)
storage.load(\User.name == "Blob" && \User.age > 18)
storage.load(\User.name == "Blob Jr." || \User.age < 18)
storage.load(Filter<User> { user in user.surname.count > 3 })
```

Thanks to @dynamicMemberLookup there is no need of schema or keeping old models in code.
Migration code better than ever:

``` swift
/* old */
// struct User: Codable {
//    var name: String
//    var surname: String
//    var age: UInt8
// }

/* new */
struct User: Codable {
    var name: String
    var newSurname: String
    var age: UInt8
}

RecordMigration<User> { migrationObject in
    guard migrationObject.schemaVersion == 1 else {
        throw NSError()
    }
    return User(name: migrationObject.name,
                newSurname: migrationObject.surname,
                age: migrationObject.age)
}
```