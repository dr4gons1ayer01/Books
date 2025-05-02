//
//  SaveError.swift
//  Books
//
//  Created by Иван Семенов on 01.05.2025.
//

import Foundation

enum SaveError: Error {
    case missingCover
    case missingData
    case networkError
}
