//
//  XeroExpenseCategoryResponse.swift
//  ReceiptBot
//
//  Created by Haik Ampardjian on 4/4/17.
//  Copyright © 2017 receiptbot. All rights reserved.
//

import Foundation
import SwiftyJSON

/// struct for response when fetching all xero expense categories
struct XeroExpenseCategoryResponse: JSONable {
    let name: String
    let xeroId: Int
    
    init(json: JSON) {
        self.name = json["Name"].stringValue
        self.xeroId = json["Xero_id"].intValue
    }
}
