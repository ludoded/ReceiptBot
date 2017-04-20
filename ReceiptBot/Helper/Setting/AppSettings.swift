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
    
    var config: AppConfigChunk!
    
    private init() {}
    
    func store(user: AuthResponse, callback: @escaping () -> ()) {
        self.user = user
        
        config = AppConfigChunk.shared
        /// Fetching categories and suppliers
        config.loadConfigs(callback: callback)
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
        config.reset()
    }
}
