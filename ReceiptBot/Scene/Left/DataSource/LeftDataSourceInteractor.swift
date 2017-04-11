//
//  LeftDataSourceInteractor.swift
//  ReceiptBot
//
//  Created by Haik Ampardjian on 4/12/17.
//  Copyright © 2017 receiptbot. All rights reserved.
//

import Foundation

final class LeftDataSourceInteractor: LeftDataSourceInteractorOutput {
    var viewModels: [LeftDataSourceModel.ViewModel] {
        return [
            LeftDataSourceModel.ViewModel(imageName: "folder", name: "Invoices and Receipts"),
            LeftDataSourceModel.ViewModel(imageName: "signout", name: "Signout")
        ]
    }
}
