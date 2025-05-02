//
//  MainViewModel.swift
//  Books
//
//  Created by Иван Семенов on 02.05.2025.
//

import SwiftUI

class MainViewModel: ObservableObject {
    @Published var readingBooks: [Book] = []
    @Published var unreadBooks: [Book] = []
    @Published var willReadBooks: [Book] = []
}
