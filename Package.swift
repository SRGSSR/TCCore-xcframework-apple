// swift-tools-version:5.3

import PackageDescription

struct PackageMetadata {
    static let version: String = "4.5.4-srg4+b1"
    static let checksum: String = "cf16f4855ae4cd5ca32b00658ce4b99a5aee755b83d85f26c353a770fdd356d1"
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
