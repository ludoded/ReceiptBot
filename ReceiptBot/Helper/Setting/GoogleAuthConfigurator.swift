//
//  GoogleAuthConfigurator.swift
//  ReceiptBot
//
//  Created by Haik Ampardjian on 4/11/17.
//  Copyright © 2017 receiptbot. All rights reserved.
//

import Foundation

import Firebase
import GoogleSignIn

struct GoogleAuthInfo {
    let email: String
    let name: String
}

final class GoogleAuthConfigurator: NSObject {
    var signedIn: ((GoogleAuthInfo?, String?) -> ())? /// (String?, String?) is for (email, error)
    var loggedOut: (() -> ())?
    
    static let shared = GoogleAuthConfigurator()
    
    private override init() {
        super.init()
    }
    
    func configureGoogleEnvironment() {
        FIRApp.configure()
        
        GIDSignIn.sharedInstance().clientID = FIRApp.defaultApp()?.options.clientID
        GIDSignIn.sharedInstance().delegate = self
    }
    
    func logout() {
        GIDSignIn.sharedInstance().signOut()
    }
}

extension GoogleAuthConfigurator: GIDSignInDelegate {
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        guard error == nil else { signedIn?(nil, error.localizedDescription); return }
        
        guard let email = signIn.currentUser.profile.email,
            let name = signIn.currentUser.profile.name
            else { signedIn?(nil, "Can't access the email"); return }
        
        let userInfo = GoogleAuthInfo(email: email, name: name)
        
        signedIn?(userInfo, nil)
    }
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        loggedOut?()
    }
}
