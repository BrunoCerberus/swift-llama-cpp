// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let llamaVersion = "b8693"
let llamaChecksum = "1d513d313c0153fe7deed74b4f15fcff60198304224d76a42149ab0409107313"

let package = Package(
    name: "swift-llama-cpp",
    platforms: [
        .macOS(.v14),
        .iOS(.v17)
    ],
    products: [
        .library(
            name: "SwiftLlama",
            targets: ["SwiftLlama"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "SwiftLlama",
            dependencies: [
                "llama"
            ]
        ),
        .binaryTarget(
            name: "llama",
            url: "https://github.com/ggml-org/llama.cpp/releases/download/\(llamaVersion)/llama-\(llamaVersion)-xcframework.zip",
            checksum: llamaChecksum
        ),
        .testTarget(
            name: "SwiftLlamaTests",
            dependencies: ["SwiftLlama"],
            resources: [.copy("Resources")]
        ),
    ]
)
