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
        let valInt = Int(value)
        return RebotDateConverter.convertToMonth(from: valInt)
    }
}
