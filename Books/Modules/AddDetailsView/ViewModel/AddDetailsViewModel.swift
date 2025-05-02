//
//  AddDetailsViewModel.swift
//  Books
//
//  Created by Иван Семенов on 28.04.2025.
//

import Foundation

class AddDetailsViewModel: ObservableObject {
    @Published var bookDescription: String = ""
    @Published var isAddError: Bool = false
}
