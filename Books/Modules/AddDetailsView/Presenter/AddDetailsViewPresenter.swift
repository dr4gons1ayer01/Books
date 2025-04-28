//
//  AddDetailsViewPresenter.swift
//  Books
//
//  Created by Иван Семенов on 21.04.2025.
//

import Foundation

protocol AddDetailsViewPresenterProtocol: AnyObject {
    var book: BookModelItem { get }
    var viewModel: AddDetailsViewModel { get set }
    func createBookDescription()
}

class AddDetailsViewPresenter:  AddDetailsViewPresenterProtocol {
    weak var view: (any AddDetailsViewProtocol)?
    var book: BookModelItem
    var viewModel = AddDetailsViewModel()
    private let manager = AddDetailsNetworkManager()
    
    init(view: any AddDetailsViewProtocol, book: BookModelItem) {
        self.view = view
        self.book = book
    }
    func createBookDescription() {
        manager.sendRequest(bookName: book.title ?? "") { [weak self] description in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.viewModel.bookDescription = description
            }
        }
    }
}
