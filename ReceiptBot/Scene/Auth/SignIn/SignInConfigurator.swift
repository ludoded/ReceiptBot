//
//  SignInConfigurator.swift
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

extension SignInViewController: SignInPresenterOutput, PasswordRecoveryPresenterOutput {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        router.passDataToNextScene(segue: segue)
    }
}

extension SignInInteractor: SignInViewControllerOutput, PasswordRecoveryViewControllerOutput {
}

extension SignInPresenter: SignInInteractorOutput, PasswordRecoveryInteractorOutput {
}

class SignInConfigurator {
    // MARK: - Object lifecycle

    static let sharedInstance = SignInConfigurator()

    private init() {}

    // MARK: - Configuration

    func configure(viewController: SignInViewController) {
        let router = SignInRouter()
        router.viewController = viewController

        let presenter = SignInPresenter()
        presenter.output = viewController

        let interactor = SignInInteractor()
        interactor.output = presenter

        viewController.output = interactor
        viewController.router = router
    }
}
