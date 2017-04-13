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
    
    private init() {}
    
    func store(user: AuthResponse) {
        self.user = user
    }
    
//    private func fetchUser() {
//        guard let users: [UserInfo] = DatabaseManager.shared.fetch(),
//            let user = users.first
//            else { return }
//        store(user: user)
//    }
}
