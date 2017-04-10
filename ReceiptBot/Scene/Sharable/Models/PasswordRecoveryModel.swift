//
//  PasswordRecoveryModel.swift
//  ReceiptBot
//
//  Created by Haik Ampardjian on 4/10/17.
//  Copyright © 2017 receiptbot. All rights reserved.
//

import UIKit

struct PasswordRecoveryModel {
    struct Request {
        let email: String
    }
    
    struct Response {
        let status: RebotValueWrapper<StatusDetailResponse>
    }
}
