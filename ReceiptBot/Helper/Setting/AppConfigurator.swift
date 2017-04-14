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
    case main = "Main"
}

final class AppConfigurator {
    fileprivate var window: UIWindow? {
        return (UIApplication.shared.delegate as? AppDelegate)?.window
    }
    
    fileprivate var worker: SignInWorker!
    
    static let shared = AppConfigurator()
    private init() {}
    
    func show(for type: InitialSceneType) {
        let vc = UIStoryboard(name: type.rawValue, bundle: Bundle.main).instantiateInitialViewController()
        window?.rootViewController = vc
    }
    
    func showInitial() {
        guard let credentials = AppSettings.shared.credentials() else { show(for: .auth); return }
        
        worker = SignInWorker(email: credentials.email, password: credentials.password)
        worker.tryToLogin { [weak self] (resp) in
            DispatchQueue.main.async {
                switch resp {
                case .none: self?.show(for: .auth)
                case .value: self?.show(for: .main)
                }
            }
        }
    }
}
