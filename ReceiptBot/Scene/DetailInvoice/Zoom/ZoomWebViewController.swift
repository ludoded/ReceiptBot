//
//  ZoomWebViewController.swift
//  ReceiptBot
//
//  Created by Haik Ampardjian on 5/18/17.
//  Copyright © 2017 receiptbot. All rights reserved.
//

import UIKit

final class ZoomWebViewController: UIViewController {
    @IBOutlet weak var webView: UIWebView!
    
    var url: URL?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let url = url else { return }
        let request = URLRequest(url: url)
        webView.loadRequest(request)
    }
}
