//
//  SignUpRouter.swift
//  ReceiptBot
//
//  Created by Haik Ampardjian on 4/8/17.
//  Copyright (c) 2017 receiptbot. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit

protocol SignUpRouterInput {
    func navigateToCompleteProfile()
}

class SignUpRouter: SignUpRouterInput {
    weak var viewController: SignUpViewController!

    // MARK: - Navigation
    func navigateToCompleteProfile() {
         viewController.performSegue(withIdentifier: "ShowCompleteProfile", sender: nil)
    }

    // MARK: - Communication
    func passDataToNextScene(segue: UIStoryboardSegue) {
        if segue.identifier == "ShowCompleteProfile" {
            passDataToProfileCompletionScene(segue: segue)
        }
    }

    func passDataToProfileCompletionScene(segue: UIStoryboardSegue) {
        let profileViewController = segue.destination as! CompleteProfileViewController
        profileViewController.output.email = viewController.output.email
        profileViewController.output.password = viewController.output.password
    }
}
