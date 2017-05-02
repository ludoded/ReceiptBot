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
    var pieData: PieChartDataSet! { get }
    
    func fetchPieChart()
}

class DashboardViewController: UIViewController, RefreshControlOutput {
    var refresh: UIRefreshControl!
    
    var output: DashboardViewControllerOutput!
    var router: DashboardRouter!

    @IBOutlet weak var scrollView: UIScrollView!
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
        chart.delegate = self
        
        fetchData()
        setupRefresh(sel: #selector(reload))
    }
    
    func reload() {
        fetchData()
    }

    // MARK: - Event handling
    func fetchData() {
        startSpinning()
        output.fetchPieChart()
    }

    // MARK: - Display logic
    func updateChart(viewModel: Dashboard.PieChart.ViewModel) {
        chart.data = viewModel.data
        chart.highlightValues(nil)
        chart.animate(xAxisDuration: 1.0)
        setupUnselectedCenter()
    }
    
    func setupUnselectedCenter() {
        guard output.pieData.values.count > 0,
            let pieEntry = output.pieData.values[0] as? PieChartDataEntry else { return }
        setupCenterText(entry: pieEntry)
    }
    
    func setupCenterText(entry: PieChartDataEntry, color: UIColor = RebotColor.Pie.pieColors[0]) {
        let value = Int(entry.y)
        chart.centerAttributedText = RebotAttributedTextBuilder.buildPie(for: value,
                                                                         and: entry.label ?? "",
                                                                         with: color)
    }
}

extension DashboardViewController: IndicatorInfoProvider {
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "Dashboard")
    }
}

extension DashboardViewController: ChartViewDelegate {
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        let pieEntry = entry as! PieChartDataEntry
        setupCenterText(entry: pieEntry, color: RebotColor.Pie.pieColors[Int(highlight.x)])
    }
    
    func chartValueNothingSelected(_ chartView: ChartViewBase) {
        setupUnselectedCenter()
    }
}
