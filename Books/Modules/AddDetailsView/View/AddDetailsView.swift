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

protocol AddDetailsViewDelegate {
    func saveBook()
    func back()
    func createText()
}

class AddDetailsView: UIViewController, AddDetailsViewProtocol, AddDetailsViewDelegate {
    typealias PresenterType = AddDetailsViewPresenterProtocol
    var presenter: PresenterType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let book = presenter?.book else { return }
        let contentView = AddDetailsViewContent(book: book, delegate: self)
        
        let content = UIHostingController(rootView: contentView)
        addChild(content)
        content.view.frame = view.frame
        view.addSubview(content.view)
        content.didMove(toParent: self)
    }
    
    func saveBook() {
        print("Добавить/Save")
    }
    func back() {
        navigationController?.popViewController(animated: true)
    }
    func createText() {
        presenter?.createBookDescription()
    }
}
