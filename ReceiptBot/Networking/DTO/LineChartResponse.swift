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
    let date: Date?
    let grossAmount: String
    let grossAmountMonth1: Int
    let grossAmountMonth2: Int
    let grossAmountMonth3: Int
    let grossAmountMonth4: Int
    let grossAmountMonth5: Int
    let grossAmountMonth6: Int
    let month: String
    let month1: Int
    let month2: Int
    let month3: Int
    let month4: Int
    let month5: Int
    let month6: Int
    let month1Name: String
    let month2Name: String
    let month3Name: String
    let month4Name: String
    let month5Name: String
    let month6Name: String
    let supplierName: String
    let totalGrossAmount: Int
    
    init(json: JSON) {
        self.date = json["Date"].mdytaDate
        self.grossAmount = json["GrossAmount"].stringValue
        self.grossAmountMonth1 = json["GrossAmountMonth1"].intValue
        self.grossAmountMonth2 = json["GrossAmountMonth2"].intValue
        self.grossAmountMonth3 = json["GrossAmountMonth3"].intValue
        self.grossAmountMonth4 = json["GrossAmountMonth4"].intValue
        self.grossAmountMonth5 = json["GrossAmountMonth5"].intValue
        self.grossAmountMonth6 = json["GrossAmountMonth6"].intValue
        self.month = json["Month"].stringValue
        self.month1 = json["Month1"].intValue
        self.month2 = json["Month2"].intValue
        self.month3 = json["Month3"].intValue
        self.month4 = json["Month4"].intValue
        self.month5 = json["Month5"].intValue
        self.month6 = json["Month6"].intValue
        self.month1Name = json["Month1Name"].stringValue
        self.month2Name = json["Month2Name"].stringValue
        self.month3Name = json["Month3Name"].stringValue
        self.month4Name = json["Month4Name"].stringValue
        self.month5Name = json["Month5Name"].stringValue
        self.month6Name = json["Month6Name"].stringValue
        self.supplierName = json["SupplierName"].stringValue
        self.totalGrossAmount = json["totalGrossAmount"].intValue
    }
}
