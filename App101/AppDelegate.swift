//
//  AppDelegate.swift
//  App101
//
//  Created by Mert Tuzer on 21.01.2020.
//  Copyright © 2020 Mert Tuzer. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        if let window = window {
            window.backgroundColor = .black
            window.rootViewController = TabBarController() // the main controller for the app
            window.makeKeyAndVisible()
        }
        return true
    }

}
