//
//  CustomFont.swift
//  Books
//
//  Created by Иван Семенов on 12.04.2025.
//

import SwiftUI

struct CustomFont: ViewModifier {
    var font: FontType
    var size: CGFloat
    
    func body(content: Content) -> some View {
        content
            .font(.custom(font.rawValue, size: size))
    }
}
