//
//  BookListViewContent.swift
//  Books
//
//  Created by Иван Семенов on 21.04.2025.
//

import SwiftUI
import SDWebImageSwiftUI

struct BookListViewContent: View {
    let books: [BookModelItem]
    
    var body: some View {
        ZStack(alignment: .top) {
            NavHeader(title: books.first?.title ?? "-") {
                
            }
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 30) {
                    Text("Результаты поиска")
                        .foregroundStyle(.white)
                        .font(type: .regular, size: 14)
                        .padding(.horizontal, 21)
                    VStack(alignment: .leading, spacing: 23) {
                        ForEach(books, id: \.self) { book in
                            BookListItem(book: book) {
                                //action
                                
                            }
                        }
                    }
                }
            }
            .padding(.top, 44)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.horizontal, 30)
        .background(.bgMain)
    }
}

struct BookListItem: View {
    var book: BookModelItem
    var completion: () -> Void
    
    var body: some View {
        Button {
            completion()
        } label: {
            HStack(alignment: .top, spacing: 13) {
                ///book Image
                BookCover(coverId: book.cover_i?.description)
                
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

struct BookCover: View {
    var coverId: String?
    
    var body: some View {
        if let coverId, let url = URL(string: "https://covers.openlibrary.org/b/id/\(coverId)-M.jpg") {
            WebImage(url: url)
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 120)
                .clipShape(.rect(cornerRadius: 8))
        } else {
            Image(.cover)
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 120)
                .clipShape(.rect(cornerRadius: 8))
        }
    }
}
