//
//  AppConfigChunk.swift
//  ReceiptBot
//
//  Created by Haik Ampardjian on 4/20/17.
//  Copyright © 2017 receiptbot. All rights reserved.
//

import Foundation

enum AppConfigFetchingState {
    case loaded, loading
}

final class AppConfigChunk {
    let accountId: String
    let entityId: Int
    
    var categories: [CategoryResponse]!
    var suppliers: [SupplierResponse]!
    
    /// Private vars
    fileprivate var categoryState: AppConfigFetchingState!
    fileprivate var supplierState: AppConfigFetchingState!
    
    static let shared = AppConfigChunk()
    
    private init() {
        let user = AppSettings.shared.user
        
        self.accountId = user?.accountPackageIdMobile ?? "3"
        self.entityId = user?.entityId ?? 0
    }
    
    func loadConfigs(callback: @escaping () -> ()) {
        categoryState = .loading
        supplierState = .loading
        
        fetchCategories { [weak self] in self?.validateFetchingState(callback: callback) }
        fetchSuppliers { [weak self] in self?.validateFetchingState(callback: callback) }
    }
    
    func reset() {
        categories = nil
        suppliers = nil
    }
    
    private func validateFetchingState(callback: @escaping () -> ()) {
        if categoryState == .loaded && supplierState == .loaded { callback(); return }
    }
    
    private func fetchCategories(callback: @escaping () -> ()) {
        CategoryResponse.load(request: API.allExpense(with: self.accountId, and: self.entityId)) { [weak self] (categories, message) in
            self?.categoryState = .loaded
            guard message == nil else {
                self?.categories = []
                callback()
                return
            }
            
            self?.categories = categories
            callback()
        }
    }
    
    private func fetchSuppliers(callback: @escaping () -> ()) {
        SupplierResponse.load(request: API.suppliers(with: self.accountId, and: self.entityId)) { [weak self] (suppliers, message) in
            self?.supplierState = .loaded
            guard message == nil else {
                self?.suppliers = []
                callback()
                return
            }
            
            self?.suppliers = suppliers
            callback()
        }
    }
}