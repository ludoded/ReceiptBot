//
//  RebotValidator.swift
//  ReceiptBot
//
//  Created by Haik Ampardjian on 4/9/17.
//  Copyright © 2017 receiptbot. All rights reserved.
//

import Foundation

struct RebotValidator {
    static func validate(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        
        return emailTest.evaluate(with: email)
    }
    
    static func validate(password: String) -> Bool {
        return password.characters.count >= 6
    }
    
    static func emailError(text: String) -> Bool {
        guard !text.isEmpty else { return true }
        return validate(email: text)
    }
    
    static func passwordError(text: String) -> Bool {
        guard !text.isEmpty else { return true }
        return validate(password: text)
    }
}
