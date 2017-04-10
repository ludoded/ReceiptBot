//
//  PagerViewController.swift
//  ReceiptBot
//
//  Created by Haik Ampardjian on 4/5/17.
//  Copyright (c) 2017 receiptbot. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit
import XLPagerTabStrip

protocol PagerViewControllerInput {
    func displaySomething(viewModel: Pager.Something.ViewModel)
}

protocol PagerViewControllerOutput {
    var viewControllers: [UIViewController] { get }
    func doSomething(request: Pager.Something.Request)
}

class PagerViewController: ButtonBarPagerTabStripViewController, PagerViewControllerInput {
    var output: PagerViewControllerOutput!
    var router: PagerRouter!
    
    @IBOutlet weak var barView: ButtonBarView!
    @IBOutlet weak var container: UIScrollView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        PagerConfigurator.sharedInstance.configure(viewController: self)
    }
    
    override func viewDidLoad() {
        self.containerView = self.container
        self.buttonBarView = self.barView
        
        super.viewDidLoad()
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        return output.viewControllers
    }
    
    func doSomethingOnLoad() {
        // NOTE: Ask the Interactor to do some work

        let request = Pager.Something.Request()
        output.doSomething(request: request)
    }

    // MARK: - Display logic

    func displaySomething(viewModel: Pager.Something.ViewModel) {
        // NOTE: Display the result from the Presenter

        // nameTextField.text = viewModel.name
    }
}
