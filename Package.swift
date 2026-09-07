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
        .library(name: "CPU", targets: ["CPU"]),
        .library(name: "CPU Standard Library Integration", targets: ["CPU Standard Library Integration"]),
        .library(name: "CPU Foundation Library Integration", targets: ["CPU Foundation Library Integration"]),
        .library(name: "CPU Test Support", targets: ["CPU Test Support"]),
    ],
    dependencies: [
        .package(path: "../../swift-support/swift-cpu-shims"),
        .package(url: "https://github.com/swift-atoms/swift-cardinal.git", branch: "main"),
        .package(url: "https://github.com/swift-atoms/swift-ordinal.git", branch: "main"),
        .package(url: "https://github.com/swift-atoms/swift-tagged.git", branch: "main"),

],
    targets: [
        .target(
            name: "CPU",
            dependencies: [
                .product(name: "CPU Shims", package: "swift-cpu-shims"),
                .product(name: "Cardinal", package: "swift-cardinal"),
                .product(name: "Ordinal", package: "swift-ordinal"),
                .product(name: "Tagged", package: "swift-tagged"),

            ],
            path: "Sources/CPU"
        ),
        .target(
            name: "CPU Standard Library Integration",
            dependencies: [
                .target(name: "CPU"),
            ],
            path: "Sources/CPU Standard Library Integration"
        ),
        .target(
            name: "CPU Foundation Library Integration",
            dependencies: [
                .target(name: "CPU"),
                .target(name: "CPU Standard Library Integration"),
            ],
            path: "Sources/CPU Foundation Library Integration"
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
                .target(name: "CPU Standard Library Integration"),
                .target(name: "CPU Foundation Library Integration"),
            ],
            path: "Tests/CPU Tests"
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets {
    target.swiftSettings = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("Lifetimes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
    ]
}
