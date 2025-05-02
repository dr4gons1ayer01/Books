//
//  BookCoverForOverlay.swift
//  Books
//
//  Created by Иван Семенов on 02.05.2025.
//

import SwiftUI

struct BookCoverForOverlay: View {
    var book: Book
    
    var body: some View {
        if let cover = Image.from(folderName: book.id,
                                  fileName: "cover.jpeg") {
            cover
                .resizable()
        } else {
            Image(.cover)
                .resizable()
        }
    }
}
