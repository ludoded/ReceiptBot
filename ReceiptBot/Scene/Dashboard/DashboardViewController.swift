//
//  DashboardViewController.swift
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
import XLPagerTabStrip

protocol DashboardViewControllerOutput {
    func fetchPieChart()
}

class DashboardViewController: UIViewController {
    var output: DashboardViewControllerOutput!
    var router: DashboardRouter!

    @IBOutlet weak var chart: PieChartView!
    
    // MARK: - Object lifecycle

    override func awakeFromNib() {
        super.awakeFromNib()
        DashboardConfigurator.sharedInstance.configure(viewController: self)
    }

    // MARK: - View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        DashboardConfigurator.sharedInstance.setup(theChart: chart)
        fetchData()
    }

    // MARK: - Event handling

    func fetchData() {
        output.fetchPieChart()
    }

    // MARK: - Display logic

    func updateChart(viewModel: Dashboard.PieChart.ViewModel) {
        chart.data = viewModel.data
        chart.highlightValues(nil)
        chart.animate(xAxisDuration: 1.0)
    }
}

extension DashboardViewController: IndicatorInfoProvider {
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "Dashboard")
    }
}
