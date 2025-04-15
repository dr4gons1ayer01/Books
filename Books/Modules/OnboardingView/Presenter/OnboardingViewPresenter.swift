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
        //save state
        UserDefaults.standard.set(WindowCase.main.rawValue, forKey: "state")
        NotificationCenter.default.post(name: .windowManager, object: nil, userInfo: [String.windowInfo : WindowCase.main])
    }
}
