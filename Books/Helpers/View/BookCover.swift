//
//  BookCover.swift
//  Books
//
//  Created by Иван Семенов on 28.04.2025.
//

import SwiftUI
import SDWebImageSwiftUI

enum ImageType {
    case local(UIImage)
    case network(String?)
}

struct BookCover2: View {
    var image: ImageType
    
    var body: some View {
        switch image {
        case .local(let uIImage):
            Image(uiImage: uIImage)
                .resizable()
                .scaledToFill()
                .clipShape(.rect(cornerRadius: 8))
        case .network(let string):
            if let string, let url = URL(string: "https://covers.openlibrary.org/b/id/\(string)-M.jpg") {
                WebImage(url: url)
                    .resizable()
                    .scaledToFit()
                    .clipShape(.rect(cornerRadius: 8))
            } else {
                Image(.cover)
                    .resizable()
                    .scaledToFit()
                    .clipShape(.rect(cornerRadius: 8))
            }
        }
    }
}

struct BookCover: View {
    var coverId: String?
    
    var body: some View {
        if let coverId, let url = URL(string: "https://covers.openlibrary.org/b/id/\(coverId)-M.jpg") {
            WebImage(url: url)
                .resizable()
                .scaledToFill()
                .clipShape(.rect(cornerRadius: 8))
        } else {
            Image(.cover)
                .resizable()
                .scaledToFill()
                .clipShape(.rect(cornerRadius: 8))
        }
    }
}
