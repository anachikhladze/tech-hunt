//
//  TabbarController.swift
//  TechHunt
//
//  Created by Anna Sumire on 05.02.24.
//

import UIKit
import SwiftUI

@available(iOS 17.0, *)
struct TabBarController: UIViewControllerRepresentable {
    
    @EnvironmentObject var flowCoordinator: NavigationManager
    
    typealias UIViewControllerType = UITabBarController

    func makeUIViewController(context: UIViewControllerRepresentableContext<TabBarController>) -> UITabBarController {
        return createTabbar()
    }

    func updateUIViewController(_ uiViewController: UITabBarController, context: UIViewControllerRepresentableContext<TabBarController>) {

    }

    func createHomeNavigationController() -> UINavigationController {
        let homeView = HomeView()
            .environmentObject(flowCoordinator)
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
        tabbar.viewControllers = [createHomeNavigationController(), createJobsNavigationController(), createProfileNavigationController()]

        return tabbar
    }
}
