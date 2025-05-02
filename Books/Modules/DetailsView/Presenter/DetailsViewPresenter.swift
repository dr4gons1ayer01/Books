//
//  DetailsViewPresenter.swift
//  Books
//
//  Created by Иван Семенов on 18.04.2025.
//

import Foundation

protocol DetailsViewPresenterProtocol: AnyObject {
    var book: Book { get }
}

class DetailsViewPresenter: DetailsViewPresenterProtocol {
    
    weak var view: (any DetailsViewProtocol)?
    var book: Book
    
    init(view: any DetailsViewProtocol, book: Book) {
        self.view = view
        self.book = book
    }
}
