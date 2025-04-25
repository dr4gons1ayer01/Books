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
        
        guard let book = presenter?.book else { return }
        let contentView = AddDetailsViewContent(book: book) { [weak self] state in
            guard let self = self else { return }
            switch state {
            case .back:
                navigationController?.popViewController(animated: true)
            case .save:
                //todo 
                print("Добавить")
            }
        }
        
        let content = UIHostingController(rootView: contentView)
        addChild(content)
        content.view.frame = view.frame
        view.addSubview(content.view)
        content.didMove(toParent: self)
    }
}
