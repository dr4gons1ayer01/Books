//
//  AddDetailsView.swift
//  Books
//
//  Created by Иван Семенов on 21.04.2025.
//

import UIKit
import SwiftUI

protocol AddDetailsViewProtocol: BaseViewProtocol {
    
}

class AddDetailsView: UIViewController, AddDetailsViewProtocol {
    typealias PresenterType = AddDetailsViewPresenterProtocol
    var presenter: PresenterType?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let contentView = AddDetailsViewContent()
        
        let content = UIHostingController(rootView: contentView)
        addChild(content)
        content.view.frame = view.frame
        view.addSubview(content.view)
        content.didMove(toParent: self)
    }
}
