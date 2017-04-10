//
//  QBExpenseCategoryResponse.swift
//  ReceiptBot
//
//  Created by Haik Ampardjian on 4/4/17.
//  Copyright © 2017 receiptbot. All rights reserved.
//

import Foundation
import SwiftyJSON

struct QBExpenseCategoryResponse: JSONable {
    let name: String
    let qboId: Int
    
    init(json: JSON) {
        self.name = json["name"].stringValue
        self.qboId = json["Qbo_id"].intValue
    }
}
