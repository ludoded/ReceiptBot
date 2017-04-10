//
//  GetConvertedInvoiceResponse.swift
//  ReceiptBot
//
//  Created by Haik Ampardjian on 4/4/17.
//  Copyright © 2017 receiptbot. All rights reserved.
//

import Foundation
import SwiftyJSON

/// struct for respnse when fetching all converted invoices data
struct GetConveretedInvoiceResponse: JSONable {
    let categoryId: String
    let categoryName: String
    let convertedDate: Date?
    let convertedInvoiceId: Int
    let currencyId: String
    let currencyName: String
    let dDate: Date?
    let dueDate: Date?
    let entityId: Int
    let entityName: String
    let filePath: String
    let fileName: String
    let grossAmount: String
    let invoiceDate: Date?
    let invoiceNumber: String
    let netAmount: String
    let orgInvoiceId: Int
    let originalFileName: String
    let remarks: String
    let status: String
    let supplierName: String
    let taxAmount: String
    let taxPercentage: Int
    let type: String
    let uploadedDate: Date?
    
    init(json: JSON) {
        self.categoryId = json["CategoryId"].stringValue
        self.categoryName = json["CategoryName"].stringValue
        self.convertedDate = json["ConvertedDate"].mdytaDate
        self.convertedInvoiceId = json["ConvertedInvoiceId"].intValue
        self.currencyId = json["CurrencyId"].stringValue
        self.currencyName = json["CurrencyName"].stringValue
        self.dDate = json["DDate"].mdytaDate
        self.dueDate = json["DueDate"].mdytaDate
        self.entityId = json["EntityId"].intValue
        self.entityName = json["EntityName"].stringValue
        self.filePath = json["FilePath"].stringValue
        self.fileName = json["File_Name"].stringValue
        self.grossAmount = json["Gross_Amount"].stringValue
        self.invoiceDate = json["InvoiceDate"].mdytaDate
        self.invoiceNumber = json["Invoice_Number"].stringValue
        self.netAmount = json["Net_Amount"].stringValue
        self.orgInvoiceId = json["Org_Invoice_Id"].intValue
        self.originalFileName = json["OriginalFileName"].stringValue
        self.remarks = json["Remarks"].stringValue
        self.status = json["Status"].stringValue
        self.supplierName = json["Supplier_Name"].stringValue
        self.taxAmount = json["Tax_Amount"].stringValue
        self.taxPercentage = json["Tax_Percentage"].intValue
        self.type = json["Type"].stringValue
        self.uploadedDate = json["Uploaded_Date"].mdytaDate
    }
}
