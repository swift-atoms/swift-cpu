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
    dependencies: [],
    targets: [
        .target(
            name: "CPU Shims",
            dependencies: []
        ),
        .target(
            name: "CPU",
            dependencies: [
                .target(name: "CPU Shims"),
            ]
        ),
        .target(
            name: "CPU Test Support",
            dependencies: [
                .target(name: "CPU"),
            ],
            path: "Tests/Support"
        ),
        .testTarget(
            name: "CPU Tests",
            dependencies: [
                .target(name: "CPU"),
                .target(name: "CPU Test Support"),
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
