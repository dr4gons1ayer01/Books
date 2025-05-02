//
//  AddDetailsViewPresenter.swift
//  Books
//
//  Created by Иван Семенов on 21.04.2025.
//

import Foundation

protocol AddDetailsViewPresenterProtocol: AnyObject {
    var book: BookModelItem { get }
    var viewModel: AddDetailsViewModel { get set }
    func createBookDescription()
    func createBook(imageType: ImageType, bookName: String, authorName: String, bookDescription: String, completion: @escaping (Result<Bool, Error>) -> Void)
}

class AddDetailsViewPresenter:  AddDetailsViewPresenterProtocol {
    weak var view: (any AddDetailsViewProtocol)?
    var book: BookModelItem
    var viewModel = AddDetailsViewModel()
    private let networkManager = AddDetailsNetworkManager()
    private let dataBaseManager = DataBaseManager.shared
    
    init(view: any AddDetailsViewProtocol, book: BookModelItem) {
        self.view = view
        self.book = book
    }
    
    func createBookDescription() {
        networkManager.sendRequest(bookName: book.title ?? "") { [weak self] description in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.viewModel.bookDescription = description
            }
        }
    }
    
    func createBook(
        imageType: ImageType,
        bookName: String,
        authorName: String,
        bookDescription: String,
        completion: @escaping (Result<Bool, Error>) -> Void
    ) {
        // URL -> download -> save
        // UIImage -> save
        
        switch imageType {
        case .local(let uIImage):
            guard let data = uIImage.jpegData(compressionQuality: 1) else {
                return
            }
            dataBaseManager.createBook(name: bookName,
                                       author: authorName,
                                       description: bookDescription,
                                       cover: data)
            completion(.success(true))
        case .network(let urlString):
            if let urlString, let url = URL(string: "https://covers.openlibrary.org/b/id/\(urlString)-M.jpg") {
                networkManager.loadCover(url: url) { [weak self] result in
                    guard let self = self else { return }
                    switch result {
                    case .success(let data):
                        self.dataBaseManager.createBook(name: bookName,
                                                        author: authorName,
                                                        description: bookDescription,
                                                        cover: data)
                        completion(.success(true))
                    case .failure(let error):
                        let _ = error as? SaveError
                        DispatchQueue.main.async {
                            self.viewModel.isAddError = true
                        }
                    }
                }
            }
        }
    }
}
