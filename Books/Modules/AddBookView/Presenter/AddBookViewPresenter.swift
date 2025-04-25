//
//  AddBookViewPresenter.swift
//  Books
//
//  Created by Иван Семенов on 21.04.2025.
//

import Foundation

protocol AddBookViewPresenterProtocol: AnyObject {
    func searchBook(by title: String)
}

class AddBookViewPresenter: AddBookViewPresenterProtocol {
    weak var view: (any AddBookViewProtocol)?
    private let manager = BookNetworkManager()
    
    init(view: any AddBookViewProtocol) {
        self.view = view
    }
    
    func searchBook(by title: String) {
        manager.searchBookRequest(q: title)
    }
}
