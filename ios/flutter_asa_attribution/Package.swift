// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "flutter_asa_attribution",
    platforms: [
        .iOS("14.3")
    ],
    products: [
        .library(name: "flutter-asa-attribution", targets: ["flutter_asa_attribution"])
    ],
    dependencies: [],
    targets: [
        .target(
            name: "flutter_asa_attribution",
            dependencies: [],
            path: "Sources/flutter_asa_attribution",
            linkerSettings: [
                .linkedFramework("AdServices")
            ]
        )
    ]
)
