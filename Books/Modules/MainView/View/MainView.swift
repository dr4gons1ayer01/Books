//
//  MainView.swift
//  Books
//
//  Created by Иван Семенов on 15.04.2025.
//

import UIKit
import SwiftUI

protocol MainViewProtocol: BaseViewProtocol {
    
}

class MainView: UIViewController, MainViewProtocol {
    typealias PresenterType = MainViewPresenterProtocol
    var presenter: PresenterType?
    var viewModel = MainViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let contentView = MainViewContent(viewModel: viewModel, name: presenter?.name ?? "") {
            self.navToVC(book: nil)
        }
        
        let content = UIHostingController(rootView: contentView)
        addChild(content)
        content.view.frame = view.frame
        view.addSubview(content.view)
        content.didMove(toParent: self)
        
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        presenter?.fetch()
        viewModel.readingBooks = presenter?.readingBooks ?? []
        viewModel.unreadBooks = presenter?.unreadBooks ?? []
        viewModel.willReadBooks = presenter?.willReadBooks ?? []
    }
    
    private func navToVC(book: Book?) {
        if let book {
            // -> bookDetails
            
        } else {
            // -> addBook
            let vc = Builder.createAddBookView()
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

