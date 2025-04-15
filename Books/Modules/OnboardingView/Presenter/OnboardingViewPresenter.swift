//
//  OnboardingViewPresenter.swift
//  Books
//
//  Created by Иван Семенов on 13.04.2025.
//

import Foundation
import UIKit

protocol OnboardingViewPresenterProtocol: AnyObject {
    var mockData: [OnboardingData] { get }
    func startApp()
}

class OnboardingViewPresenter: OnboardingViewPresenterProtocol {
    
    weak var view: (any OnboardingViewProtocol)?
    var mockData: [OnboardingData] = OnboardingData.mockData
    
    init(view: any OnboardingViewProtocol) {
        self.view = view
    }
    
    func startApp() {
        //todo: save state to UD
//        NotificationCenter.default.post(name: .windowManager, object: nil, userInfo: [String.windowInfo : WindowCase.main])
        
        //test fileManager
        let image: UIImage = .cover
        if let imageData = image.jpegData(compressionQuality: 1) {
            
            DataBaseManager.shared.createBook(name: "Мартин Иден", author: "Джек Лондон", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo", cover: imageData)
        }
    }
}
