//
//  NavHeader.swift
//  Books
//
//  Created by Иван Семенов on 21.04.2025.
//

import SwiftUI

struct NavHeader: View {
    var title: String
    var action: () -> Void
    
    var body: some View {
        HStack {
            ///'backButton' back
            Button {
                action()
            } label: {
                Image(systemName: "arrow.backward")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
            }
            Spacer()
            Text(title)
                .font(type: .black, size: 22)
            Spacer()
            ///Rectangle - чтобы по центру было
            Rectangle()
                .opacity(0)
                .frame(width: 20, height: 20)
        }
        .foregroundStyle(.white)
    }
}
