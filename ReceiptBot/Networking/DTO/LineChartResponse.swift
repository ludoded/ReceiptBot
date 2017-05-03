//
//  LineChartResponse.swift
//  ReceiptBot
//
//  Created by Haik Ampardjian on 4/4/17.
//  Copyright © 2017 receiptbot. All rights reserved.
//

import Foundation
import SwiftyJSON

/// struct for response when fetching line chart data
struct LineChartResponse: JSONable {
    let months: [LineChartMonthResponse]
    
    init(json: JSON) {
        self.months = json["Months"].arrayValue.map(LineChartMonthResponse.init)
    }
}

struct LineChartMonthResponse: JSONable {
    let totalAmount: Int
    let monthYear: Date?
    let count: Int
    
    init(json: JSON) {
        self.totalAmount = json["MonthTotalAmount"].intValue
        self.monthYear = DateFormatters.myFormatter.date(from: json["MonthYear"].stringValue)
        self.count = json["Mounthcount"].intValue
    }
}
