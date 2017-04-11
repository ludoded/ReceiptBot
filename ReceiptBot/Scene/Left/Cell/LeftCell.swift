//
//  LeftCell.swift
//  ReceiptBot
//
//  Created by Haik Ampardjian on 4/12/17.
//  Copyright © 2017 receiptbot. All rights reserved.
//

import UIKit

final class LeftCell: UITableViewCell {
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var name: UILabel!
    
    func setup(with viewModel: LeftDataSourceModel.ViewModel) {
        logo.image = UIImage(named: viewModel.imageName)
        name.text = viewModel.name
    }
}
