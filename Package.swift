// swift-tools-version:5.3

import PackageDescription

struct PackageMetadata {
    static let version: String = "4.5.4-srg3"
    static let checksum: String = "bd6aa90afdac4348629af2317e3719d4155cfb1ebe32a25083ccc2f326d9f9c7"
}

let package = Package(
    name: "TCCore",
    platforms: [
        .iOS(.v8),
        .tvOS(.v9)
    ],
    products: [
        .library(
            name: "TCCore",
            targets: ["TCCore"]
        ),
    ],
    targets: [
        .binaryTarget(
            name: "TCCore",
            url: "https://github.com/SRGSSR/TCCore-xcframework-apple/releases/download/\(PackageMetadata.version)/TCCore.xcframework.zip",
            checksum: PackageMetadata.checksum
        )
    ]
)
