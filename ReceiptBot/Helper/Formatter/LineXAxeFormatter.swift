//
//  LineXAxeFormatter.swift
//  ReceiptBot
//
//  Created by Haik Ampardjian on 4/6/17.
//  Copyright © 2017 receiptbot. All rights reserved.
//

import Foundation
import Charts

class LineXAxeFormatter: NSObject, IAxisValueFormatter {
    func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        let date = Date(timeIntervalSince1970: value)
        return DateFormatters.mFormatter.string(from: date)
    }
}
