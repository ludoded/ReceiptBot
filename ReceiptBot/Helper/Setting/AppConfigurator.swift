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
    
    fileprivate var usualSign: SignInWorker!
    fileprivate var externalSign: ExternalLoginWorker!
    
    static let shared = AppConfigurator()
    private init() {}
    
    func show(for type: InitialSceneType) {
        let vc = UIStoryboard(name: type.rawValue, bundle: Bundle.main).instantiateInitialViewController()
        window?.rootViewController = vc
    }
    
    func showInitial() {
        guard let credentials = AppSettings.shared.credentials() else { show(for: .auth); return }
        let type = AppSettings.shared.autoLoginType()
        
        switch type {
        case .usual:
            usualSign = SignInWorker(email: credentials.email, password: credentials.password)
            usualSign.tryToLogin { [weak self] (resp) in self?.loginCompleted(with: resp) }
        case .external:
            externalSign = ExternalLoginWorker(email: credentials.email)
            externalSign.tryToLogin{ [weak self] (resp) in self?.loginCompleted(with: resp) }
        }
        
    }
    
    func loginCompleted(with resp: RebotValueWrapper<AuthResponse>) {
        DispatchQueue.main.async { [weak self] in
            switch resp {
            case .none: self?.show(for: .auth)
            case .value: self?.show(for: .main)
            }
        }
    }
}
