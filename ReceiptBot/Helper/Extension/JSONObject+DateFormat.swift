//
//  RBDateFormatter.swift
//  ReceiptBot
//
//  Created by Haik Ampardjian on 4/4/17.
//  Copyright © 2017 receiptbot. All rights reserved.
//

import Foundation
import SwiftyJSON

extension JSON {    
    var mdytaDate: Date? {
        get {
            return DateFormatters.mdytaFormatter.date(from: self.stringValue)
        }
    }
}
