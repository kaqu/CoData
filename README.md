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