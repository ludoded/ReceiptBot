//
//  ManagedCrud.swift
//  ReceiptBot
//
//  Created by Haik Ampardjian on 4/8/17.
//  Copyright © 2017 receiptbot. All rights reserved.
//

import CoreData

protocol ManagedCrud: class {
    associatedtype R /// Response
    
    static func insert(into context: NSManagedObjectContext, response: R) -> Self
}
