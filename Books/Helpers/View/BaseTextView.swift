//
//  BaseTextView.swift
//  Books
//
//  Created by Иван Семенов on 16.04.2025.
//

import SwiftUI

struct BaseTextView: View {
    var placeholder: String
    @Binding var text: String
    
    var body: some View {
        TextField(placeholder, text: $text)
            .font(type: .medium, size: 16)
            .frame(maxWidth: .infinity)
            .frame(height: 52)
            .padding(.horizontal, 10)
            .background(.appDark)
            .foregroundStyle(.white)
            .clipShape(.rect(cornerRadius: 10))
    }
}
