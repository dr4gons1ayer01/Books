//
//  RegistrationViewContent.swift
//  Books
//
//  Created by Иван Семенов on 12.04.2025.
//

import SwiftUI

struct RegistrationViewContent: View {
    @State var nameField = ""
    var buttonAction: (String) -> Void
    var body: some View {
        ZStack {
            VStack {
               Text("Добро пожаловать")
                    .font(type: .black, size: 22)
                    .foregroundStyle(.white)
                Spacer()
                TextField("Ваше имя", text: $nameField)
                    .font(type: .medium, size: 16)
                    .frame(maxWidth: .infinity)
                    .frame(height: 52)
                    .padding(.horizontal, 10)
                    .background(.appDark)
                    .foregroundStyle(.white)
                    .clipShape(.rect(cornerRadius: 10))
                Spacer()
                Button {
                    buttonAction(nameField)
                } label: {
                    Text("Далее")
                        .font(type: .medium, size: 16)
                        .padding(.vertical, 19)
                        .frame(maxWidth: .infinity)
                        .background(.appOrange)
                        .foregroundStyle(.white)
                        .clipShape(.rect(cornerRadius: 10))
                }
            }
            .padding(.horizontal, 30)
        }
        .background(.bgMain)
    }
}
