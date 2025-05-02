//
//  BotHubRequest.swift
//  Books
//
//  Created by Иван Семенов on 28.04.2025.
//

import Foundation

struct BotHubRequest: Encodable {
    let model: String
    let messages: [Message]
}

struct Message: Codable {
    let role: String
    let content: String
}

struct ChatResponse: Decodable {
    let choices: [ChatResponseChoice]
}

struct ChatResponseChoice: Decodable {
    let message: Message
}
