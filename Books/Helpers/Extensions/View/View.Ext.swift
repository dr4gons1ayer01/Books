//
//  View.Ext.swift
//  Books
//
//  Created by Иван Семенов on 12.04.2025.
//

import SwiftUI

extension View {
    func font(type: FontType = .regular, size: CGFloat = 14) -> some View {
        modifier(CustomFont(font: type, size: size))
    }
}
