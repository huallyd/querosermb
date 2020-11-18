//
//  AppDelegate.swift
//  MercadoBitcoin
//
//  Created by Huallyd Smadi on 16/11/20.
//  Copyright © 2020 Huallyd Smadi. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    private var applicationCoordinator: Coordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)

        self.window = window

        applicationCoordinator = ApplicationCoordinator(window: window)
        applicationCoordinator?.start()

        return true
    }

}

