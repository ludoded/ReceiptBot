//
//  Supplier.swift
//  ReceiptBot
//
//  Created by Haik Ampardjian on 4/8/17.
//  Copyright © 2017 receiptbot. All rights reserved.
//

import CoreData

@objc(Expense)
final class Expense: NSManagedObject {
    @NSManaged fileprivate(set) var amount1: String?
    @NSManaged fileprivate(set) var amount2: String?
    @NSManaged fileprivate(set) var amount3: String?
    @NSManaged fileprivate(set) var amount4: String?
    @NSManaged fileprivate(set) var amount5: String?
    @NSManaged fileprivate(set) var amount6: String?
    @NSManaged fileprivate(set) var month1: String?
    @NSManaged fileprivate(set) var month2: String?
    @NSManaged fileprivate(set) var month3: String?
    @NSManaged fileprivate(set) var month4: String?
    @NSManaged fileprivate(set) var month5: String?
    @NSManaged fileprivate(set) var month6: String?
    
    static func insert(into context: NSManagedObjectContext, response: LineChartResponse) -> Expense {
        let expense: Expense = context.insertObject()
//        expense.amount1 = String(response.grossAmountMonth1)
//        expense.amount2 = String(response.grossAmountMonth2)
//        expense.amount3 = String(response.grossAmountMonth3)
//        expense.amount4 = String(response.grossAmountMonth4)
//        expense.amount5 = String(response.grossAmountMonth5)
//        expense.amount6 = String(response.grossAmountMonth6)
//        expense.month1 = RebotDateConverter.convertToMonth(from: response.month1)
//        expense.month2 = RebotDateConverter.convertToMonth(from: response.month2)
//        expense.month3 = RebotDateConverter.convertToMonth(from: response.month3)
//        expense.month4 = RebotDateConverter.convertToMonth(from: response.month4)
//        expense.month5 = RebotDateConverter.convertToMonth(from: response.month5)
//        expense.month6 = RebotDateConverter.convertToMonth(from: response.month6)
        
        return expense
    }
}

extension Expense: Managed, ManagedCrud {
    typealias R = LineChartResponse
}
