//
//  AppDelegate.swift
//  MyPump
//
//  Created by Александр Майко on 03.01.2021.
//

import UIKit
import Firebase

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        UINavigationBar.appearance().barTintColor = UIColor.darkGray
        UINavigationBar.appearance().tintColor = ColorsScheme.col1
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        UITabBar.appearance().tintColor = ColorsScheme.col1
        UITabBar.appearance().unselectedItemTintColor = UIColor.white
        UITabBar.appearance().barTintColor = UIColor.darkGray
        UITableView.appearance().backgroundColor = UIColor.lightGray
        UITableViewCell.appearance().backgroundColor = UIColor.clear
        //        UICollectionView.appearance().backgroundColor = UIColor.lightGray
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    }
}
