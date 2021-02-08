// swift-tools-version:5.3

import PackageDescription

struct PackageMetadata {
    static let version: String = "4.5.4-srg4+b2"
    static let checksum: String = "3c9d70246bc0549c1eefbe68bef0edd99240360cf03efacfe66c943495639cde"
}

let package = Package(
    name: "TCCore",
    platforms: [
        .iOS(.v9),
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
