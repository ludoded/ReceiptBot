//
//  ConvertedInvoiceResponse.swift
//  ReceiptBot
//
//  Created by Haik Ampardjian on 4/4/17.
//  Copyright © 2017 receiptbot. All rights reserved.
//

import Foundation
import SwiftyJSON

/// DTO for response on fetching Sync Data
struct SyncConvertedInvoiceResponse: JSONable {
    let categoryId: String
    let convertedInvoiceId: String
    let currencyId: String
    let dueDate: Date?
    let entityId: String
    let filePath: String
    let fileName: String
    let grossAmount: String
    let invoiceNumber: String
    let invoiceDateMobile: Date?
    let invoiceComment: String
    let netAmount: String
    let originalInvoiceId: String
    let originalFileName: String
    let paymentMethodId: Int
    let paymentMethod: String
    let supplierId: Int
    let supplierName: String
    let taxAmount: String
    let taxPercentage: Int
    let type: String
    
    init(json: JSON) {
        self.categoryId = json["CategoryId"].stringValue
        self.convertedInvoiceId = json["ConvertedInvoiceId"].stringValue
        self.currencyId = json["CurrencyId"].stringValue
        self.dueDate = json["DueDate"].mdytaDate
        self.entityId = json["EntityId"].stringValue
        self.filePath = json["FilePath"].stringValue
        self.fileName = json["File_Name"].stringValue
        self.invoiceNumber = json["InvoiceNumber"].stringValue
        self.invoiceDateMobile = json["InvoicedateMobile"].mdytaDate
        self.invoiceComment = json["InvoiceComment"].stringValue
        self.netAmount = json["NetAmount"].stringValue
        self.originalInvoiceId = json["OrgInvoiceId"].stringValue
        self.originalFileName = json["OriginalFileName"].stringValue
        self.paymentMethodId = json["PaymentMethodId"].intValue
        self.paymentMethod = json["PaymentMethod"].stringValue
        self.supplierId = json["SupplierId"].intValue
        self.taxAmount = json["TaxAmount"].stringValue
        self.taxPercentage = json["TaxPercentage"].intValue
        self.type = json["Type"].stringValue
        
        /// Additional validation
        let gross = json["Gross_Amount"].stringValue
        self.grossAmount = gross.isEmpty ? "0.00" : gross
        
        let supplier = json["SupplierName"].stringValue
        self.supplierName = supplier.isEmpty ? "Supplier Name" : supplier
    }
}
