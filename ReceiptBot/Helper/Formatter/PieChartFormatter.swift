//
//  PieChartFormatter.swift
//  ReceiptBot
//
//  Created by Haik Ampardjian on 4/20/17.
//  Copyright © 2017 receiptbot. All rights reserved.
//

import Foundation
import Charts

class PieChartFormatter: NSObject, IValueFormatter {
    let total: Double
    
    init(total: Double) {
        self.total = total
        super.init()
    }
    
    func stringForValue(_ value: Double, entry: ChartDataEntry, dataSetIndex: Int, viewPortHandler: ViewPortHandler?) -> String {
        return String(format: "%.0f", value * total)
    }
}
