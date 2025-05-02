//
//  BookListView.swift
//  Books
//
//  Created by Иван Семенов on 21.04.2025.
//

import UIKit
import SwiftUI

protocol BookListViewProtocol: BaseViewProtocol {
    
}

class BookListView: UIViewController, BookListViewProtocol {
    typealias PresenterType = BookListViewPresenterProtocol
    var presenter: PresenterType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let contentView = BookListViewContent(books: presenter?.bookList ?? []) { [weak self] book in
            guard let self = self else { return }
            if let book {
                let detailVC = Builder.createAddDetailView(book: book)
                navigationController?.pushViewController(detailVC, animated: true)
            } else {
                navigationController?.popViewController(animated: true)
            }
        }
        
        let content = UIHostingController(rootView: contentView)
        addChild(content)
        content.view.frame = view.frame
        view.addSubview(content.view)
        content.didMove(toParent: self)
    }
}
