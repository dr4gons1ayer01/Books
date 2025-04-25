//
//  BookListViewPresenter.swift
//  Books
//
//  Created by Иван Семенов on 21.04.2025.
//

import Foundation

protocol BookListViewPresenterProtocol: AnyObject {
    var bookList: [BookModelItem]? { get }
}

class BookListViewPresenter: BookListViewPresenterProtocol {
    weak var view: (any BookListViewProtocol)?
    var bookList: [BookModelItem]?
    
    init(view: any BookListViewProtocol, bookList: [BookModelItem]?) {
        self.view = view
        self.bookList = bookList
    }
}
