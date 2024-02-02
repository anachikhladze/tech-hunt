//
//  NavigationManager.swift
//  TechHunt
//
//  Created by Anna Sumire on 18.01.24.
//

import SwiftUI
import UIKit

@available(iOS 17.0, *)
final class NavigationManager: ObservableObject {
    private var window: UIWindow?
    
    static let shared = NavigationManager()
    
    private init() {}
    
    func setWindow(_ window: UIWindow) {
        self.window = window
    }
    
    func showRootView() {
        let rootView = ProfileView()
        let rootViewHosting = UIHostingController(rootView: rootView)
        window?.rootViewController = UINavigationController(rootViewController: rootViewHosting)
    }
    
    
    func showExperienceVC() {
        let view = ExperienceViewController()
        if let navigationController = window?.rootViewController as? UINavigationController {
            navigationController.pushViewController(view, animated: true)
        }
    }
    
    
    func goBack() {
        if let navigationController = window?.rootViewController as? UINavigationController {
            navigationController.popViewController(animated: true)
        }
    }
    
    func navigateToExperienceVC() {
        let experienceViewController = ExperienceViewController()
        
        if let tabBarController = window?.rootViewController as? UITabBarController,
           let navigationController = tabBarController.selectedViewController as?  UINavigationController {
            navigationController.pushViewController(experienceViewController, animated: true)
        } else {
            print("not found")
        }
    }
}
