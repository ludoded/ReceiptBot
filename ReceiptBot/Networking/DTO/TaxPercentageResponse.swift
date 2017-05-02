//
//  TaxPercentageResponse.swift
//  ReceiptBot
//
//  Created by Haik Ampardjian on 5/2/17.
//  Copyright © 2017 receiptbot. All rights reserved.
//

import Foundation
import SwiftyJSON

struct TaxPercentageResponse: JSONable {
    let taxId: Int
    let name: String
    
    init(json: JSON) {
        self.taxId = json["taxPercentageId"].intValue
        self.name = json["Name"].stringValue
    }
}
