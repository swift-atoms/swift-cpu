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
            name: "CPU Standard Library Integration",
            targets: ["CPU Standard Library Integration"]
        ),
        .library(
            name: "CPU Apple Foundation Integration",
            targets: ["CPU Apple Foundation Integration"]
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
                .target(name: "CPU Shims")
            ]
        ),
        .target(
            name: "CPU Standard Library Integration",
            dependencies: ["CPU"]
        ),
        .target(
            name: "CPU Apple Foundation Integration",
            dependencies: [
                "CPU",
                "CPU Standard Library Integration",
            ]
        ),
        .testTarget(
            name: "CPU Tests",
            dependencies: ["CPU"]
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
