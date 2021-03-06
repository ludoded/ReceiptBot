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
    var accountId: String!
    var entityId: Int!
    
    var categories: [CategoryResponse]!
    var suppliers: [SupplierResponse]!
    var payments: [PaymentMethodResponse]!
    var taxes: [TaxPercentageResponse]!
    
    /// Private vars
    fileprivate var categoryState: AppConfigFetchingState!
    fileprivate var supplierState: AppConfigFetchingState!
    fileprivate var paymentState: AppConfigFetchingState!
    fileprivate var taxState: AppConfigFetchingState!
    
    static let shared = AppConfigChunk()
    
    private init() {}
    
    func initSetup() {
        let user = AppSettings.shared.user
        
        self.accountId = user?.accountPackageIdMobile ?? "3"
        self.entityId = user?.entityId ?? 0
    }
    
    func loadConfigs(callback: @escaping () -> ()) {
        categoryState = .loading
        supplierState = .loading
        paymentState = .loading
        taxState = .loading
        
        fetchCategories { [weak self] in self?.validateFetchingState(callback: callback) }
        fetchSuppliers { [weak self] in self?.validateFetchingState(callback: callback) }
        fetchPaymentMethod { [weak self] in self?.validateFetchingState(callback: callback) }
        fetchTaxes { [weak self] in self?.validateFetchingState(callback: callback) }
    }
    
    func reset() {
        categories = nil
        suppliers = nil
        payments = nil
        taxes = nil
    }
    
    /// Matching logic
    func categoryId(by name: String) -> String {
        guard let id = categories.filter({ $0.category == name }).first?.masterId else { return "" }
        return String(id)
    }
    
    func categoryName(for id: String) -> String {
        guard let name = categories.filter({ String($0.masterId) == id }).first?.category else { return "" }
        return name
    }
    
    func categoryNames() -> [String] {
        return categories.map({ $0.category })
    }
    
    func supplierId(by name: String) -> Int {
        guard let id = suppliers.filter({ $0.companyName == name }).first?.vendorId else { return 0 }
        return id
    }
    
    func supplierName(for id: Int) -> String {
        guard let name = suppliers.filter({ $0.vendorId == id }).first?.companyName else { return "" }
        return name
    }
    
    func supplierNames() -> [String] {
        return suppliers.map({ $0.companyName })
    }
    
    func taxId(by name: String) -> Int {
        guard let id = taxes.filter({ $0.name == name }).first?.taxId else { return 0 }
        return id
    }
    
    func taxName(for id: Int) -> String {
        guard let name = taxes.filter({ $0.taxId == id }).first?.name else { return "" }
        return name
    }
    
    func taxNames() -> [String] {
        return taxes.map({ $0.name })
    }
    
    func paymentId(by name: String) -> Int {
        guard let id = payments.filter({ $0.name == name }).first?.methodId else { return 0 }
        return id
    }
    
    func paymentName(for id: Int) -> String {
        guard let name = payments.filter({ $0.methodId == id }).first?.name else { return "" }
        return name
    }
    
    func paymentNames() -> [String] {
        return payments.map({ $0.name })
    }
    
    /// MARK: Private methods
    private func validateFetchingState(callback: @escaping () -> ()) {
        if categoryState == .loaded &&
            supplierState == .loaded &&
            paymentState == .loaded &&
            taxState == .loaded
        { callback(); return }
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
    
    private func fetchPaymentMethod(callback: @escaping () -> ()) {
        PaymentMethodResponse.load(request: API.paymentMethod(with: self.entityId)) { [weak self] (methods, message) in
            self?.paymentState = .loaded
            guard message == nil else {
                self?.payments = []
                callback()
                return
            }
            
            self?.payments = methods
            callback()
        }
    }
    
    private func fetchTaxes(callback: @escaping () -> ()) {
        TaxPercentageResponse.load(request: API.taxPercentage(with: self.accountId, and: self.entityId)) { [weak self] (taxes, message) in
            self?.taxState = .loaded
            guard message == nil else {
                self?.taxes = []
                callback()
                return
            }
            
            self?.taxes = taxes
            callback()
        }
    }
}
