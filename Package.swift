// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Popoverable",
    platforms: [.macOS(.v11)],
    products: [
        .library(
            name: "Popoverable",
            targets: ["Popoverable"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "Popoverable",
            dependencies: []),
        .testTarget(
            name: "PopoverableTests",
            dependencies: ["Popoverable"]),
    ]
)
