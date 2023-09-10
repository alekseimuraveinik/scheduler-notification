import Vapor
import TelegramVaporBot

func routes(_ app: Application) throws {
    
}

func routes(_ bot: TGConnectionPrtcl) async {
    await bot.dispatcher.add(
        TGCommandHandler(commands: ["/start"]) { update, bot in
            guard let chatId = update.message?.chat.id else { return }
            try await bot.sendMessage(
                params: .init(
                    chatId: .chat(chatId),
                    text: "\(chatId)"
                )
            )
        }
    )
}
