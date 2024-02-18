// swift-tools-version:5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let package = Package(
    name: "TransmissionTypes",
    platforms: [.macOS(.v13), .iOS(.v15)],
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "TransmissionTypes",
            targets: ["TransmissionTypes"]),
    ],
    dependencies: [
        .package(url: "https://github.com/OperatorFoundation/Datable", from: "4.0.1"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "TransmissionTypes",
            dependencies: ["Datable",]
        ),
        .testTarget(
            name: "TransmissionTypesTests",
            dependencies: ["TransmissionTypes"]),
    ],
    swiftLanguageVersions: [.v5]
)
