//
//  BookNetworkManager.swift
//  Books
//
//  Created by Иван Семенов on 24.04.2025.
//

import Foundation

class BookNetworkManager {
    let url = "https://openlibrary.org/search.json"
    
    ///https://openlibrary.org/search.json
    ///?q=\(query)"
    ///&fields=title,author_name,cover_i,subtitle,first_publish_year
    ///&lang=ru
    
    func searchBookRequest(q: String, completion: @escaping (Result<[BookModelItem], Error>) -> Void) {
        var urlComponent = URLComponents(string: url)
        urlComponent?.queryItems = [
            URLQueryItem(name: "q", value: q),
            URLQueryItem(name: "fields", value: "title,author_name,cover_i,subtitle,first_publish_year"),
            URLQueryItem(name: "lang", value: "ru"),
        ]
        guard let url = urlComponent?.url else { return }
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, _, error in
            guard error == nil else {
                print(error!.localizedDescription)
                completion(.failure(error!))
                return
            }
            guard let data else {
                return
            }
            do {
                let books = try JSONDecoder().decode(BookModel.self, from: data)
                completion(.success(books.docs))
            } catch {
                print(error.localizedDescription)
                completion(.failure(error))
            }
            //print(String(decoding: data, as: UTF8.self))
        }.resume()
    }
}
