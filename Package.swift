// swift-tools-version:5.8
import PackageDescription

let package = Package(
    name: "scheduler-notification",
    platforms: [
        .macOS(.v12)
    ],
    dependencies: [
        // 💧 A server-side Swift web framework.
        .package(url: "https://github.com/vapor/vapor.git", from: "4.81.0"),
        .package(url: "https://github.com/nerzh/telegram-vapor-bot.git", from: "2.3.2")
    ],
    targets: [
        .executableTarget(
            name: "App",
            dependencies: [
                .product(name: "Vapor", package: "vapor"),
                .product(name: "TelegramVaporBot", package: "telegram-vapor-bot")
            ]
        )
    ]
)
