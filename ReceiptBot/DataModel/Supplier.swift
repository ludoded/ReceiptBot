//
//  Supplier.swift
//  ReceiptBot
//
//  Created by Haik Ampardjian on 4/8/17.
//  Copyright © 2017 receiptbot. All rights reserved.
//

import CoreData

@objc(Supplier)
final class Supplier: NSManagedObject {
    @NSManaged fileprivate(set) var supplierName: String?
    @NSManaged fileprivate(set) var vendorId: NSNumber?
    
    static func insert(into context: NSManagedObjectContext, response: SupplierResponse) -> Supplier {
        let supplier: Supplier = context.insertObject()
        supplier.supplierName = response.companyName
        supplier.vendorId = NSNumber(value: response.vendorId)
        
        return supplier
    }
}

extension Supplier: Managed, ManagedCrud {
    typealias R = SupplierResponse
}
