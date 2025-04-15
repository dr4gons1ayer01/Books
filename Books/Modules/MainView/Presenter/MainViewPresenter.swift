//
//  MainViewPresenter.swift
//  Books
//
//  Created by Иван Семенов on 15.04.2025.
//

import Foundation

protocol MainViewPresenterProtocol: AnyObject {
    
}

class MainViewPresenter: MainViewPresenterProtocol {
    
    weak var view: (any MainViewProtocol)?
    
    init(view: any MainViewProtocol) {
        self.view = view
    }
}
