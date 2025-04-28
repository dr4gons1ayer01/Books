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
    var completion: (BookModelItem?) -> Void
    
    var body: some View {
        ZStack(alignment: .top) {
            NavHeader(title: books.first?.title ?? "-") {
                /// nav back
                completion(nil)
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
                                ///nav -> AddDetailsView
                                completion(book)
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
