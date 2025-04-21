//
//  BookStatusButton.swift
//  Books
//
//  Created by Иван Семенов on 19.04.2025.
//

import SwiftUI

struct BookStatusButton: View {
    var status: BookStatus
    var action: () -> Void
    private var buttonText: String
    
    init(status: BookStatus, action: @escaping () -> Void) {
        self.status = status
        self.action = action
        
        switch status {
        case .read:
            self.buttonText = "Читаю"
        case .willRead:
            self.buttonText = "Прочитать"
        case .didRead:
            self.buttonText = "Прочитал"
        }
    }
    
    var body: some View {
        Button {
            //action
            action()
        } label: {
            Text(buttonText)
                .padding(.vertical, 3)
                .padding(.horizontal, 18)
                .font(type: .bold, size: 14)
                .foregroundStyle(.white)
                .background(getButtonColor())
                .clipShape(Capsule())
        }
    }
    
    private func getButtonColor() -> Color {
        switch status {
        case .read:
            return Color(.statusOne)
        case .willRead:
            return Color(.statusTwo)
        case .didRead:
            return Color(.statusThree)
        }
    }
}
