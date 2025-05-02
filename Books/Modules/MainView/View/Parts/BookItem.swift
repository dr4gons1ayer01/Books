//
//  BookItem.swift
//  Books
//
//  Created by Иван Семенов on 23.04.2025.
//

import SwiftUI

struct BookItem: View {
    //var book: Book
    var body: some View {
        HStack(spacing: 13) {
            Image(.cover)
                .resizable()
                .frame(width: 64, height: 94)
                .clipShape(.rect(cornerRadius: 3))
            VStack(alignment: .leading, spacing: 9) {
                VStack(alignment: .leading) {
                    Text("Война и мир")
                        .font(type: .bold, size: 14)
                    Text("Лев Толстой")
                        .font(type: .medium, size: 12)
                        .foregroundStyle(.appGrey)
                }
                Text("Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor ...")
                    .font(type: .medium, size: 14)
            }
            .foregroundStyle(.white)
        }
    }
}
