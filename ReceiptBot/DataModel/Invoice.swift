//
//  Invoice.swift
//  ReceiptBot
//
//  Created by Haik Ampardjian on 4/8/17.
//  Copyright © 2017 receiptbot. All rights reserved.
//

import CoreData

@objc(Invoice)
final class Invoice: NSManagedObject {
    @NSManaged fileprivate(set) var status: String?
    @NSManaged fileprivate(set) var supplierId: String?
    @NSManaged fileprivate(set) var invoiceDate: Date?
    @NSManaged fileprivate(set) var invoiceNumber: String?
    @NSManaged fileprivate(set) var taxPercentage: String?
    @NSManaged fileprivate(set) var taxAmount: String?
    @NSManaged fileprivate(set) var grossAmount: String?
    @NSManaged fileprivate(set) var netAmount: String?
    @NSManaged fileprivate(set) var fileName: String?
    @NSManaged fileprivate(set) var uploadedDate: Date?
    @NSManaged fileprivate(set) var imagePath: String?
    @NSManaged fileprivate(set) var originalInvoiceId: String?
    @NSManaged fileprivate(set) var originalFilename: String?
    @NSManaged fileprivate(set) var invoiceDueDate: Date?
    @NSManaged fileprivate(set) var convertedInvoiceId: String?
    
    static func insert(into context: NSManagedObjectContext, response: SyncConvertedInvoiceResponse) -> Invoice {
        let invoice: Invoice = context.insertObject()
        invoice.status = "Processing"
        invoice.supplierId = String(response.supplierId)
        invoice.invoiceDate = response.invoiceDateMobile
        invoice.invoiceNumber = response.invoiceNumber
        invoice.taxPercentage = String(response.taxPercentage)
        invoice.taxAmount = response.taxAmount
        invoice.grossAmount = response.grossAmount
        invoice.netAmount = response.netAmount
        invoice.fileName = response.fileName
        invoice.uploadedDate = Date() /// NOTE: in Android it just sets to '123', so I have no idea where should I take it from
        invoice.imagePath = response.filePath
        invoice.originalInvoiceId = response.originalInvoiceId
        invoice.originalFilename = response.originalFileName
        invoice.invoiceDueDate = response.dueDate
        invoice.convertedInvoiceId = response.convertedInvoiceId
        
        return invoice
    }
}

extension Invoice: Managed, ManagedCrud {
    typealias R = SyncConvertedInvoiceResponse
}
