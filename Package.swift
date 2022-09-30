// swift-tools-version:5.3

import PackageDescription

struct PackageMetadata {
    static let version: String = "5.1.1"
    static let checksum: String = "68337e3e143b9bea67203e29af81035a00253305607d250d3de384266afe754f"
}

let package = Package(
    name: "TCCore",
    platforms: [
        .iOS(.v12),
        .tvOS(.v12)
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
