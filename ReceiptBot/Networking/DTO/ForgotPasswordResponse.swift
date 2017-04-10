//
//  ForgotPasswordResponse.swift
//  ReceiptBot
//
//  Created by Haik Ampardjian on 4/4/17.
//  Copyright © 2017 receiptbot. All rights reserved.
//

import Foundation
import SwiftyJSON

/// Struct for response when requesting forgot password endpoint OR update converted invoice mobile
struct StatusDetailResponse: JSONable {
    let originalInvoiceId: String
    let details: String
    let error: String
    let isEmailVerified: Bool
    let status: Bool
    
    init(json: JSON) {
        self.originalInvoiceId = json["OriginalInvoiceId"].stringValue
        self.details = json["details"].stringValue
        self.error = json["error"].stringValue
        self.isEmailVerified = json["isEmailVerified"].boolValue
        self.status = json["status"].boolValue
    }
}
