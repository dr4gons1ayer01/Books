//
//  AddBookView.swift
//  Books
//
//  Created by Иван Семенов on 21.04.2025.
//

import UIKit
import SwiftUI

protocol AddBookViewProtocol: BaseViewProtocol {
    func moveToListView(books: [BookModelItem])
}

class AddBookView: UIViewController, AddBookViewProtocol {
    typealias PresenterType = AddBookViewPresenterProtocol
    var presenter: PresenterType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let contentView = AddBookViewContent() { [weak self] direction in
            guard let self = self else { return }
            switch direction {
            case .forward(let book):
                // -> send request
                if book.count > 2 {
                    self.presenter?.searchBook(by: book)
                }
            case .back:
                navigationController?.popViewController(animated: true)
            }
        }
        
        let content = UIHostingController(rootView: contentView)
        addChild(content)
        content.view.frame = view.frame
        view.addSubview(content.view)
        content.didMove(toParent: self)
    }
    
    func moveToListView(books: [BookModelItem]) {
        let vc = Builder.createBookListView(books: books)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
