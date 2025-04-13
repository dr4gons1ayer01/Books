//
//  OrangeButton.swift
//  Books
//
//  Created by Иван Семенов on 13.04.2025.
//

import SwiftUI

struct OrangeButton: View {
    var title: String
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(title)
                .font(type: .medium, size: 16)
                .padding(.vertical, 19)
                .frame(maxWidth: .infinity)
                .background(.appOrange)
                .foregroundStyle(.white)
                .clipShape(.rect(cornerRadius: 10))
        }
    }
}
