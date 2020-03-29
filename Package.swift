// swift-tools-version:5.2

import PackageDescription

let package = Package(
  name: "Networker",
  platforms: [
    .macOS(.v10_15),
    .iOS(.v13)
  ],
  products: [
    .library(
      name: "Networker",
      targets: ["Networker"]),
  ],
  dependencies: [
    .package(url: "https://github.com/apple/swift-log.git", from: "1.0.0")
  ],
  targets: [
    .target(
      name: "Networker",
      dependencies: [
        .product(name: "Logging", package: "swift-log")
      ]
    ),
    .testTarget(
      name: "NetworkerTests",
      dependencies: ["Networker"]),
  ]
)
