//
//  AppDelegate.swift
//  ReceiptBot
//
//  Created by Haik Ampardjian on 3/28/17.
//  Copyright © 2017 receiptbot. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        AppConfigurator.shared.show(for: .launch)
        setupDB()
        return true
    }
}

/// MARK: Database
extension AppDelegate {
    func setupDB() {
        DatabaseManager.shared.createPersistentStore { (error) in
            assert(error == nil, "Couldn't create database's persistent store: \(String(describing: error))")
            DispatchQueue.main.async { AppConfigurator.shared.show(for: .auth) }
        }
    }
}
