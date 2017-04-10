//
//  Managed.swift
//  ReceiptBot
//
//  Created by Haik Ampardjian on 4/8/17.
//  Copyright © 2017 receiptbot. All rights reserved.
//

import CoreData

protocol Managed: class, NSFetchRequestResult {
    static var entityName: String { get }
}

extension Managed where Self: NSManagedObject {
    static var entityName: String {
        if #available(iOS 10.0, *) { return entity().name ?? "" }
        else { return String(describing: self) }
    }
}
