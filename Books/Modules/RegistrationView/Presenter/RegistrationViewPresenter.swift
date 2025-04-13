//
//  RegistrationViewPresenter.swift
//  Books
//
//  Created by Иван Семенов on 12.04.2025.
//

import Foundation

protocol RegistrationViewPresenterProtocol: AnyObject {
    func checkName(name: String)
}

class RegistrationViewPresenter: RegistrationViewPresenterProtocol {
    
    weak var view: (any RegistrationViewProtocol)?
    
    init(view: any RegistrationViewProtocol) {
        self.view = view
    }
    
    func checkName(name: String) {
        if name.count >= 2 {
//            UserDefaults.standard.set(name, forKey: "name")
            NotificationCenter.default.post(name: .windowManager,
                                            object: nil,
                                            userInfo: [String.windowInfo : WindowCase.onboarding])
        } else {
            //todo alert
            print("Error name")
        }
    }
    
}
