//
//  SettingsManager.swift
//  ReceiptBot
//
//  Created by Haik Ampardjian on 5/30/17.
//  Copyright © 2017 receiptbot. All rights reserved.
//

import Foundation

final class SettingsManager {
    static let shared = SettingsManager()
    let ud = UserDefaults.standard
    
    private init() {}
    
    // MARK: - Business logic
    func crop() -> Bool {
        guard let crop = ud.object(forKey: "SettingsCropEnabled") as? Bool else { return true }
        return crop
    }
    
    func saveCrop(state: Bool) {
        ud.set(state, forKey: "SettingsCropEnabled")
    }
}
