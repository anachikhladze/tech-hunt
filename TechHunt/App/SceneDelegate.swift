//
//  SceneDelegate.swift
//  TechHunt
//
//  Created by Anna Sumire on 18.01.24.
//

//import UIKit
//import SwiftUI
//
//@available(iOS 17.0, *)
//class SceneDelegate: UIResponder, UIWindowSceneDelegate {
//    
//    var window: UIWindow?
//    
//    
//    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
//        guard let windowScene = (scene as? UIWindowScene) else { return }
//        
//        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
//        window?.windowScene = windowScene
//        window?.rootViewController = createTabbar()
//        window?.makeKeyAndVisible()
//        
//        NavigationManager.shared.setWindow(window!)
//    }
//    
//    //    var window: UIWindow?
//    //    private lazy var flowController = NavigationManager(window: window!)
//    //
//    //
//    //    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
//    //        guard let windowScene = scene as? UIWindowScene else { return }
//    //        window = UIWindow(windowScene: windowScene)
//    //        flowController.showRootView()
//    //        window?.makeKeyAndVisible()
//    //    }
//    
//    func createHomeNavigationController() -> UINavigationController {
//        let homeView = HomeView()
//        let homeViewHosting = UIHostingController(rootView: homeView)
//        
//        let homeVC = homeViewHosting
//        homeVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house.fill"), tag: 0)
//        
//        let navController = UINavigationController(rootViewController: homeVC)
//        navController.navigationBar.isHidden = true
//        
//        return navController
//    }
//    
//    func createJobsNavigationController() -> UINavigationController {
//        let jobsVC = JobListViewController()
//        jobsVC.title = "Jobs"
//        jobsVC.tabBarItem = UITabBarItem(title: "Jobs", image: UIImage(systemName: "list.bullet.circle.fill"), tag: 1)
//        
//        return UINavigationController(rootViewController: jobsVC)
//    }
//    
//    func createProfileNavigationController() -> UINavigationController {
//        let profileView = ProfileView()
//        let profileViewHosting = UIHostingController(rootView: profileView)
//        
//        let profileVC = profileViewHosting
//        profileVC.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.fill"), tag: 2)
//        
//        let navController = UINavigationController(rootViewController: profileVC)
//        navController.navigationBar.isHidden = true
//        
//        return navController
//    }
//
//    func createTabbar() -> UITabBarController {
//        let tabbar = UITabBarController()
//        
//        UITabBar.appearance().tintColor = .systemTeal
//        UITabBar.appearance().unselectedItemTintColor = .black
//        tabbar.viewControllers = [createHomeNavigationController(), createJobsNavigationController(), createProfileNavigationController()]
//        
//        return tabbar
//    }
//}


import UIKit

@available(iOS 17.0, *)
final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    private lazy var flowController = FlowCoordinator(window: window!)
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else { return }
        window = UIWindow(windowScene: windowScene)
        flowController.showRootView()
        window?.makeKeyAndVisible()
    }
}


import SwiftUI
import UIKit

@available(iOS 17.0, *)
final class FlowCoordinator: ObservableObject {
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
        window.rootViewController = UINavigationController(rootViewController: rootViewHosting)
    }
    
    func showRegistrationPage() {
        let registrationView = RegistrationView()
            .environmentObject(self)
            .environmentObject(viewModel)
        let hostingView = UIHostingController(rootView: registrationView)
        if let navigationController = window.rootViewController as? UINavigationController {
            navigationController.pushViewController(hostingView, animated: true)
        }
    }
    
    func navigateToRulesVC() {
        let rulesViewController = RulesViewController()
        
        if let tabBarController = window.rootViewController as? UITabBarController,
           let navigationController = tabBarController.selectedViewController as?  UINavigationController {
            navigationController.present(rulesViewController, animated: true)
        } else {
            print("not found")
        }
    }
    
}
