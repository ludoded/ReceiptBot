//
//  LeftDataSourceConfigurator.swift
//  ReceiptBot
//
//  Created by Haik Ampardjian on 4/12/17.
//  Copyright © 2017 receiptbot. All rights reserved.
//

import Foundation

class LeftDataSourceConfigurator {
    static let sharedInstance = LeftDataSourceConfigurator()
    
    private init() {}
    
    // MARK: - Configuration
    func configure(dataSource: LeftDataSource) {
        let interactor = LeftDataSourceInteractor()
        dataSource.interactorOutput = interactor
    }
}
