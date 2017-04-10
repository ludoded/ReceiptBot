//
//  AppConfigurator.swift
//  ReceiptBot
//
//  Created by Haik Ampardjian on 4/9/17.
//  Copyright © 2017 receiptbot. All rights reserved.
//

import UIKit

enum InitialSceneType: String {
    case launch = "LaunchScreen"
    case auth = "Auth"
    case main = "InvoicesAndReceipts"
}

final class AppConfigurator {
    fileprivate var window: UIWindow? {
        return (UIApplication.shared.delegate as? AppDelegate)?.window
    }
    
    static let shared = AppConfigurator()
    private init() {}
    
    func show(for type: InitialSceneType) {
        let vc = UIStoryboard(name: type.rawValue, bundle: Bundle.main).instantiateInitialViewController()
        window?.rootViewController = vc
    }
}
