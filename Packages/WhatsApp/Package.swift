// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "WhatsApp",
  platforms: [
    .iOS(.v16),
    .macOS(.v10_15)
  ],
  products: [
    // Products define the executables and libraries a package produces, making them visible to other packages.
    .library(
      name: "AppFeature",
      targets: ["AppFeature"]
    ),
    .library(
      name: "OnboardingFeature",
      targets: ["OnboardingFeature"]
    ),
    .library(
      name: "AuthentificationFeature",
      targets: ["AuthentificationFeature"]
    ),
    .library(
      name: "Components",
      targets: ["Components"]
    ),
    .library(
      name: "ChatFeature",
      targets: ["ChatFeature"]
    ),
    .library(
      name: "InboxFeature",
      targets: ["InboxFeature"]
    ),
    .library(
      name: "NewMessageFeature",
      targets: ["NewMessageFeature"]
    ),
    .library(
      name: "ProfileFeature",
      targets: ["ProfileFeature"]
    ),
    .library(
      name: "NavigationFeature",
      targets: ["NavigationFeature"]
    ),
    .library(
      name: "SettingsFeature",
      targets: ["SettingsFeature"]
    )
  ],
  dependencies: [
    .package(url: "https://github.com/pointfreeco/swift-composable-architecture.git", from: "1.8.0"),
    .package(path: "../UIComponentPackage"),
  ],
  targets: [
    // Targets are the basic building blocks of a package, defining a module or a test suite.
    // Targets can depend on other targets in this package and products from dependencies.
    .target(
      name: "AppFeature",
      dependencies: [
        "NavigationFeature",
        "AuthentificationFeature",
        "OnboardingFeature",
        .product(name: "ComposableArchitecture", package: "swift-composable-architecture")
      ]
    ),
    .target(
      name: "OnboardingFeature",
      dependencies: [
        .product(name: "ComposableArchitecture", package: "swift-composable-architecture")
      ]
    ),
    .target(
      name: "AuthentificationFeature",
      dependencies: [
        .product(name: "ComposableArchitecture", package: "swift-composable-architecture")
      ]
    ),
    .target(
      name: "Components",
      dependencies: [
      ]
    ),
    .target(
      name: "ChatFeature",
      dependencies: [
        .product(name: "ComposableArchitecture", package: "swift-composable-architecture")
      ]
    ),
    .target(
      name: "InboxFeature",
      dependencies: [
        .product(name: "NavigationBarColorViewModifier", package: "UIComponentPackage"),
        .product(name: "ComposableArchitecture", package: "swift-composable-architecture")
      ]
    ),
    .target(
      name: "NewMessageFeature",
      dependencies: [
        .product(name: "ComposableArchitecture", package: "swift-composable-architecture")
      ]
    ),
    .target(
      name: "ProfileFeature",
      dependencies: [
        .product(name: "ComposableArchitecture", package: "swift-composable-architecture")
      ]
    ),
    .target(
      name: "SettingsFeature",
      dependencies: [
        .product(name: "ComposableArchitecture", package: "swift-composable-architecture")
      ]
    ),
    .target(name: "NavigationFeature", dependencies: [
      "ChatFeature",
      "InboxFeature",
      "NewMessageFeature",
      "ProfileFeature",
      "SettingsFeature",
      .product(name: "NavigationBarColorViewModifier", package: "UIComponentPackage"),
      .product(name: "ComposableArchitecture", package: "swift-composable-architecture")
    ])
  ]
)
