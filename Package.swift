// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "OCMockitoSwift",
    products: [        
        .library(
            name: "OCMockitoSwift",
            targets: ["OCMockitoSwift"]),
    ],
    dependencies: [        
        .package(url: "https://github.com/jonreid/OCMockito.git", from: "6.0.0"),
        .package(url: "https://github.com/hamcrest/OCHamcrest.git", from: "8.0.0")
    ],
    targets: [
        .target(
            name: "OCMockitoSwift",
            dependencies: [])
    ]
)
