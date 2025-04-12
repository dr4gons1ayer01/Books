//
//  RegistrationViewPresenter.swift
//  Books
//
//  Created by Иван Семенов on 12.04.2025.
//

import Foundation

protocol RegistrationViewPresenterProtocol: AnyObject {
    
}

class RegistrationViewPresenter: RegistrationViewPresenterProtocol {
    
    weak var view: (any RegistrationViewProtocol)?
    
    init(view: any RegistrationViewProtocol) {
        self.view = view
    }
    
}
