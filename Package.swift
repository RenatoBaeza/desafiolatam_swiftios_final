// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "desafio3",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        .library(
            name: "desafio3",
            targets: ["desafio3"])
    ],
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire.git", from: "5.8.1")
    ],
    targets: [
        .target(
            name: "desafio3",
            dependencies: [.product(name: "Alamofire", package: "Alamofire")],
            path: "desafio3",
            exclude: ["Info.plist"]
        ),
        .testTarget(
            name: "desafio3Tests",
            dependencies: ["desafio3"],
            path: "desafio3Tests"
        )
    ]
) 