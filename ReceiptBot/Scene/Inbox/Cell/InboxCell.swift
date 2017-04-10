//
//  InboxCell.swift
//  ReceiptBot
//
//  Created by Haik Ampardjian on 4/6/17.
//  Copyright © 2017 receiptbot. All rights reserved.
//

import UIKit

final class InboxCell: UITableViewCell {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var paidOn: UILabel!
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var currency: UILabel!
    
    func setup(with viewModel: InboxDataSourceModel.Cell.ViewModel) {
        self.name.text = viewModel.name
        self.paidOn.text = viewModel.paidOn
        self.status.text = viewModel.status
        self.currency.text = viewModel.currency
    }
}
