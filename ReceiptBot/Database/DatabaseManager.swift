//
//  DatabaseManager.swift
//  ReceiptBot
//
//  Created by Haik Ampardjian on 4/8/17.
//  Copyright © 2017 receiptbot. All rights reserved.
//

import CoreData

final class DatabaseManager {
    static let shared = DatabaseManager()
    
    var moc: NSManagedObjectContext!
    
    private init() {}
    
    func createPersistentStore(callback: @escaping (_ error: String?) -> ()) {
        if #available(iOS 10.0, *) {
            let container = NSPersistentContainer(name: "ReceiptBot")
            container.loadPersistentStores { [weak self] _, error in
                guard error == nil else { callback(error?.localizedDescription); return }
                self?.moc = container.viewContext
                
                callback(error?.localizedDescription)
            }
        } else {
            self.moc = createViewContext()
            callback(nil)
        }
    }
    
    private func createViewContext() -> NSManagedObjectContext {
        let bundles = [Bundle.main]
        guard let model = NSManagedObjectModel.mergedModel(from: bundles) else { fatalError("model not found") }
        let psc = NSPersistentStoreCoordinator(managedObjectModel: model)
        let storeURL = FileManager.default.urls(for: .libraryDirectory, in: .userDomainMask).last?.appendingPathComponent("ReceiptBot.sqlite")
        try! psc.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: storeURL, options: nil)
        let context = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        context.persistentStoreCoordinator = psc
        return context
    }
}

extension DatabaseManager {
    func insert<T: ManagedCrud>(response: T.R) -> T {
        return T.insert(into: moc, response: response)
    }
    
    func fetch<T: Managed>() -> [T]? {
        let name = T.entityName
        let request = NSFetchRequest<T>(entityName: name)
        let result: [T]? = try? moc.fetch(request)
        
        return result
    }
    
    func removeAll(obj: NSManagedObject) {
        
    }
}
