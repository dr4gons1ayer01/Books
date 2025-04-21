//
//  StorageManager.swift
//  Books
//
//  Created by Иван Семенов on 15.04.2025.
//

import Foundation

final class StorageManager {
    
    private var path = FileManager.default.urls(for: .documentDirectory, in: .allDomainsMask)[0]
    
    //MARK: Save cover
    ///'saveCover' - func to save cover
    ///'cover.jpeg' - standard cover title
    func saveCover(bookId: String, cover: Data) {
        let bookPath = path.appending(component: bookId)
        try? FileManager.default.createDirectory(at: bookPath, withIntermediateDirectories: true)
        let coverPath = bookPath.appending(component: "cover.jpeg")
        do {
            try cover.write(to: coverPath)
        } catch {
            print("Error saved cover: \(error.localizedDescription)")
        }
    }
    ///'getCover' - func to get cover
    func getCover(bookId: String) -> Data? {
        let coverPath = path
            .appending(component: bookId)
            .appending(component: "cover.jpeg")
        do {
            let coverData = try Data(contentsOf: coverPath)
            return coverData
        } catch {
            print("Error get coverData: \(error.localizedDescription)")
            return nil
        }
    }
}
