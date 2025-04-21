//
//  AddDetailsViewContent.swift
//  Books
//
//  Created by Иван Семенов on 21.04.2025.
//

import SwiftUI

struct AddDetailsViewContent: View {
    @State private var bookName: String = ""
    @State private var bookDescription: String = ""
    @State private var isShowPlaceholder: Bool = true
    
    var body: some View {
        VStack {
            NavHeader(title: "Мартин Иден") {
                //action
                
            }
            VStack(spacing: 80) {
                Image(.cover)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 130, height: 180)
                    .clipShape(.rect(cornerRadius: 8))
                    .overlay(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
                        Button {
                            //action
                            
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
                    }
                VStack(spacing: 30) {
                    BaseTextView(placeholder: "Название", text: $bookName)
                    
                    ZStack(alignment: .topLeading) {
                        TextEditor(text: $bookDescription)
                            .scrollContentBackground(.hidden)
                            .frame(height: 114)
                            .padding(.horizontal, 15)
                            .padding(.vertical, 10)
                            .font(size: 16)
                            .foregroundStyle(.white)
                            .background(.appDark)
                            .clipShape(.rect(cornerRadius: 10))
                            .overlay(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
                                Button {
                                    //action
                                    
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
                            .onChange(of: bookDescription) { oldValue, newValue in
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
                //action
                
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: Alignment(horizontal: .leading, vertical: .top))
        .padding(.horizontal, 30)
        .background(.bgMain)
    }
}

#Preview {
    AddDetailsViewContent()
}
