//
//  XeroCategory.swift
//  ReceiptBot
//
//  Created by Haik Ampardjian on 4/8/17.
//  Copyright © 2017 receiptbot. All rights reserved.
//

import CoreData

@objc(XeroCategory)
final class XeroCategory: NSManagedObject {
    @NSManaged fileprivate(set) var name: String?
    @NSManaged fileprivate(set) var xeroId: NSNumber?
    
    static func insert(into context: NSManagedObjectContext, response: XeroExpenseCategoryResponse) -> XeroCategory {
        let xero: XeroCategory = context.insertObject()
        xero.name = response.name
        xero.xeroId = NSNumber(value: response.xeroId)
        
        return xero
    }
}

extension XeroCategory: Managed, ManagedCrud {
    typealias R = XeroExpenseCategoryResponse
}
