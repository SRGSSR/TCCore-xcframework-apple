# TCCore XCFramework

XCFramework binaries are currently not provided by Tag Commander via SPM. Until they are this repository provides XCFrameworks for versions we use at SRG SSR, with a Swift Package Manager manifest for easy integration in projects.

## Integration

Use [Swift Package Manager](https://swift.org/package-manager) directly [within Xcode](https://developer.apple.com/documentation/xcode/adding_package_dependencies_to_your_app). You can also declare the library as a dependency of another one directly in the associated `Package.swift` manifest.

## Making the XCFramework available

To make the generated framework available:

1. Download zipped binaries from [Commanders Act official repository](https://github.com/CommandersAct/iOSV5) and rename the zip as `TCCore.xcframework.zip`.
2. Update `Package.swift` in this repository with the framework version number. 
3. Run `swift package compute-checksum TCCore.xcframework.zip` to compute the checksum and insert it into `Package.swift`.
4. Commit the changes on `master` and create a corresponding tag.
5. Push the commit and the tag to GitHub.
6. Attach the binary to the tag on GitHub.

Do not commit the binaries in the repository, as this would slow done checkouts made by SPM as the repository grows.