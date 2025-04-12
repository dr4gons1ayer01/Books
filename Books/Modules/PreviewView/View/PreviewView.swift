//
//  PreviewView.swift
//  Books
//
//  Created by Иван Семенов on 11.04.2025.
//

import UIKit
import Lottie

class PreviewView: UIViewController {
    
    private let animationView = LottieAnimationView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .bgMain
        view.addSubview(animationView)
        setupAnimation()
    }
    
    private func setupAnimation() {
        animationView.animation = LottieAnimation.named("books")
        animationView.frame = view.bounds
        animationView.backgroundColor = .clear
        animationView.contentMode = .scaleAspectFit
        animationView.isUserInteractionEnabled = true
        animationView.frame = CGRect(x: 100, y: 100, width: 250, height: 250)
        animationView.animationSpeed = 1.3
        animationView.loopMode = .playOnce
        animationView.play { finished in
            if finished {
                //push to next vc
                NotificationCenter.default.post(name: .windowManager, object: nil, userInfo: [String.windowInfo: WindowCase.registration])
            }
        }
    }
}
