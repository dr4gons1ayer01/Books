//
//  OnboardingViewContent.swift
//  Books
//
//  Created by Иван Семенов on 13.04.2025.
//

import SwiftUI

struct OnboardingViewContent: View {
    var slides: [OnboardingData]
    @State private var selected: Int = 0
    @State private var buttonText = "Далее"
    var completion: () -> Void
    
    var body: some View {
        VStack {
            Text("Добро пожаловать")
                .font(type: .black, size: 22)
                .foregroundStyle(.white)
            VStack {
                TabView(selection: $selected) {
                    ForEach(0..<slides.count, id: \.self) { slide in
                        SlideItem(tag: slide, item: slides[slide])
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                HStack {
                    ForEach(0..<slides.count, id: \.self) { slide in
                        Circle()
                            .foregroundStyle(slide == selected ? .appOrange : .white)
                            .frame(width: 8, height: 8)
                            .onTapGesture {
                                withAnimation {
                                    selected = slide
                                }
                            }
                    }
                }
                .padding(.vertical, 20)
            }
            OrangeButton(title: buttonText) {
                if selected < slides.count - 2 {
                    withAnimation {
                        selected += 1
                    }
                } else if selected == slides.count - 2 {
                    withAnimation {
                        selected += 1
                        buttonText = "Начать пользоваться"
                    }
                } else {
                    //push to main screen
                    completion()
                }
            }
        }
        .padding(.horizontal, 30)
        .background(.bgMain)
        .onChange(of: selected) { oldValue, newValue in
            withAnimation {
                if newValue == slides.count - 1 {
                    buttonText = "Начать пользоваться"
                } else {
                    buttonText = "Далее"
                }
            }
        }
    }
}

struct SlideItem: View {
    var tag: Int
    var item: OnboardingData
    
    var body: some View {
        VStack(alignment: .center, spacing: 39) {
            Image(item.image)
                .resizable()
                .frame(width: 220, height: 220)
                .clipped()
            Text(item.description)
                .font(type: .regular, size: 16)
                .foregroundStyle(.white)
        }
        .tag(tag)
    }
}
