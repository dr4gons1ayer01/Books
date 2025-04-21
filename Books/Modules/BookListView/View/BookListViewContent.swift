//
//  BookListViewContent.swift
//  Books
//
//  Created by Иван Семенов on 21.04.2025.
//

import SwiftUI

struct BookListViewContent: View {
    var body: some View {
        ZStack(alignment: .top) {
            NavHeader(title: "Мартин Иден") {
                
            }
            
            ScrollView {
                VStack(alignment: .leading, spacing: 30) {
                    Text("Результаты поиска")
                        .foregroundStyle(.white)
                        .font(type: .regular, size: 14)
                        .padding(.horizontal, 21)
                    VStack(alignment: .leading, spacing: 23) {
                        
                        BookListItem {
                            
                        }
                        BookListItem {
                            
                        }
                        BookListItem {
                            
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

#Preview {
    BookListViewContent()
}

struct BookListItem: View {
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            HStack(alignment: .top, spacing: 13) {
                Image(.cover)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 120)
                    .clipShape(.rect(cornerRadius: 8))
                VStack(alignment: .leading) {
                    Text("Мартин Иден")
                        .foregroundStyle(.white)
                        .font(type: .black, size: 16)
                    Text("Джек Лондон")
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
