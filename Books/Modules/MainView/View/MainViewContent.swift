//
//  MainViewContent.swift
//  Books
//
//  Created by Иван Семенов on 15.04.2025.
//

import SwiftUI

struct MainViewContent: View {
    @State var searchField = ""
    //var books: [Book]
    var name: String
    
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
                        //action
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
                                    Button {
                                       //action
                                    } label: {
                                        Image(.cover)
                                            .resizable()
                                            .frame(width: 143, height: 212)
                                            .clipShape(.rect(cornerRadius: 5))
                                    }
                                    Button {
                                       //action
                                    } label: {
                                        Image(.cover)
                                            .resizable()
                                            .frame(width: 143, height: 212)
                                            .clipShape(.rect(cornerRadius: 5))
                                    }
                                    Button {
                                       //action
                                    } label: {
                                        Image(.cover)
                                            .resizable()
                                            .frame(width: 143, height: 212)
                                            .clipShape(.rect(cornerRadius: 5))
                                    }
                                }
                                .padding(.horizontal, 30)
                            }
                        }
                    }
                    
                    
                }
            }
            //.ignoresSafeArea()
            .padding(.top, 70)
            .background(.bgMain)
        }
    }
}

#Preview {
    MainViewContent(name: "Ivan Semenov")
}
