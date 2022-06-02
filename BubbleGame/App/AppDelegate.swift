//
//  AppDelegate.swift
//  BubbleGame
//
//  Created by 许浩渊 on 2022/6/1.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = StartViewController()
        window?.makeKeyAndVisible()

        return true
    }


}

