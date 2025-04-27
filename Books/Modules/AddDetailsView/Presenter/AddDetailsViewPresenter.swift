//
//  AddDetailsViewPresenter.swift
//  Books
//
//  Created by Иван Семенов on 21.04.2025.
//

import Foundation

protocol AddDetailsViewPresenterProtocol: AnyObject {
    var book: BookModelItem { get }
    func createBookDescription()
}

class AddDetailsViewPresenter:  AddDetailsViewPresenterProtocol {
    weak var view: (any AddDetailsViewProtocol)?
    var book: BookModelItem
    private let manager = AddDetailsNetworkManager()
    
    init(view: any AddDetailsViewProtocol, book: BookModelItem) {
        self.view = view
        self.book = book
    }
    func createBookDescription() {
        manager.sendRequest(bookName: book.title ?? "")
    }
}
