//
//  RefreshControlOutput.swift
//  ReceiptBot
//
//  Created by Haik Ampardjian on 4/20/17.
//  Copyright © 2017 receiptbot. All rights reserved.
//

import UIKit

protocol RefreshControlOutput: class {
    var scrollView: UIScrollView! { get set }
    var refresh: UIRefreshControl! { get set }
    
    func setupRefresh(sel: Selector)
    func reload()
}

extension RefreshControlOutput where Self: UIViewController {
    func setupRefresh(sel: Selector) {
        refresh = UIRefreshControl()
        refresh.addTarget(self, action: sel, for: .valueChanged)
        scrollView.addSubview(refresh)
        scrollView.alwaysBounceVertical = true
    }
}
