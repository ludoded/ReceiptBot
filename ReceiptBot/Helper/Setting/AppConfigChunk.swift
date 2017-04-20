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
    
    func categoryName(for id: String) -> String {
        guard let name = categories.filter({ String($0.masterId) == id }).first?.category else { return "" }
        return name
    }
    
    func categoryId(by name: String) -> String {
        guard let id = categories.filter({ $0.category == name }).first?.masterId else { return "" }
        return String(id)
    }
    
    func supplierId(by name: String) -> Int {
        guard let id = suppliers.filter({ $0.companyName == name }).first?.vendorId else { return 0 }
        return id
    }
    
    /// MARK: Private methods
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
