//
//  InboxDataSourceViewController.swift
//  ReceiptBot
//
//  Created by Haik Ampardjian on 4/7/17.
//  Copyright (c) 2017 receiptbot. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit

protocol InboxDataSourceOutput {
    func fetchInvoices()
}

protocol InboxDataSourceVCOutput {
    func startUpdatingTableView()
    func finishUpdatingTableView()
    func didSelect(at row: Int)
}

class InboxDataSource: NSObject, UITableViewDelegate, UITableViewDataSource {
    var output: InboxDataSourceOutput!
    var vcOutput: InboxDataSourceVCOutput!
    var model: InboxDataSourceModel.Invoices.ViewModel!

    // MARK: - Object lifecycle
    override init() {
        super.init()
        InboxDataSourceConfigurator.sharedInstance.configure(dataSource: self)
        fetchInvoices()
    }

    // MARK: - Event handling

    func fetchInvoices() {
        /// Fetch Invoices from internet
        output.fetchInvoices()
    }

    // MARK: - Display logic

    func update(model: InboxDataSourceModel.Invoices.ViewModel) {
        /// Replace current model with newer
        self.model = model
        
        /// Notify to reload the tableView
        vcOutput?.finishUpdatingTableView()
    }
    
    /// MARK: Table View methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: InboxCell.cellId, for: indexPath) as? InboxCell else { fatalError("Can't load the cell!") }
        
        let cellModel = model.cellModel(for: indexPath)
        cell.setup(with: cellModel)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44.0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        vcOutput.didSelect(at: indexPath.row)
    }
}
