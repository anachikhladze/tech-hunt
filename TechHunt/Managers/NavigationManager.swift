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
    
    func navigateToExperienceVC() {
        let experienceViewController = ExperienceViewController()
        
        if let tabBarController = window?.rootViewController as? UITabBarController,
           let navigationController = tabBarController.selectedViewController as?  UINavigationController {
            navigationController.pushViewController(experienceViewController, animated: true)
        } else {
            print("not found")
        }
    }
    
    func navigateToCVFormVC() {
        let CVFormViewController = CVFormViewController()
        
        if let tabBarController = window?.rootViewController as? UITabBarController,
           let navigationController = tabBarController.selectedViewController as?  UINavigationController {
            navigationController.present(CVFormViewController, animated: true)
        } else {
            print("not found")
        }
    }
    
    func navigateToJobDetailsVC(job: Job) {
        let jobDetailsViewController = JobDetailsViewController(job: job)
        
        if let tabBarController = window?.rootViewController as? UITabBarController,
           let navigationController = tabBarController.selectedViewController as?  UINavigationController {
            navigationController.present(jobDetailsViewController, animated: true)
        } else {
            print("not found")
        }
    }
    
    func navigateToRulesVC() {
        let rulesViewController = RulesViewController()
        
        if let tabBarController = window?.rootViewController as? UITabBarController,
           let navigationController = tabBarController.selectedViewController as?  UINavigationController {
            navigationController.present(rulesViewController, animated: true)
        } else {
            print("not found")
        }
    }
}
