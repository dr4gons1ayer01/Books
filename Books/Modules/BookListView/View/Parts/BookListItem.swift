//
//  BookListItem.swift
//  Books
//
//  Created by Иван Семенов on 28.04.2025.
//

import SwiftUI

struct BookListItem: View {
    var book: BookModelItem
    var completion: () -> Void
    
    var body: some View {
        Button {
            completion()
        } label: {
            HStack(alignment: .top, spacing: 13) {
                ///book Image
                BookCover(coverId: book.cover_i?.description,
                          size: CGSize(width: 80, height: 120))
                
                VStack(alignment: .leading) {
                    Text(book.title ?? "no title")
                        .foregroundStyle(.white)
                        .font(type: .black, size: 16)
                    Text(book.author_name?.first ?? "no author")
                        .foregroundStyle(.appGrey)
                        .font(type: .medium, size: 14)
                }
                .padding(.top, 10)
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundStyle(.white)
                    .padding(.top, 10)
            }
        }
    }
}
