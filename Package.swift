// swift-tools-version: 6.1
import PackageDescription

let package = Package(
    name: "Zero2Hero",
    platforms: [
        .macOS(.v14), .iOS(.v17)
    ],
    targets: [
        .executableTarget(
            name: "Zero2Hero", exclude: ["Projects"]),
    ]
)
