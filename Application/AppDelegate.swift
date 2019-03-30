//
//  AppDelegate.swift
//  CatApiCollectionView
//
//  Created by Mike Saradeth on 3/27/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let catApiService = CatApiService()
        let viewModel = CatViewModel(sections: [], catApiService: catApiService)
        let rootVC = CatVC.createWith(title: "Cat API", viewModel: viewModel)
        let rootNav = UINavigationController(rootViewController: rootVC)
        window = UIWindow.init(frame: UIScreen.main.bounds)
        window?.rootViewController = rootNav
        window?.makeKeyAndVisible()
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
    }


}

