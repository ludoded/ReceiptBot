//
//  Category.swift
//  ReceiptBot
//
//  Created by Haik Ampardjian on 4/8/17.
//  Copyright © 2017 receiptbot. All rights reserved.
//

import CoreData

@objc(Category)
final class Category: NSManagedObject {
    @NSManaged fileprivate(set) var name: String?
    
    static func insert(into context: NSManagedObjectContext, response: CategoryResponse) -> Category {
        let category: Category = context.insertObject()
        category.name = response.category
        
        return category
    }
}

extension Category: Managed, ManagedCrud {
    typealias R = CategoryResponse
}
