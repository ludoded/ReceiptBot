//
//  TextField+Rebotise.swift
//  ReceiptBot
//
//  Created by Haik Ampardjian on 4/8/17.
//  Copyright © 2017 receiptbot. All rights reserved.
//

import Material

extension TextField {
    func rebotize() {
        self.placeholderNormalColor = .lightText
        self.placeholderActiveColor = RebotColor.Text.green
        self.textColor = .lightText
        self.dividerNormalColor = .lightText
        self.dividerActiveColor = RebotColor.Text.green
        
        self.dividerActiveHeight = 1.0
        self.dividerNormalHeight = 2.0
    }
}
