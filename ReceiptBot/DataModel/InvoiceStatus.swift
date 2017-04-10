//
//  InvoiceStatus.swift
//  ReceiptBot
//
//  Created by Haik Ampardjian on 4/8/17.
//  Copyright © 2017 receiptbot. All rights reserved.
//

import CoreData

@objc(InvoiceStatus)
final class InvoiceStatus: NSManagedObject {
    @NSManaged fileprivate(set) var id: NSNumber
    @NSManaged fileprivate(set) var pending: NSNumber
    @NSManaged fileprivate(set) var processing: NSNumber
    @NSManaged fileprivate(set) var approved: NSNumber
    @NSManaged fileprivate(set) var exported: NSNumber
    @NSManaged fileprivate(set) var rejected: NSNumber
    
    static func insert(into context: NSManagedObjectContext, response: InvoiceStatusToShowResponse) -> InvoiceStatus {
        let status: InvoiceStatus = context.insertObject()
        status.id = NSNumber(value: 1) /// NOTE: this is how android implements `id` defining
        status.pending = NSNumber(value: response.pendingTotal)
        status.processing = NSNumber(value: response.processingTotal)
        status.approved = NSNumber(value: response.approvedTotal)
        status.exported = NSNumber(value: response.exportedTotal)
        status.rejected = NSNumber(value: response.rejectedTotal)
        
        return status
    }
}

extension InvoiceStatus: Managed, ManagedCrud {
    typealias R = InvoiceStatusToShowResponse
}
