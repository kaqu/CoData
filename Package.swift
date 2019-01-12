// swift-tools-version:4.2

import PackageDescription

let package = Package(
    name: "CoData",
    products: [
        .library(
            name: "CoData",
            targets: ["CoData"]),
    ],
    dependencies: [
        .package(url: "https://github.com/miquido/futura.git", .branch("feature/spm")),
    ],
    targets: [
        .target(
            name: "CoData",
            dependencies: ["Futura"]),
        .testTarget(
            name: "CoDataTests",
            dependencies: ["Futura", "CoData"]),
    ]
)
