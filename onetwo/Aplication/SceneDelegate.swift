//
//  SceneDelegate.swift
//  onetwo
//
//  Created by Alex Provarenko on 19.09.2022.
//

import UIKit
import FirebaseAuth

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        self.setUpWindow(with: scene)
        self.checkAuthentification()
    }
    
    private func setUpWindow(with scene: UIScene) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.makeKeyAndVisible()
    }
    
    func checkAuthentification() {
        if Auth.auth().currentUser == nil {
            let controller = LoginViewController()
            let navigation = controller
            navigation.modalPresentationStyle = .fullScreen
            self.window?.rootViewController = navigation
        } else {
            let controller = MainTabBarViewController()
            let navigation = controller
            navigation.modalPresentationStyle = .fullScreen
            self.window?.rootViewController = navigation
        }
    }
}

