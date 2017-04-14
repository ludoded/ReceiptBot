//
//  AppSettings.swift
//  ReceiptBot
//
//  Created by Haik Ampardjian on 4/9/17.
//  Copyright © 2017 receiptbot. All rights reserved.
//

import Foundation

final class AppSettings {
    static let shared = AppSettings()
    
    var user: AuthResponse!
    let ud = UserDefaults.standard
    
    private init() {}
    
    func store(user: AuthResponse) {
        self.user = user
    }
    
    /// MARK: Credentials handling
    func updateCredentials(email: String, password: String) {
        ud.set(email, forKey: "email")
        ud.set(password, forKey: "password")
    }
    
    func credentials() -> (email: String, password: String)? {
        guard let email = ud.string(forKey: "email"),
            let password = ud.string(forKey: "password")
            else { return nil }
        
        return (email, password)
    }
    
    func logout() {
        ud.set(nil, forKey: "email")
        ud.set(nil, forKey: "password")
    }
    
//    private func fetchUser() {
//        guard let users: [UserInfo] = DatabaseManager.shared.fetch(),
//            let user = users.first
//            else { return }
//        store(user: user)
//    }
}
