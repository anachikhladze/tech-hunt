//
//  SceneDelegate.swift
//  TechHunt
//
//  Created by Anna Sumire on 18.01.24.
//

import UIKit
import SwiftUI

@available(iOS 17.0, *)
class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = createTabbar()
        window?.makeKeyAndVisible()
    }
    
    func createHomeNavigationController() -> UINavigationController {
        let homeView = HomeView()
        let homeViewHosting = UIHostingController(rootView: homeView)
        
        let homeVC = homeViewHosting
        homeVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house.fill"), tag: 0)
        
        let navController = UINavigationController(rootViewController: homeVC)
        navController.navigationBar.isHidden = true
        
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
        let profileViewHosting = UIHostingController(rootView: profileView)
        
        let profileVC = profileViewHosting
        profileVC.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.fill"), tag: 2)
        
        let navController = UINavigationController(rootViewController: profileVC)
        navController.navigationBar.isHidden = true
        
        return navController
    }

    
    func createTabbar() -> UITabBarController {
        let tabbar = UITabBarController()
        
        UITabBar.appearance().tintColor = .systemTeal
        UITabBar.appearance().unselectedItemTintColor = .black
        // need to learn how to change background colors
        tabbar.viewControllers = [createHomeNavigationController(), createJobsNavigationController(), createProfileNavigationController()]
        
        return tabbar
    }
    
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
    
    
}
