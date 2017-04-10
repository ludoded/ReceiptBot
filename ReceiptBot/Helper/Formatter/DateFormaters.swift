//
//  DateFormaters.swift
//  ReceiptBot
//
//  Created by Haik Ampardjian on 4/5/17.
//  Copyright © 2017 receiptbot. All rights reserved.
//

import Foundation

struct DateFormatters {
    static var mdytaFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd yyyy HH:mma"
        
        return formatter
    }
    
    static var mFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM"
        
        return formatter
    }
}
