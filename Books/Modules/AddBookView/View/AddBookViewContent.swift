//
//  AddBookViewContent.swift
//  Books
//
//  Created by Иван Семенов on 21.04.2025.
//

import SwiftUI

struct AddBookViewContent: View {
    @State private var bookName = ""
    
    var body: some View {
        VStack {
            NavHeader(title: "Добавить книгу") {
                //action
                
            }
            Spacer()
            BaseTextView(placeholder: "название книги", text: $bookName)
            Spacer()
            OrangeButton(title: "Далее") {
                //action
                
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .padding(.horizontal, 30)
        .background(.bgMain)
    }
}

#Preview {
    AddBookViewContent()
}
