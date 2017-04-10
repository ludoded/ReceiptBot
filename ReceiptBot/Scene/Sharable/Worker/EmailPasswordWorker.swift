//
//  EmailPasswordWorker.swift
//  ReceiptBot
//
//  Created by Haik Ampardjian on 4/10/17.
//  Copyright © 2017 receiptbot. All rights reserved.
//

import Foundation

class EmailPasswordWorker {
    let email: String
    let password: String
    
    var params: [String: String] {
        return [
            "Email": email,
            "Password": password
        ]
    }
    
    init(email: String, password: String) {
        self.email = email
        self.password = password
    }
}
