//
//  UITableViewCell.swift
//  ReceiptBot
//
//  Created by Haik Ampardjian on 4/6/17.
//  Copyright © 2017 receiptbot. All rights reserved.
//

import UIKit

extension UITableViewCell {
    static var cellId: String {
        return String(describing: self)
    }
    
    static var nib: UINib {
        return UINib(nibName: cellId, bundle: Bundle.main)
    }
}
