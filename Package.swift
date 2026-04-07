// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let llamaVersion = "b8693"
let llamaChecksum = "d53edc12afd3ae5145fc2aaa886105c40ca82253be46719315efb7a9d50aa4d8"

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
            url: "https://github.com/BrunoCerberus/swift-llama-cpp/releases/download/\(llamaVersion)/llama-b8693-fixed.zip",
            checksum: llamaChecksum
        ),
        .testTarget(
            name: "SwiftLlamaTests",
            dependencies: ["SwiftLlama"],
            resources: [.copy("Resources")]
        ),
    ]
)
