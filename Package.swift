// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "swift-cpu",
    platforms: [
        .macOS(.v27),
        .iOS(.v27),
        .tvOS(.v27),
        .watchOS(.v27),
        .visionOS(.v27),
    ],
    products: [
        .library(
            name: "CPU",
            targets: ["CPU"]
        ),
        .library(
            name: "CPU Test Support",
            targets: ["CPU Test Support"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/swift-molecules/swift-binary.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-molecules/swift-binary-serializer.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-molecules/swift-bit.git",
            branch: "main"
        ),
    ],
    targets: [
        .target(
            name: "CPU Shims",
            dependencies: []
        ),
        .target(
            name: "CPU",
            dependencies: [
                .target(name: "CPU Shims"),
                .product(name: "Binary", package: "swift-binary"),
                .product(
                    name: "Binary Serializable",
                    package: "swift-binary-serializer"
                ),
            ]
        ),
        .target(
            name: "CPU Test Support",
            dependencies: [
                "CPU",
                .product(name: "Bit Test Support", package: "swift-bit"),
            ],
            path: "Tests/Support"
        ),
        .testTarget(
            name: "CPU Tests",
            dependencies: [
                "CPU",
                "CPU Test Support",
            ]
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    let ecosystem: [SwiftSetting] = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("Lifetimes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
    ]

    let package: [SwiftSetting] = []

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}
