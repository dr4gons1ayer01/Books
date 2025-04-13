//
//  OnboardingData.swift
//  Books
//
//  Created by Иван Семенов on 13.04.2025.
//

import Foundation

struct OnboardingData: Identifiable {
    let id: UUID = UUID()
    let image: String
    let description: String
    
    static var mockData: [OnboardingData] {
        [
            OnboardingData(image: "book", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit"),
            OnboardingData(image: "book1", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo"),
            OnboardingData(image: "brain", description: "quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo"),
        ]
    }
}
