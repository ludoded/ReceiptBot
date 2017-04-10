//
//  NumberFormaters.swift
//  ReceiptBot
//
//  Created by Haik Ampardjian on 4/5/17.
//  Copyright © 2017 receiptbot. All rights reserved.
//

import Foundation

struct NumberFormaters {
    static var pieFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .percent
        formatter.maximumFractionDigits = 1
        formatter.multiplier = NSNumber(floatLiteral: 1)
        formatter.percentSymbol = " %"
        
        return formatter
    }
}
