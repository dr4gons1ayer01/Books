//
//  MainViewContent.swift
//  Books
//
//  Created by Иван Семенов on 15.04.2025.
//

import SwiftUI

enum SelectedCategory {
    case willRead
    case didRead
}

struct MainViewContent: View {
    @State private var searchField = ""
    @State private var selectedCategory: SelectedCategory = .willRead
    
    var name: String
    var readingBooks: [Book]
    var unreadBooks: [Book]
    var willReadBooks: [Book]
    var completion: () -> Void
    
    var body: some View {
        ZStack(alignment: .top) {
            //MARK: Header
            VStack(alignment: .leading) {
                HStack {
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Добрый день")
                            .font(size: 14)
                        Text(name)
                            .font(type: .black, size: 16)
                    }
                    .foregroundStyle(.white)
                    Spacer()
                    Button {
                        completion()
                    } label: {
                        HStack(spacing: 10) {
                            Image(systemName: "book.closed")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 14, height: 14)
                            Text("Добавить")
                                .font(size: 14)
                        }
                    }
                    .padding(.vertical, 7)
                    .padding(.horizontal, 14)
                    .background(.appOrange)
                    .clipShape(Capsule())
                    .foregroundStyle(.white)
                    
                }
            }
            .padding(.horizontal, 30)
            .zIndex(9)
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    //MARK: Read
                    VStack(alignment: .leading, spacing: 26) {
                        BaseTextView(placeholder: "Поиск", text: $searchField)
                            .padding(.horizontal, 30)
                        VStack(alignment: .leading, spacing: 18) {
                            Text("Читаю")
                                .font(type: .bold, size: 22)
                                .foregroundStyle(.white)
                                .padding(.horizontal, 30)
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 20) {
                                    ForEach(readingBooks) { book in
                                        Button {
                                            //action
                                        } label: {
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
                                }
                                .padding(.horizontal, 30)
                            }
                        }
                    }
                    
                    //MARK: Will/Did Read
                    VStack(alignment: .leading) {
                        HStack(alignment: .bottom, spacing: 26) {
                            Button {
                                selectedCategory = .willRead
                            } label: {
                                createButtonText(text: "Прочитать", category: .willRead)
                            }
                            Button {
                                selectedCategory = .didRead
                            } label: {
                                createButtonText(text: "Прочитал", category: .didRead)
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        if selectedCategory == .willRead {
                            VStack(spacing: 20) {
                                BookItem()
                                BookItem()
                            }
                        } else {
                            VStack(spacing: 20) {
                                BookItem()
                                BookItem()
                                BookItem()
                                BookItem()
                            }
                        }
                    }
                    .padding(.horizontal, 30)
                }
            }
            //.ignoresSafeArea()
            .padding(.top, 70)
            .background(.bgMain)
        }
    }
    @ViewBuilder
    func createButtonText(text: String, category: SelectedCategory) -> some View {
        var condition = selectedCategory == category
        
        Text(text)
            .font(type: condition ? .black : .bold, size: condition ? 22 : 20)
            .foregroundStyle(condition ? .white : .appGrey)
    }
}
