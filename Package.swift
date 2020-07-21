// swift-tools-version:5.3

import PackageDescription

struct PackageMetadata {
    static let version: String = "4.5.4-srg3"
    static let checksum: String = "903f5adc7fea6b5d3015734feba9770be2616b0b6732c5d8c16163af6007fac1"
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
