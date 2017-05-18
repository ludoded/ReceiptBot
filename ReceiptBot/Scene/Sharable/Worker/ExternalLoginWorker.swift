//
//  ExternalLoginWorker.swift
//  ReceiptBot
//
//  Created by Haik Ampardjian on 4/11/17.
//  Copyright © 2017 receiptbot. All rights reserved.
//

import UIKit

final class ExternalLoginWorker {
    let email: String
    
    init(email: String) {
        self.email = email
    }
    
    func tryToLogin(callback: @escaping (RebotValueWrapper<AuthResponse>) -> ()) {
        AuthResponse.loadType(request: API.externalLogin(email)) { (resp, message) in
            guard message == nil else { callback(.none(message: message!)); return }
            
            /// Save the user info into singleton
            AppSettings.shared.store(user: resp!) { [weak self] in
                AppSettings.shared.updateCredentials(email: self?.email ?? "", password: "", type: .external)
                callback(.value(resp!))
            }
        }
    }
}
