//
//  RebotInvoiceStatusMapper.swift
//  ReceiptBot
//
//  Created by Haik Ampardjian on 5/2/17.
//  Copyright © 2017 receiptbot. All rights reserved.
//

import Foundation

struct RebotInvoiceStatusMapper {
    static func toFrontEnd(from backEndStatus: String) -> String {
        switch backEndStatus {
        case "Uploaded",
             "Extracted Part",
             "Match Failed",
             "Review":
            return "Processing"
            
        case "Extracted Full",
             "Data Entered":
            return "Processed"
            
        default: return backEndStatus
        }
    }
}
