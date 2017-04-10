//
//  UIScrollView+keyboard.swift
//  ReceiptBot
//
//  Created by Haik Ampardjian on 4/8/17.
//  Copyright © 2017 receiptbot. All rights reserved.
//

import UIKit

extension UIScrollView {
    func setContentInsetAndScrollIndicatorInsets(_ edgeInsets: UIEdgeInsets) {
        self.contentInset = edgeInsets
        self.scrollIndicatorInsets = edgeInsets
    }
}
