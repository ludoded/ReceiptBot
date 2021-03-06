//
//  DashboardInteractor.swift
//  ReceiptBot
//
//  Created by Haik Ampardjian on 4/5/17.
//  Copyright (c) 2017 receiptbot. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit
import Charts

protocol DashboardInteractorOutput {
      func presentPieData(response: Dashboard.PieChart.Response)
}

class DashboardInteractor {
    var pieData: PieChartDataSet!
    var output: DashboardInteractorOutput!
    var worker: DashboardWorker!

    // MARK: - Business logic
    
    func fetchPieChart() {
        let entityId = AppSettings.shared.user.entityId
        worker = DashboardWorker(entityId: entityId)
        worker.fetchPieData { [weak self] dataSet in
            DispatchQueue.main.async { self?.sendPieData(request: dataSet) }
        }
    }
    
    private func sendPieData(request dataSet: RebotValueWrapper<PieChartDataSet>) {
        /// Store dataset if it exists
        switch dataSet {
        case .value(let set): pieData = set
        default: break
        }
        
        /// Pass data to presenter
        let response = Dashboard.PieChart.Response(dataSet: dataSet)
        output.presentPieData(response: response)
    }
}
