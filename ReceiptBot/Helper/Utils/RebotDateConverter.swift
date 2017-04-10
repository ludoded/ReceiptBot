//
//  RebotDateConverter.swift
//  ReceiptBot
//
//  Created by Haik Ampardjian on 4/8/17.
//  Copyright © 2017 receiptbot. All rights reserved.
//

import Foundation

struct RebotDateConverter {
    static func convertToMonth(from monthValue: Int) -> String {
        var comps = Calendar.current.dateComponents([.month], from: Date())
        comps.month = monthValue
        let date = Calendar.current.date(from: comps)
        return DateFormatters.mFormatter.string(from: date!)
    }
}
