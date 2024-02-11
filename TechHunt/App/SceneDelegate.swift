//
//  SceneDelegate.swift
//  TechHunt
//
//  Created by Anna Sumire on 18.01.24.
//


import UIKit
import SwiftUI

@available(iOS 17.0, *)
final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    private lazy var navigationManager = NavigationManager(window: window!)
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else { return }
        window = UIWindow(windowScene: windowScene)
        navigationManager.navigateToInitialScreen()
        window?.makeKeyAndVisible()
    }
}
