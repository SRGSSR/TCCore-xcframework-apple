// swift-tools-version:5.3

import PackageDescription

struct PackageMetadata {
    static let version: String = "4.5.4"
    static let checksum: String = ""
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
