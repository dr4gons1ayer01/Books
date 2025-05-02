//
//  AddBookModel.swift
//  Books
//
//  Created by Иван Семенов on 24.04.2025.
//

import Foundation

struct BookModel: Decodable, Hashable {
    let docs: [BookModelItem]
}

struct BookModelItem: Decodable, Hashable {
    let author_name: [String]?
    let cover_i: Int?
    let title: String?
}
