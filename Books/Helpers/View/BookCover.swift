//
//  BookCover.swift
//  Books
//
//  Created by Иван Семенов on 28.04.2025.
//

import SwiftUI
import SDWebImageSwiftUI

struct BookCover: View {
    var coverId: String?
    let size: CGSize
    
    var body: some View {
        if let coverId, let url = URL(string: "https://covers.openlibrary.org/b/id/\(coverId)-M.jpg") {
            WebImage(url: url)
                .resizable()
                .scaledToFit()
                .frame(width: size.width, height: size.height)
                .clipShape(.rect(cornerRadius: 8))
        } else {
            Image(.cover)
                .resizable()
                .scaledToFit()
                .frame(width: size.width, height: size.height)
                .clipShape(.rect(cornerRadius: 8))
        }
    }
}
