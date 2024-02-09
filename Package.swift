// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "Swoctokit",
    products: [
        .library(
            name: "Swoctokit",
            targets: ["Swoctokit"]),
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/vapor.git", from: "4.90.0"),
    ],
    targets: [
        .target(name: "Swoctokit", dependencies: ["Vapor"]),
        .testTarget(name: "SwoctokitTests", dependencies: ["Swoctokit"])
    ]
)

