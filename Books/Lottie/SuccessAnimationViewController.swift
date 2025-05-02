//
//  SuccessAnimationViewController.swift
//  Books
//
//  Created by Иван Семенов on 01.05.2025.
//

import UIKit
import Lottie

class SuccessAnimationViewController: UIViewController {
    
    private let animationView = LottieAnimationView(name: "saveBook")

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.bgMain.withAlphaComponent(0.8)

        view.addSubview(animationView)
        animationView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            animationView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            animationView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            animationView.widthAnchor.constraint(equalToConstant: 180),
            animationView.heightAnchor.constraint(equalToConstant: 180),
        ])

        animationView.loopMode = .playOnce
        animationView.animationSpeed = 1.4
        animationView.play() { [weak self] finished in
            if finished {
                self?.dismiss(animated: true)
            }
        }
    }
}
