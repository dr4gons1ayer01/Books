//
//  DetailsViewContent.swift
//  Books
//
//  Created by Иван Семенов on 18.04.2025.
//

import SwiftUI

struct DetailsViewContent: View {
    @State private var bookNote: String = ""
    @State private var offsetTop: CGFloat = 0
    @State private var showTitle: Bool = false
    @State private var commentDeleteOffsetX: CGFloat = 0
    var book: Book?
    var bookName: String {
        book?.name ?? ""
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            HStack {
                ///'backButton' back
                Button {
                    //action
                    
                } label: {
                    Image(systemName: "arrow.backward")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                }
                Spacer()
                Text(showTitle ? bookName : "О Книге")
                    .font(type: .medium, size: 18)
                Spacer()
                ///'menuButton' menu
                Button {
                    //action
                    
                } label: {
                    Image(systemName: "ellipsis")
                        .resizable()
                        .rotationEffect(.degrees(90))
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                }
            }
            .padding(.top, 45)
            .foregroundStyle(.white)
            .zIndex(1)
            .padding(.horizontal, 30)
            .background(
                .bgMain.opacity(offsetTop < 0 ? (-offsetTop * 4.5 / 1000) : 0)
            )
            
            ScrollView {
                VStack(spacing: 29) {
                    ZStack(alignment: .top) {
                        GeometryReader { proxy in
                            let minY = proxy.frame(in: .global).minY
                            ///imageOverlay
                            BookCoverForOverlay(book: book!)
                                .scaledToFill()
                                .frame(maxWidth: proxy.size.width)
                                .frame(height: 400 + (minY > 0 ? minY : 0))
                                .clipped()
                                .overlay {
                                    Color(.purple).opacity(0.5)
                                }
                                .offset(y: minY > 0 ? -minY : 0)
                                .onChange(of: minY) { newValue in
                                    offsetTop = newValue
                                    withAnimation {
                                        if newValue < -229 {
                                            showTitle = true
                                        } else {
                                            showTitle = false
                                        }
                                    }
                                }
                        }
                        .frame(height: 400)
                        
                        VStack(spacing: 15) {
                            CoverFromFileManager(book: book!)
                            
                            VStack(spacing: 2) {
                                Text(bookName)
                                    .font(type: .bold, size: 20)
                                Text(book?.author ?? "")
                                    .font(type: .medium, size: 14)
                            }
                            .foregroundStyle(.white)
                            ///'readButton' read
                            BookStatusButton(status: .read) {
                                //action
                                
                            }
                        }
                        .padding(.top, 85)
                    }
                    
                    VStack(alignment: .leading, spacing: 36) {
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Описание")
                                .font(type: .black, size: 18)
                                .foregroundStyle(.white)
                            Text(book?.bookDescription ?? "")
                                .font(type: .medium, size: 14)
                                .foregroundStyle(.appGrey)
                        }
                        
                        VStack(alignment: .leading, spacing: 14) {
                            Text("Заметки по книге")
                                .font(type: .bold, size: 18)
                                .foregroundStyle(.white)
                            
                            VStack(alignment: .leading, spacing: 14) {
                                ZStack(alignment: .trailing) {
                                    CommentView()
                                        .offset(x: -commentDeleteOffsetX)
                                        .gesture(
                                            DragGesture()
                                                .onChanged({ value in
                                                    if value.translation.width < -commentDeleteOffsetX {
                                                        commentDeleteOffsetX = abs(value.translation.width)
                                                    }
                                                }).onEnded({ value in
                                                    if value.translation.width < -100 {
                                                        commentDeleteOffsetX = 150
                                                    } else {
                                                        commentDeleteOffsetX = 0
                                                    }
                                                })
                                    )
                                        .zIndex(1)
                                    
                                    Button {
                                        //action
                                        
                                    } label: {
                                        Image(systemName: "trash")
                                            .resizable()
                                            .foregroundStyle(.white)
                                            .opacity(commentDeleteOffsetX > 0 ? (commentDeleteOffsetX / 100) : 0)
                                            .scaledToFit()
                                            .frame(width: 24, height: 24)
                                            .padding(.trailing, 20)
                                    }
                                }
                                CommentView()
                                CommentView()
                                
                            }
                            BaseTextView(placeholder: "Добавить заметку", text: $bookNote)
                        }
                    }
                    .padding(.horizontal, 30)
                    //                    .background(.bgMain)
                }
                .padding(.bottom, 30)
            }
        }
        .ignoresSafeArea()
        .background(.bgMain)
    }
}

#Preview {
    DetailsViewContent()
}
