//
//  DataBaseManager.swift
//  Books
//
//  Created by Иван Семенов on 14.04.2025.
//

import Foundation
import CoreData

final class DataBaseManager {
    
    static let shared = DataBaseManager()
    private let storageManager = StorageManager()
    private init() { }
    
    var books: [Book] = []
    
    //MARK: Container
    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "db")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let error = error as NSError
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
    }
}

extension DataBaseManager {
    ///CRUD
    //MARK: Book
    /// 'createBook' - func to save one book
    func createBook(name: String, author: String, description: String, cover: Data) {
        let bookId = UUID().uuidString
        let _: Book = {
            $0.id = bookId
            $0.name = name
            $0.author = author
            $0.status = BookStatus.read.rawValue
            $0.coverURL = "cover.jpeg"
            $0.bookDescription = description
            $0.date = Date()
            return $0
        }(Book(context: persistentContainer.viewContext))
        saveContext()
        storageManager.saveCover(bookId: bookId, cover: cover)
    }
    ///'fetchBooks' - func to fetch all books
    func fetchBooks() {
        let request = Book.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "date", ascending: true)]
        
        do {
            let books = try persistentContainer.viewContext.fetch(request)
            self.books = books
        } catch {
            print("Fetch error: \(error.localizedDescription)")
        }
    }
}

extension DataBaseManager {
    //MARK: Note
    ///'addNote' - func to add note
    func addNote(book: Book, noteText: String) {
        let _: Note = {
            $0.id = UUID().uuidString
            $0.date = Date()
            $0.book = book
            $0.text = noteText
            return $0
        }(Note(context: persistentContainer.viewContext))
        saveContext()
    }
}
