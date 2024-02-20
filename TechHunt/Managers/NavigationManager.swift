//
//  NavigationManager.swift
//  TechHunt
//
//  Created by Anna Sumire on 18.01.24.
//

import SwiftUI
import UIKit

final class NavigationManager: ObservableObject {
    
    private let window: UIWindow
    private let viewModel = AuthViewModel()
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func navigateToInitialScreen() {
        if viewModel.userSession != nil {
            navigateToMainViewScreen()
        } else {
            showRootView()
        }
    }
    
    func navigateToMainViewScreen() {
        DispatchQueue.main.async {
            let mainScreenViewController = self.createTabbar()
            self.window.rootViewController = mainScreenViewController
            self.window.makeKeyAndVisible()
        }
    }
    
    func showRootView() {
        let rootView = LoginView()
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
        
        if let tabbarController = window.rootViewController as? UITabBarController,
           let navigationController = tabbarController.selectedViewController as? UINavigationController {
            navigationController.present(rulesViewController, animated: true)
        } else {
            print("Navigation controller not found")
        }
    }
    
    func navigateToExperienceVC() {
        let experienceViewController = ExperienceViewController()
        
        if let tabbarController = window.rootViewController as? UITabBarController,
           let navigationController = tabbarController.selectedViewController as? UINavigationController {
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
        
        if let tabbarController = window.rootViewController as? UITabBarController,
           let navigationController = tabbarController.selectedViewController as? UINavigationController {
            navigationController.present(jobDetailsViewController, animated: true)
        } else {
            print("Navigation controller not found")
        }
    }
    
    func pushRulesVC() {
        let rulesViewController = RulesViewController()
        
        if let tabbarController = window.rootViewController as? UITabBarController,
           let navigationController = tabbarController.selectedViewController as? UINavigationController {
            navigationController.pushViewController(rulesViewController, animated: true)
        } else {
            print("Navigation controller not found")
        }
    }
    
    func pushAppliedJobsVC() {
        let appliedJobsVC = AppliedJobsViewController()
        
        if let tabbarController = window.rootViewController as? UITabBarController,
           let navigationController = tabbarController.selectedViewController as? UINavigationController {
            navigationController.pushViewController(appliedJobsVC, animated: true)
        } else {
            print("Navigation controller not found")
        }
    }
    
    func pushSupportVC() {
        let supportViewController = SupportViewController(navigationManager: self)
        
        if let tabbarController = window.rootViewController as? UITabBarController,
           let navigationController = tabbarController.selectedViewController as? UINavigationController {
            navigationController.pushViewController(supportViewController, animated: true)
        } else {
            print("Navigation controller not found")
        }
    }
    
    func navigateToReferralPage() {
        let referalView = ReferralView()
        
        let hostingView = UIHostingController(rootView: referalView)
        if let tabbarController = window.rootViewController as? UITabBarController,
           let navigationController = tabbarController.selectedViewController as? UINavigationController {
            navigationController.pushViewController(hostingView, animated: true)
            navigationController.navigationBar.isHidden = false
        } else {
            print("Navigation controller not found")
        }
    }
    
    func presentReferralPage() {
        let referalView = ReferralView()
        
        let hostingView = UIHostingController(rootView: referalView)
        if let tabbarController = window.rootViewController as? UITabBarController,
           let navigationController = tabbarController.selectedViewController as? UINavigationController {
            navigationController.present(hostingView, animated: true)
            navigationController.navigationBar.isHidden = false
        } else {
            print("Navigation controller not found")
        }
    }
    
    func createHomeNavigationController() -> UINavigationController {
        let homeView = HomeView()
            .environmentObject(self)
            .environmentObject(AuthViewModel())
        let homeViewHosting = UIHostingController(rootView: homeView)
        
        let homeVC = homeViewHosting
        homeVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house.fill"), tag: 0)
        
        let navController = UINavigationController(rootViewController: homeVC)
        navController.navigationBar.isHidden = true
        navController.hidesBarsOnSwipe = true
        navController.isNavigationBarHidden = true
        
        return navController
    }
    
    func createJobsNavigationController() -> UINavigationController {
        let jobsVC = JobListViewController()
        jobsVC.title = "Jobs"
        jobsVC.tabBarItem = UITabBarItem(title: "Jobs", image: UIImage(systemName: "list.bullet.circle.fill"), tag: 1)
        
        return UINavigationController(rootViewController: jobsVC)
    }
    
    func createProfileNavigationController() -> UINavigationController {
        let profileView = ProfileView()
            .environmentObject(self)
            .environmentObject(viewModel)
        let profileViewHosting = UIHostingController(rootView: profileView)
        
        let profileVC = profileViewHosting
        profileVC.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.fill"), tag: 2)
        
        let navController = UINavigationController(rootViewController: profileVC)
        navController.navigationBar.isHidden = true
        
        return navController
    }
    
    func createTabbar() -> UITabBarController {
        let tabbar = UITabBarController()
        
        UITabBar.appearance().tintColor = UIColor.accent
        UITabBar.appearance().unselectedItemTintColor = .darkGray
        tabbar.viewControllers = [createHomeNavigationController(), createJobsNavigationController(), createProfileNavigationController()]
        
        return tabbar
    }
}
