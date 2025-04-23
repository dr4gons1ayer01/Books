//
//  AddBookView.swift
//  Books
//
//  Created by Иван Семенов on 21.04.2025.
//

import UIKit
import SwiftUI

protocol AddBookViewProtocol: BaseViewProtocol {
    
}

class AddBookView: UIViewController, AddBookViewProtocol {
    typealias PresenterType = AddBookViewPresenterProtocol
    var presenter: PresenterType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let contentView = AddBookViewContent() { direction in
            switch direction {
            case .forward:
                let vc = Builder.createBookListView()
                self.navigationController?.pushViewController(vc, animated: true)
            case .back:
                self.navigationController?.popViewController(animated: true)
            }
        }
        
        let content = UIHostingController(rootView: contentView)
        addChild(content)
        content.view.frame = view.frame
        view.addSubview(content.view)
        content.didMove(toParent: self)
    }
}
