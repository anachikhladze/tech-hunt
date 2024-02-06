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
    private let window: UIWindow
    var viewModel = LoginViewModel()
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func showRootView() {
        let rootView = LoginRootView()
            .environmentObject(self)
            .environmentObject(viewModel)
        let rootViewHosting = UIHostingController(rootView: rootView)
        let navigationController = UINavigationController(rootViewController: rootViewHosting)
        navigationController.navigationBar.isHidden = true
        window.rootViewController = navigationController
    }
    
    func showRegistrationPage() {
        let registrationView = RegistrationView()
            .environmentObject(self)
            .environmentObject(viewModel)
        let hostingView = UIHostingController(rootView: registrationView)
        if let navigationController = window.rootViewController as? UINavigationController {
            navigationController.pushViewController(hostingView, animated: true)
            navigationController.navigationBar.isHidden = true
        }
    }
    
    func navigateToRulesVC() {
        let rulesViewController = RulesViewController()
        
        if let navigationController = window.rootViewController as? UINavigationController {
            navigationController.present(rulesViewController, animated: true)
        } else {
            print("Navigation controller not found")
        }
    }
    
    func navigateToExperienceVC() {
        let experienceViewController = ExperienceViewController()
        
        if let navigationController = window.rootViewController as? UINavigationController {
            navigationController.pushViewController(experienceViewController, animated: true)
        } else {
            print("Navigation controller not found")
        }
    }
    
    func navigateToCVFormVC() {
        let CVFormViewController = CVFormViewController()
        
        if let navigationController = window.rootViewController as? UINavigationController {
            navigationController.present(CVFormViewController, animated: true)
        } else {
            print("Navigation controller not found")
        }
    }
    
    func navigateToJobDetailsVC(job: Job) {
        let jobDetailsViewController = JobDetailsViewController(job: job)
        
        if let navigationController = window.rootViewController as? UINavigationController {
            navigationController.present(jobDetailsViewController, animated: true)
        } else {
            print("Navigation controller not found")
        }
    }
    
    func pushRulesVC() {
        let rulesViewController = RulesViewController()
        
        if let navigationController = window.rootViewController as? UINavigationController {
            navigationController.pushViewController(rulesViewController, animated: true)
        } else {
            print("Navigation controller not found")
        }
    }
    
        func pushAppliedJobsVC() {
            let appliedJobsVC = AppliedJobsViewController()
    
            if let navigationController = window.rootViewController as? UINavigationController {
                navigationController.pushViewController(appliedJobsVC, animated: true)
            } else {
                print("Navigation controller not found")
            }
        }
    
    func pushSupportVC() {
        let supportViewController = SupportViewController()
        
        if let navigationController = window.rootViewController as? UINavigationController {
            navigationController.pushViewController(supportViewController, animated: true)
        } else {
            print("Navigation controller not found")
        }
    }
}

