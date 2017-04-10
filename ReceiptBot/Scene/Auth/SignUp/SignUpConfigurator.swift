//
//  SignUpConfigurator.swift
//  ReceiptBot
//
//  Created by Haik Ampardjian on 4/8/17.
//  Copyright (c) 2017 receiptbot. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit

// MARK: - Connect View, Interactor, and Presenter

extension SignUpViewController: SignUpPresenterOutput {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        router.passDataToNextScene(segue: segue)
    }
}

extension SignUpInteractor: SignUpViewControllerOutput {
}

extension SignUpPresenter: SignUpInteractorOutput {
}

class SignUpConfigurator {
    // MARK: - Object lifecycle

    static let sharedInstance = SignUpConfigurator()

    private init() {}

    // MARK: - Configuration

    func configure(viewController: SignUpViewController) {
        let router = SignUpRouter()
        router.viewController = viewController

        let presenter = SignUpPresenter()
        presenter.output = viewController

        let interactor = SignUpInteractor()
        interactor.output = presenter

        viewController.output = interactor
        viewController.router = router
    }
}
