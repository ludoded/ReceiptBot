//
//  DashboardConfigurator.swift
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

// MARK: - Connect View, Interactor, and Presenter

extension DashboardViewController: DashboardPresenterOutput {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        router.passDataToNextScene(segue: segue)
    }
}

extension DashboardInteractor: DashboardViewControllerOutput {
}

extension DashboardPresenter: DashboardInteractorOutput {
}

class DashboardConfigurator {
    // MARK: - Object lifecycle

    static let sharedInstance = DashboardConfigurator()

    private init() {}

    // MARK: - Configuration

    func configure(viewController: DashboardViewController) {
        let router = DashboardRouter()
        router.viewController = viewController

        let presenter = DashboardPresenter()
        presenter.output = viewController

        let interactor = DashboardInteractor()
        interactor.output = presenter

        viewController.output = interactor
        viewController.router = router
    }
    
    func setup(theChart chart: PieChartView!) {
        chart?.usePercentValuesEnabled = true
        chart?.drawSlicesUnderHoleEnabled = false
        chart?.holeRadiusPercent = 0.6
        chart?.transparentCircleRadiusPercent = 0.65
        chart?.chartDescription?.enabled = false
        
        chart?.drawCenterTextEnabled = true
        
        chart?.drawHoleEnabled = true
        chart?.rotationAngle = 0.0
        chart?.rotationEnabled = false
        chart?.highlightPerTapEnabled = true
        
        let legend = chart?.legend
        legend?.horizontalAlignment = .center
        legend?.verticalAlignment = .bottom
        legend?.orientation = .vertical
        legend?.xEntrySpace = 0.0
        legend?.yEntrySpace = 5.0
        legend?.yOffset = 10.0
    }
}
