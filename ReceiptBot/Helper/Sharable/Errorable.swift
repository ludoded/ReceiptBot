//
//  Errorable.swift
//  ReceiptBot
//
//  Created by Haik Ampardjian on 4/5/17.
//  Copyright © 2017 receiptbot. All rights reserved.
//

import BRYXBanner

enum ViewControllerMessageType {
    case error(message: String)
    case success(message: String)
}

protocol Errorable {
    func show(type messageType: ViewControllerMessageType)
}

extension Errorable where Self: UIViewController {
    func show(type messageType: ViewControllerMessageType) {
        var title: String
        var subtitle: String
        var color: UIColor
        
        switch messageType {
        case .error(let message):
            title = "Oops!"
            subtitle = message
            color = RebotColor.VCColor.error
        case .success(let message):
            title = "Yay!"
            subtitle = message
            color = RebotColor.VCColor.success
        }
        
        let banner = Banner(title: title, subtitle: subtitle, backgroundColor: color)
        banner.show(duration: 2.0)
    }
}
