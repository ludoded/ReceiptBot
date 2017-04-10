//
//  FileUploadResponse.swift
//  ReceiptBot
//
//  Created by Haik Ampardjian on 4/4/17.
//  Copyright © 2017 receiptbot. All rights reserved.
//

import Foundation
import SwiftyJSON

/// struct for response when file is uploaded
struct FileUploadResponse: JSONable {
    let companyId: String
    let companyName: String
    let filePath: String
    let folderType: String
    let mobileData: Data?
    let organisationId: String
    let organisationName: String
    let originalInvoiceId: String
    let originalInvoiceStatus: String
    let userId: String
    let fileExtension: String
    let fileNameOriginal: String
    let fileNameToSave: String
    let serverLocation: String
    let statusType: String
    
    init(json: JSON) {
        self.companyId = json["CompanyId"].stringValue
        self.companyName = json["CompanyName"].stringValue
        self.filePath = json["FilePath"].stringValue
        self.folderType = json["FolderType"].stringValue
        self.mobileData = try? json["MobileData"].rawData()
        self.organisationId = json["OrganizationId"].stringValue
        self.organisationName = json["OrganizationName"].stringValue
        self.originalInvoiceId = json["OriginalInvoiceId"].stringValue
        self.originalInvoiceStatus = json["OriginalInvoicestatus"].stringValue
        self.userId = json["Userid"].stringValue
        self.fileExtension = json["fileExtension"].stringValue
        self.fileNameOriginal = json["fileNameOrignal"].stringValue
        self.fileNameToSave = json["fileNameToSave"].stringValue
        self.serverLocation = json["serverLocation"].stringValue
        self.statusType = json["statusType"].stringValue
    }
}
