//
//  AppDelegate.swift
//  WhatToFeed
//
//  Created by Salome Sulkhanishvili on 04.01.22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        //UIApplication.shared.statusBarStyle = UIColor.tabBarLightGray
//        let greetingViewController = UIStoryboard(name: "GreetingViewController", bundle: nil).instantiateInitialViewController() as! GreetingViewController
//        self.window?.rootViewController = greetingViewController
//        self.window?.makeKeyAndVisible()
//        DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: { [weak self] in
//            guard let self = self else { return }
            let tabBarController = TabBarController()
            self.window?.rootViewController = tabBarController
            self.window?.makeKeyAndVisible()
//        })
        print("Device: \(UIDevice.current.type)")
        print("screenFactor: \(UIDevice.screenFactor)")
        return true
    }

    // MARK: UISceneSession Lifecycle

//    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
//        // Called when a new scene session is being created.
//        // Use this method to select a configuration to create the new scene with.
//        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
//    }
//
//    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
//        // Called when the user discards a scene session.
//        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
//        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
//    }
//

}

