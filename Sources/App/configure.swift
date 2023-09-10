import Vapor
import TelegramVaporBot

// configures your application
public func configure(
    _ app: Application,
    _ botConnection: inout TGConnectionPrtcl?
) async throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    let token = Environment.get("token")!
    let bot = TGBot(app: app, botId: token)
    let connection = try await TGLongPollingConnection(bot: bot)
        
    botConnection = connection
    
    // register routes
    try routes(app)
    await routes(connection)
}
