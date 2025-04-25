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
        manager.searchBookRequest(q: title) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let books):
                DispatchQueue.main.async {
                    self.view?.moveToListView(books: books)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
