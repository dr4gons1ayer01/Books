//
//  AddDetailsNetworkManager.swift
//  Books
//
//  Created by Иван Семенов on 27.04.2025.
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

class AddDetailsNetworkManager {
    
    let url = "https://bothub.chat/api/v2/openai/v1/chat/completions"
    let token = ""
    
    func sendRequest(bookName: String) {
        guard let url = URL(string: self.url) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let requestBodyStruct = BotHubRequest(
            model: "gpt-4o",
            messages: [
                Message(role: "user", content: "Опиши книгу \(bookName) в 2 предложения.")
            ]
        )
        
        do {
            let requestBody = try JSONEncoder().encode(requestBodyStruct)
            request.httpBody = requestBody
        } catch {
            print(error.localizedDescription)
        }
        
        URLSession.shared.dataTask(with: request) { data, _, error in
            guard error == nil else {
                print("Request error: \(error!.localizedDescription)")
                return
            }
            guard let data = data else {
                print("No data received")
                return
            }
            
            print(String(decoding: data, as: UTF8.self))
        }.resume()
    }
}
