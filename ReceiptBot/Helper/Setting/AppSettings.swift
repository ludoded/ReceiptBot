//
//  AppSettings.swift
//  ReceiptBot
//
//  Created by Haik Ampardjian on 4/9/17.
//  Copyright © 2017 receiptbot. All rights reserved.
//

import Foundation

enum AutoLoginType: String {
    case usual
    case external
}

final class AppSettings {
    static let shared = AppSettings()
    
    var user: AuthResponse!
    let ud = UserDefaults.standard
    
    var config: AppConfigChunk!
    
    private init() {}
    
    func store(user: AuthResponse, callback: @escaping () -> ()) {
        self.user = user
        
        /// Fetching categories and suppliers
        config = AppConfigChunk.shared
        config.initSetup()
        config.loadConfigs(callback: callback)
    }
    
    /// MARK: Credentials handling
    func updateCredentials(email: String, password: String, type: AutoLoginType) {
        ud.set(email, forKey: "email")
        ud.set(password, forKey: "password")
        ud.set(type.rawValue, forKey: "loginType")
    }
    
    func credentials() -> (email: String, password: String)? {
        guard let email = ud.string(forKey: "email"),
            let password = ud.string(forKey: "password")
            else { return nil }
        
        return (email, password)
    }
    
    func autoLoginType() -> AutoLoginType {
        guard let rawType = ud.string(forKey: "loginType"), let type = AutoLoginType(rawValue: rawType) else { return .usual }
        return type
    }
    
    func logout() {
        ud.set(nil, forKey: "email")
        ud.set(nil, forKey: "password")
        config.reset()
    }
}
