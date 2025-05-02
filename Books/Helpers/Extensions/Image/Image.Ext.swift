//
//  Image.Ext.swift
//  Books
//
//  Created by Иван Семенов on 02.05.2025.
//

import SwiftUI

extension Image {
    //id -> folder
    //cover.jpeg
    static func from(folderName: String, fileName: String) -> Image? {
        let fileManager = FileManager.default
        guard let directory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else {
            return nil
        }
        let fileUrl = directory.appendingPathComponent(folderName).appendingPathComponent(fileName)
        
        guard fileManager.fileExists(atPath: fileUrl.path),
              let uiImage = UIImage(contentsOfFile: fileUrl.path) else {
            return nil
        }
        return Image(uiImage: uiImage)
    }
}
