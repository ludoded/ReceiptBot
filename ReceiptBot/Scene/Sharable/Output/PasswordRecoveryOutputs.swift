//
//  PasswordRecoveryOutputs.swift
//  ReceiptBot
//
//  Created by Haik Ampardjian on 4/10/17.
//  Copyright © 2017 receiptbot. All rights reserved.
//

import Foundation

protocol PasswordRecoveryViewControllerOutput {
    func recoveryPassword(request: PasswordRecoveryModel.Request)
}

protocol PasswordRecoveryInteractorOutput {
    func presentRecoveredPassword(response: PasswordRecoveryModel.Response)
}

protocol PasswordRecoveryPresenterOutput: class, Errorable, Spinnable {}
