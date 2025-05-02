//
//  AddDetailsNetworkManager.swift
//  Books
//
//  Created by Иван Семенов on 27.04.2025.
//

import Foundation

class AddDetailsNetworkManager {
    
    let url = "https://bothub.chat/api/v2/openai/v1/chat/completions"
    let token = ""
    
    func sendRequest(bookName: String, completion: @escaping (String) -> Void) {
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
            do {
                let response = try JSONDecoder().decode(ChatResponse.self, from: data)
                let description = response.choices[0].message.content
                completion(description)
            } catch {
                print("Ошибка парсинга:", error.localizedDescription)
            }
        }.resume()
    }
    
    func loadCover(url: URL, completion: @escaping (Result<Data, Error>) -> Void) {
        var request = URLRequest(url: url)
        request.addValue("image/jpeg", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil else {
                completion(.failure(SaveError.networkError))
                return
            }
            
            guard let httpResp = response as? HTTPURLResponse,
                  httpResp.statusCode == 200 else {
                completion(.failure(SaveError.missingCover))
                return
            }
            
            guard let data else {
                completion(.failure(SaveError.missingData))
                return
            }
            completion(.success(data))
        }
        .resume()
    }
}
