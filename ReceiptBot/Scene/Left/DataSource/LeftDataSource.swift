//
//  LeftDataSource.swift
//  ReceiptBot
//
//  Created by Haik Ampardjian on 4/12/17.
//  Copyright © 2017 receiptbot. All rights reserved.
//

import UIKit

enum LeftDataSourceType {
    case invoice
    case logout
    
    static func type(from indexPath: IndexPath) -> LeftDataSourceType {
        switch indexPath.row {
        case 0: return .invoice
        default: return .logout
        }
    }
}

protocol LeftDataSourceOutput {
    func didSelect(type: LeftDataSourceType)
}

protocol LeftDataSourceInteractorOutput {
    var viewModels: [LeftDataSourceModel.ViewModel] { get }
}

final class LeftDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    var output: LeftDataSourceOutput!
    var interactorOutput: LeftDataSourceInteractorOutput!
    
    override init() {
        super.init()
        LeftDataSourceConfigurator.sharedInstance.configure(dataSource: self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return interactorOutput.viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: LeftCell.cellId, for: indexPath) as? LeftCell else { fatalError("Can't load the cell!") }
        cell.setup(with: interactorOutput.viewModels[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        output.didSelect(type: LeftDataSourceType.type(from: indexPath))
    }
}
