//
//  InvoiceStatusToShowResponse.swift
//  ReceiptBot
//
//  Created by Haik Ampardjian on 4/4/17.
//  Copyright © 2017 receiptbot. All rights reserved.
//

import Foundation
import SwiftyJSON

/// struct for response when fetching invoices for pie chart
struct InvoiceStatusToShowResponse: JSONable {
    let approvedTotal: Int
    let exportedTotal: Int
    let pendingTotal: Int
    let processingTotal: Int
    let rejectedTotal: Int
    
    var total: Double {
        return Double(approvedTotal + exportedTotal + pendingTotal + processingTotal + rejectedTotal)
    }
    
    init(json: JSON) {
        self.approvedTotal = json["ApprovedTotal"].intValue
        self.exportedTotal = json["ExportedTotal"].intValue
        self.pendingTotal = json["PendingTotal"].intValue
        self.processingTotal = json["ProcessingTotal"].intValue
        self.rejectedTotal = json["RejectedTotal"].intValue
    }
}
