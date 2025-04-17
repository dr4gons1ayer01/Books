//
//  MainViewPresenter.swift
//  Books
//
//  Created by Иван Семенов on 15.04.2025.
//

import Foundation

protocol MainViewPresenterProtocol: AnyObject {
    var name: String { get }
}

class MainViewPresenter: MainViewPresenterProtocol {
        
    weak var view: (any MainViewProtocol)?
    var name: String
    
    init(view: any MainViewProtocol) {
        self.view = view
        self.name = UserDefaults.standard.string(forKey: "name") ?? ""
    }
}
