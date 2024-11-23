//
//  SceneDelegate.swift
//  FashionApp
//
//  Created by Engy on 11/14/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else {return}
        window = UIWindow(windowScene: windowScene)
        if UserDefaultsManager.shared.isLogin || UserDefaultsManager.shared.isLogin {
            window?.rootViewController = MainTabBarVC()
        } else {
            window?.rootViewController = SignInVC()
        }
        window?.makeKeyAndVisible()
    }
}

