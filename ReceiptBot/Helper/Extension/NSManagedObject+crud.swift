//
//  NSManagedObject+crud.swift
//  ReceiptBot
//
//  Created by Haik Ampardjian on 4/8/17.
//  Copyright © 2017 receiptbot. All rights reserved.
//

import CoreData

extension NSManagedObjectContext {
    func insertObject<A: NSManagedObject>() -> A where A: Managed {
        guard let obj = NSEntityDescription.insertNewObject(forEntityName: A.entityName, into: self) as? A else { fatalError("Wrong object type") }
        return obj
    }
}

extension NSManagedObjectContext {
    @discardableResult
    public func saveOrRollback() -> Bool {
        do {
            try save()
            return true
        } catch {
            rollback()
            return false
        }
    }
    
    public func performChanges(block: @escaping () -> ()) {
        perform {
            block()
            self.saveOrRollback()
        }
    }
}
