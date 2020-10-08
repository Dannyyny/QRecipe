//
//  AppDelegate.swift
//  QRecipes
//
//  Created by Kyo on 9/8/20.
//  Copyright © 2020 Kyo. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
        
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        window?.makeKeyAndVisible()
        let nav = UINavigationController(rootViewController: SearchVC())
        window?.rootViewController = nav
//        let viewController = SearchVC()
//        let nav = UINavigationController(rootViewController: SearchVC())
//        viewController.navigationItem.title = "Search Bar"
//        navController.tabBarItem.title = "Search here"
//
//        let tabController = UITabBarController()
//        tabController.viewControllers = [navController]
        /*
        window = UIWindow()
        window?.makeKeyAndVisible()
        
        let nav = UINavigationController(rootViewController:SearchVC())
        window?.rootViewController = nav
        
        let viewController = SearchVC()
        let navController = UINavigationController(rootViewController: viewController)
        viewController.navigationItem.title = "Search Bar"
        navController.tabBarItem.title = "Search here"
        let tabController = UITabBarController()
        tabController.viewControllers = [navController]
        
        */
        
        
        //let nav = UINavigationController(rootViewController:SearchVC())
        
       
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {

        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {

    }

}

