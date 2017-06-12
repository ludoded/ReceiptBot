//
//  SettingsURL.swift
//  ReceiptBot
//
//  Created by Haik Ampardjian on 6/12/17.
//  Copyright © 2017 receiptbot. All rights reserved.
//

import Foundation

struct SettingsURL {
    static var ud = UserDefaults.standard
    
    static func registerDefaults() {
        ud.register(defaults: [String : Any]())
    }
    
    static func baseURL() -> String {
        let enabled = ud.bool(forKey: "enabled_live_server")
        return enabled ? "http://51.140.104.181:82" : "http://51.140.27.53:82"
    }
    
    static func docsURL() -> String {
        let enabled = ud.bool(forKey: "enabled_live_server")
        return enabled ? "http://test.receipt-bot.com" : "https://app.receipt-bot.com/"
    }
}
