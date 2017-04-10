//
//  SupplierResponse.swift
//  ReceiptBot
//
//  Created by Haik Ampardjian on 4/4/17.
//  Copyright © 2017 receiptbot. All rights reserved.
//

import Foundation
import SwiftyJSON

struct SupplierResponse: JSONable {
    let accountingSoftwareId: Int
    let address: String
    let bankAccountNumber: String
    let bankName: String
    let category: String
    let companyName: String
    let contactNumber: String
    let currency: String
    let email: String
    let entityId: Int
    let externalSystemCode: String
    let isActive: Bool
    let paypalEmail: String
    let postCode: String
    let rebotVendorCode: String
    let rebotVendorMasterId: String
    let sortCode: String
    let swiftCode: String
    let vatNumber: String
    let vendorFirstName: String
    let vendorId: Int
    let vendorLastName: String
    
    init(json: JSON) {
        self.accountingSoftwareId = json["AccountingSoftwareId"].intValue
        self.address = json["Address"].stringValue
        self.bankAccountNumber = json["BankAccountNumber"].stringValue
        self.bankName = json["BankName"].stringValue
        self.category = json["Category"].stringValue
        self.companyName = json["CompanyName"].stringValue
        self.contactNumber = json["ContactNumber"].stringValue
        self.currency = json["Currency"].stringValue
        self.email = json["Email"].stringValue
        self.entityId = json["EntityId"].intValue
        self.externalSystemCode = json["ExtarnalSystemCode"].stringValue /// Misspeled in API pdf
        self.isActive = json["IsActive"].boolValue
        self.paypalEmail = json["PaypalEmail"].stringValue
        self.postCode = json["PostCode"].stringValue
        self.rebotVendorCode = json["RebotVendorCode"].stringValue
        self.rebotVendorMasterId = json["RebotVerdorMasterId"].stringValue /// Misspeled in API pdf
        self.sortCode = json["SortCode"].stringValue
        self.swiftCode = json["SwiftCode"].stringValue
        self.vatNumber = json["VatNumber"].stringValue
        self.vendorFirstName = json["VendorFirstName"].stringValue
        self.vendorId = json["VendorId"].intValue
        self.vendorLastName = json["VendorLastName"].stringValue
    }
}
