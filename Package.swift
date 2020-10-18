// swift-tools-version:5.2
import PackageDescription

let package = Package(
    name: "websocket-kit",
    platforms: [
       .macOS(.v10_15)
    ],
    products: [
        .library(name: "WebSocketKit", targets: ["WebSocketKit"]),
    ],
    dependencies: [
        .package(url: "https://github.com/val-verde/swift-nio.git", .branch("val-verde-mainline")),
        .package(url: "https://github.com/val-verde/swift-nio-ssl.git", .branch("val-verde-mainline")),
    ],
    targets: [
        .target(name: "WebSocketKit", dependencies: [
            .product(name: "NIO", package: "swift-nio"),
            .product(name: "NIOConcurrencyHelpers", package: "swift-nio"),
            .product(name: "NIOFoundationCompat", package: "swift-nio"),
            .product(name: "NIOHTTP1", package: "swift-nio"),
            .product(name: "NIOSSL", package: "swift-nio-ssl"),
            .product(name: "NIOWebSocket", package: "swift-nio"),
        ]),
        .testTarget(name: "WebSocketKitTests", dependencies: [
            .target(name: "WebSocketKit"),
        ]),
    ]
)
