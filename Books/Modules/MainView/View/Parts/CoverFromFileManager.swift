//
//  CoverFromFileManager.swift
//  Books
//
//  Created by Иван Семенов on 02.05.2025.
//

import SwiftUI

struct CoverFromFileManager: View {
    var book: Book
    
    var body: some View {
        if let image = Image.from(folderName: book.id,
                                  fileName: "cover.jpeg") {
            image
                .resizable()
                .frame(width: 143, height: 212)
                .clipShape(.rect(cornerRadius: 5))
            
        } else {
            Image(.cover)
                .resizable()
                .frame(width: 143, height: 212)
                .clipShape(.rect(cornerRadius: 5))
        }
    }
}
