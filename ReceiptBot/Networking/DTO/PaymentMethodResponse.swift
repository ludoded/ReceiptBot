//
//  PaymentMethodResponse.swift
//  ReceiptBot
//
//  Created by Haik Ampardjian on 5/2/17.
//  Copyright © 2017 receiptbot. All rights reserved.
//

import Foundation
import SwiftyJSON

struct PaymentMethodResponse: JSONable {
    let methodId: Int
    let name: String
    
    init(json: JSON) {
        self.methodId = json["PaymentMethodDetailId"].intValue
        self.name = json["ShortName"].stringValue
    }
}
