//
//  PasswordRecoveryWorker.swift
//  ReceiptBot
//
//  Created by Haik Ampardjian on 4/10/17.
//  Copyright © 2017 receiptbot. All rights reserved.
//

import Foundation

class PasswordRecoveryWorker {
    let email: String
    
    init(with email: String) {
        self.email = email
    }
    
    func tryToRecovery(callback: @escaping (RebotValueWrapper<StatusDetailResponse>) -> ()) {
        StatusDetailResponse.loadType(request: API.forgotPassword(email)) { (status, message) in
            guard message == nil else { callback(.none(message: message!)); return }
            
            callback(.value(status!))
        }
    }
}
