//
//  MainViewPresenter.swift
//  Books
//
//  Created by Иван Семенов on 15.04.2025.
//

import Foundation

protocol MainViewPresenterProtocol: AnyObject {
    var name: String { get }
    var books: [Book] { get }
    
    var readingBooks: [Book] { get }
    var unreadBooks: [Book] { get }
    var willReadBooks: [Book] { get }
    func fetch()
}

class MainViewPresenter: MainViewPresenterProtocol {
    var readingBooks: [Book] = []
    var unreadBooks: [Book] = []
    var willReadBooks: [Book] = []
    
    weak var view: (any MainViewProtocol)?
    var name: String
    var books: [Book] = []
    private var bookService = DataBaseManager.shared
    
    init(view: any MainViewProtocol) {
        self.view = view
        self.name = UserDefaults.standard.string(forKey: "name") ?? ""
        fetch()
    }
    
    func setBooks(newValue: [Book]) {
        readingBooks = newValue.filter { $0.status == BookStatus.read.rawValue }
        unreadBooks = newValue.filter { $0.status == BookStatus.didRead.rawValue }
        willReadBooks = newValue.filter { $0.status == BookStatus.willRead.rawValue }
    }
    
    func fetch() {
        bookService.fetchBooks()
        setBooks(newValue: bookService.books)
    }
}
