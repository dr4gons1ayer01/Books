//
//  DetailsViewPresenter.swift
//  Books
//
//  Created by Иван Семенов on 18.04.2025.
//

import Foundation

protocol DetailsViewPresenterProtocol: AnyObject {
    
}

class DetailsViewPresenter: DetailsViewPresenterProtocol {
    
    weak var view: (any DetailsViewProtocol)?
    
    init(view: any DetailsViewProtocol) {
        self.view = view
    }
}
