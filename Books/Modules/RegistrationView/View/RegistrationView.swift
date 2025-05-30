//
//  RegistrationView.swift
//  Books
//
//  Created by Иван Семенов on 12.04.2025.
//

import UIKit
import SwiftUI

protocol RegistrationViewProtocol: BaseViewProtocol {
    
}

class RegistrationView: UIViewController, RegistrationViewProtocol {
    typealias PresenterType = RegistrationViewPresenterProtocol
    var presenter: PresenterType?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let contentView = RegistrationViewContent { [weak self] in
            guard let self = self else { return }
            presenter?.checkName(name: $0)
        }
        
        let content = UIHostingController(rootView: contentView)
        addChild(content)
        content.view.frame = view.frame
        view.addSubview(content.view)
        content.didMove(toParent: self)
    }
}
