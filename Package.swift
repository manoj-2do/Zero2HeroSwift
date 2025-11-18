// swift-tools-version: 6.1
import PackageDescription

let package = Package(
    name: "Zero2Hero",
    platforms: [
        .macOS(.v14), .iOS(.v17)
    ],
    dependencies: [
        .package(
            url: "https://github.com/apple/swift-collections",
            from: "1.0.0"
        )
    ],
    targets: [
        .executableTarget(
            name: "Zero2Hero",
            dependencies: [
                .product(name: "DequeModule", package: "swift-collections")
            ],
            exclude: ["Projects"]
        ),
    ]
)
