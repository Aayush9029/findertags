// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "findertags",
    platforms: [.macOS(.v13)],
    products: [
        .executable(name: "findertags", targets: ["findertags"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser.git", from: "1.3.0"),
    ],
    targets: [
        .executableTarget(
            name: "findertags",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
            ]
        ),
        .testTarget(
            name: "FinderTagsTests",
            dependencies: ["findertags"]
        ),
    ]
)
