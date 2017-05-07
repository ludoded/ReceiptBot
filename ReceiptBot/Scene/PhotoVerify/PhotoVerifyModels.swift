//
//  PhotoVerifyModels.swift
//  ReceiptBot
//
//  Created by Haik Ampardjian on 4/13/17.
//  Copyright (c) 2017 receiptbot. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit

struct PhotoVerify {
    struct Upload {
        struct Request {
            let image: UIImage!
        }
        
        struct Params {
            let fileNameToSave: String
            let fileNameOriginal: String
            let serverLocation: String
            let organisationName: String
            let companyName: String
            let companyId: Int
            let userId: String
            let fileExtension: String
            let folderType: String
            let mobileData: String
            let originalInvoiceId: String
            let originalInvoiceStatus: String
            let filePath: String
            
            var params: [String : Any] {
                return [
                    "fileNameToSave" : fileNameToSave,
                    "fileNameOrignal" : fileNameOriginal,
                    "serverLocation" : serverLocation,
                    "OrganizationName" : organisationName,
                    "CompanyName" : companyName,
                    "CompanyId" : companyId,
                    "Userid" : userId,
                    "fileExtension" : fileExtension,
                    "FolderType" : folderType,
                    "MobileData" : mobileData,
                    "OriginalInvoiceId" : originalInvoiceId,
                    "OriginalInvoicestatus" : originalInvoiceStatus,
                    "FilePath" : filePath
                ]
            }
        }
        
        struct Response {
            let data: RebotValueWrapper<FileUploadResponse>
        }
    }
}
