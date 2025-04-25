//
//  AddBookViewContent.swift
//  Books
//
//  Created by Иван Семенов on 21.04.2025.
//

import SwiftUI

enum NavDirection {
    case forward(String)
    case back
}

struct AddBookViewContent: View {
    @State private var bookName = ""
    var completion: (NavDirection) -> Void
    
    var body: some View {
        VStack {
            NavHeader(title: "Добавить книгу") {
                ///nav back
                completion(.back)
            }
            Spacer()
            BaseTextView(placeholder: "название книги", text: $bookName)
            Spacer()
            OrangeButton(title: "Далее") {
                ///request with bookName
                completion(.forward(bookName))
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .padding(.horizontal, 30)
        .background(.bgMain)
    }
}
