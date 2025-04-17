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
                BaseTextView(placeholder: "Ваше имя", text: $nameField)
                Spacer()
                OrangeButton(title: "Далее") {
                    buttonAction(nameField)
                }
            }
            .padding(.horizontal, 30)
        }
        .background(.bgMain)
    }
}
