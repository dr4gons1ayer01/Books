//
//  DetailsViewContent.swift
//  Books
//
//  Created by Иван Семенов on 18.04.2025.
//

import SwiftUI

struct DetailsViewContent: View {
    @State private var bookNote: String = ""
    
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
                Text("О Книге")
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
            
            ScrollView {
                VStack(spacing: 29) {
                    ZStack(alignment: .top) {
                        GeometryReader { proxy in
                            let minY = proxy.frame(in: .global).minY
                                Image(.cover)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(maxWidth: proxy.size.width)
                                    .frame(height: 400 + (minY > 0 ? minY : 0))
                                    .clipped()
                                    .overlay {
                                        Color(.purple).opacity(0.5)
                                    }
                                    .offset(y: -minY)
                                    //.clipped()
                        }
                        .frame(height: 400)
                        
                        VStack(spacing: 15) {
                            Image(.cover)
                            
                            VStack(spacing: 2) {
                                Text("Война и мир")
                                    .font(type: .bold, size: 20)
                                Text("Лев Толстой")
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
                            Text("Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo")
                                .font(type: .medium, size: 14)
                                .foregroundStyle(.appGrey)
                        }
                        
                        VStack(alignment: .leading, spacing: 14) {
                            Text("Заметки по книге")
                                .font(type: .bold, size: 18)
                                .foregroundStyle(.white)
                            
                            VStack(alignment: .leading, spacing: 14) {
                                CommentView()
                                CommentView()
                                CommentView()
                                
                            }
                            BaseTextView(placeholder: "Добавить заметку", text: $bookNote)
                        }
                    }
                    .padding(.horizontal, 30)
                    .background(.bgMain)
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
