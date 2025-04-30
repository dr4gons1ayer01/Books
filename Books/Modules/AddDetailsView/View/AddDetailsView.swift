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
    func saveBook(imageType: ImageType, bookName: String, authorName: String, bookDescription: String)
    func back()
    func createText()
}

class AddDetailsView: UIViewController, AddDetailsViewProtocol, AddDetailsViewDelegate {
    typealias PresenterType = AddDetailsViewPresenterProtocol
    var presenter: PresenterType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let book = presenter?.book else { return }
        guard let viewModel = presenter?.viewModel else { return }
        
        let contentView = AddDetailsViewContent(book: book, delegate: self, viewModel: viewModel)
        
        let content = UIHostingController(rootView: contentView)
        addChild(content)
        content.view.frame = view.frame
        view.addSubview(content.view)
        content.didMove(toParent: self)
    }
    
    func saveBook(imageType: ImageType, bookName: String, authorName: String, bookDescription: String) {
        presenter?.createBook(imageType: imageType,
                              bookName: bookName,
                              authorName: authorName,
                              bookDescription: bookDescription)
    }
    func back() {
        navigationController?.popViewController(animated: true)
    }
    func createText() {
        //presenter?.viewModel.bookDescription = "qwerty"
        presenter?.createBookDescription()
    }
}
