//
//  AddDetailsViewPresenter.swift
//  Books
//
//  Created by Иван Семенов on 21.04.2025.
//

import Foundation

protocol AddDetailsViewPresenterProtocol: AnyObject {
    
}

class AddDetailsViewPresenter:  AddDetailsViewPresenterProtocol {
    weak var view: (any AddDetailsViewProtocol)?
    
    init(view: any AddDetailsViewProtocol) {
        self.view = view
    }
}
