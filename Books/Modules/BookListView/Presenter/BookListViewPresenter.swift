//
//  BookListViewPresenter.swift
//  Books
//
//  Created by Иван Семенов on 21.04.2025.
//

import Foundation

protocol BookListViewPresenterProtocol: AnyObject {
    
}

class BookListViewPresenter: BookListViewPresenterProtocol {
    weak var view: (any BookListViewProtocol)?
    
    init(view: any BookListViewProtocol) {
        self.view = view
    }
}
