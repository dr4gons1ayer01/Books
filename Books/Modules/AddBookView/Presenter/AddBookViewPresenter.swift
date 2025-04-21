//
//  AddBookViewPresenter.swift
//  Books
//
//  Created by Иван Семенов on 21.04.2025.
//

import Foundation

protocol AddBookViewPresenterProtocol: AnyObject {
    
}

class AddBookViewPresenter: AddBookViewPresenterProtocol {
    weak var view: (any AddBookViewProtocol)?
    
    init(view: any AddBookViewProtocol) {
        self.view = view
    }
}
