//
//  QboCategory.swift
//  ReceiptBot
//
//  Created by Haik Ampardjian on 4/8/17.
//  Copyright © 2017 receiptbot. All rights reserved.
//

import CoreData

@objc(QboCategory)
final class QboCategory: NSManagedObject {
    @NSManaged fileprivate(set) var name: String?
    @NSManaged fileprivate(set) var qboId: NSNumber?
    
    static func insert(into context: NSManagedObjectContext, response: QBExpenseCategoryResponse) -> QboCategory {
        let qbo: QboCategory = context.insertObject()
        qbo.name = response.name
        qbo.qboId = NSNumber(value: response.qboId)
        
        return qbo
    }
}

extension QboCategory: Managed, ManagedCrud {
    typealias R = QBExpenseCategoryResponse
}
