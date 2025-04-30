//
//  AddDetailsViewContent.swift
//  Books
//
//  Created by Иван Семенов on 21.04.2025.
//

import SwiftUI
import SDWebImageSwiftUI

struct AddDetailsViewContent: View {
    @State private var bookName: String = ""
    @State private var bookCover: UIImage = .cover
    @State private var bookCoverType: ImageType
    
    @State private var isShowPlaceholder: Bool = true
    @State private var isShowPicker: Bool = false
    @ObservedObject var viewModel: AddDetailsViewModel
    
    var book: BookModelItem
    var delegate: AddDetailsViewDelegate
    
    init(book: BookModelItem, delegate: AddDetailsViewDelegate, viewModel: AddDetailsViewModel) {
        self.book = book
        self.delegate = delegate
        self.viewModel = viewModel
        self._bookName = State(initialValue: book.title ?? "")
        self._bookCoverType = State(initialValue: .network(book.cover_i?.description))
    }
    
    var body: some View {
        VStack {
            NavHeader(title: book.title ?? "-") {
                /// nav back
                delegate.back()
            }
            VStack(spacing: 80) {
                BookCover2(image: bookCoverType)
                    .frame(width: 130, height: 180)
                    .clipped()
                    .overlay(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
                        Button {
                            ///picker
                            isShowPicker.toggle()
                        } label: {
                            ZStack {
                                Circle()
                                    .foregroundStyle(.statusTwo)
                                    .frame(width: 24, height: 24)
                                Image(systemName: "arrow.triangle.2.circlepath.circle")
                                    .resizable()
                                    .frame(width: 12, height: 12)
                                    .foregroundStyle(.white)
                            }
                            .offset(x: 6, y: -6)
                        }
                        .sheet(isPresented: $isShowPicker) {
                            ImagePickerView(image: $bookCover)
                        }
                    }
                    .onChange(of: bookCover) { newValue in
                        bookCoverType = .local(newValue)
                    }
                VStack(spacing: 30) {
                    BaseTextView(placeholder: "Название", text: $bookName)
                    
                    ZStack(alignment: .topLeading) {
                        TextEditor(text: $viewModel.bookDescription)
                            .scrollContentBackground(.hidden)
                            .frame(height: 224)
                            .padding(.horizontal, 15)
                            .padding(.vertical, 10)
                            .font(size: 16)
                            .foregroundStyle(.white)
                            .background(.appDark)
                            .clipShape(.rect(cornerRadius: 10))
                            .overlay(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
                                Button {
                                    ///create AI Text
                                    delegate.createText()
                                } label: {
                                    Image(systemName: "sparkles")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 22, height: 22)
                                        .rotationEffect(.degrees(90))
                                        .foregroundStyle(.white)
                                        .padding(.trailing, 16)
                                        .padding(.top, 16)
                                        .clipped()
                                }
                            }
                            .onChange(of: viewModel.bookDescription) { oldValue, newValue in
                                if newValue.count > 0 {
                                    isShowPlaceholder = false
                                } else {
                                    isShowPlaceholder = true
                                }
                            }
                        if isShowPlaceholder {
                            Text("Описание")
                                .font(size: 16)
                                .foregroundStyle(.appGrey.opacity(0.7))
                                .offset(x: 20, y: 20)
                        }
                    }
                }
            }
            Spacer()
            OrangeButton(title: "Добавить") {
                ///save book in db
                delegate.saveBook(imageType: bookCoverType,
                                  bookName: bookName, 
                                  authorName: book.author_name?.first ?? "",
                                  bookDescription: viewModel.bookDescription)
            }
            .disabled(viewModel.bookDescription.count < 3 ? true : false)
            .opacity(viewModel.bookDescription.count < 3 ? 0.5 : 1)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: Alignment(horizontal: .leading, vertical: .top))
        .padding(.horizontal, 30)
        .background(.bgMain)
    }
}
