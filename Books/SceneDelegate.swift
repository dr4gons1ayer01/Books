//
//  SceneDelegate.swift
//  Books
//
//  Created by Иван Семенов on 11.04.2025.
//

import UIKit

enum WindowCase {
    case preview, registration, onboarding, main
}

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        NotificationCenter.default.addObserver(self, selector: #selector(windowManager), name: .windowManager, object: nil)

        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = PreviewView()
        window?.makeKeyAndVisible()
    }
    
    @objc func windowManager(notification: Notification) {
        guard let userInfo = notification.userInfo as? [String: WindowCase],
        let window = userInfo[.windowInfo] else {
            return
        }
        switch window {
        default:
            self.window?.rootViewController = Builder.createRegistrationView()
        }
    }
}

