// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "2-RxSwift-Observables-Operators",
    dependencies: [
    .package(url: "https://github.com/ReactiveX/RxSwift.git", "4.0.0" ..< "5.0.0")
  ],
    targets: [
        .target(
            name: "2-RxSwift-Observables-Operators",
            dependencies: ["RxSwift", "RxCocoa"]),
    ]
)
