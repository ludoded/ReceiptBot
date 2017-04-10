//
//  Spinnable.swift
//  ReceiptBot
//
//  Created by Haik Ampardjian on 4/9/17.
//  Copyright © 2017 receiptbot. All rights reserved.
//

import MBProgressHUD

protocol Spinnable {
    func startSpinning(with title: String)
    func stopSpinning()
}

extension Spinnable where Self: UIViewController {
    func startSpinning(with title: String = "") {
        let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        hud.label.text = title
    }
    
    func stopSpinning() {
        MBProgressHUD.hide(for: self.view, animated: true)
    }
}
