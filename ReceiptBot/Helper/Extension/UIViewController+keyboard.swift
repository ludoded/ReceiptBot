//
//  UIViewController+keyboard.swift
//  ReceiptBot
//
//  Created by Haik Ampardjian on 4/8/17.
//  Copyright © 2017 receiptbot. All rights reserved.
//

import UIKit

extension UIViewController {
    func registerForKeyboardWillShowNotification(_ scrollView: UIScrollView, usingBlock block: ((CGSize?) -> Void)? = nil) {
        NotificationCenter.default.addObserver(forName: NSNotification.Name.UIKeyboardWillShow, object: nil, queue: nil, using: { (notification) -> Void in
            let userInfo = notification.userInfo!
            let keyboardSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue.size
            let contentInsets = UIEdgeInsetsMake(scrollView.contentInset.top, scrollView.contentInset.left, keyboardSize.height, scrollView.contentInset.right)
            
            scrollView.setContentInsetAndScrollIndicatorInsets(contentInsets)
            block?(keyboardSize)
        })
    }
    
    func registerForKeyboardDidShowNotification(_ scrollView: UIScrollView, usingBlock block: ((CGSize?) -> Void)? = nil) {
        NotificationCenter.default.addObserver(forName: NSNotification.Name.UIKeyboardDidShow, object: nil, queue: nil, using: { (notification) -> Void in
            let userInfo = notification.userInfo!
            let keyboardSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue.size
            let contentInsets = UIEdgeInsetsMake(scrollView.contentInset.top, scrollView.contentInset.left, keyboardSize.height, scrollView.contentInset.right)
            
            scrollView.setContentInsetAndScrollIndicatorInsets(contentInsets)
            block?(keyboardSize)
        })
    }
    
    func registerForKeyboardWillHideNotification(_ scrollView: UIScrollView, usingBlock block: ((Void) -> Void)? = nil) {
        NotificationCenter.default.addObserver(forName: NSNotification.Name.UIKeyboardWillHide, object: nil, queue: nil, using: { (notification) -> Void in
            let contentInsets = UIEdgeInsetsMake(scrollView.contentInset.top, scrollView.contentInset.left, 0, scrollView.contentInset.right)
            scrollView.setContentInsetAndScrollIndicatorInsets(contentInsets)
            block?()
        })
    }
}
