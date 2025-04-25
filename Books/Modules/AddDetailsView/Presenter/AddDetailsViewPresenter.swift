//
//  AddDetailsViewPresenter.swift
//  Books
//
//  Created by Иван Семенов on 21.04.2025.
//

import Foundation

protocol AddDetailsViewPresenterProtocol: AnyObject {
    var book: BookModelItem { get }
}

class AddDetailsViewPresenter:  AddDetailsViewPresenterProtocol {
    weak var view: (any AddDetailsViewProtocol)?
    var book: BookModelItem
    
    init(view: any AddDetailsViewProtocol, book: BookModelItem) {
        self.view = view
        self.book = book
    }
}
