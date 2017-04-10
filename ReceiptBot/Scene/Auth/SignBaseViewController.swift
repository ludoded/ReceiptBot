//
//  SignBaseViewController.swift
//  ReceiptBot
//
//  Created by Haik Ampardjian on 4/8/17.
//  Copyright © 2017 receiptbot. All rights reserved.
//

import Material

class SignBaseViewController: UIViewController {
    @IBOutlet var textFields: [ErrorTextField]!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTextFields()
        setupScrollView()
    }
    
    private func setupTextFields() {
        textFields.forEach { $0.rebotize() }
    }
    
    private func setupScrollView() {
        registerForKeyboardDidShowNotification(scrollView)
        registerForKeyboardWillHideNotification(scrollView)
    }
}
