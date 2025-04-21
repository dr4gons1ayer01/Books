//
//  CommentView.swift
//  Books
//
//  Created by Иван Семенов on 21.04.2025.
//

import SwiftUI

struct CommentView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("13.01.25")
                .font(type: .medium, size: 12)
                .foregroundStyle(.white)
            Text("Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
                .font(type: .medium, size: 13)
                .foregroundStyle(.appGrey)
        }
        .padding(.vertical, 12)
        .padding(.horizontal, 21)
        .background(.appDark)
    }
}
