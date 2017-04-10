//
//  ExpensesPresenter.swift
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

protocol ExpensesPresenterOutput: class, Errorable {
    func updateChart(viewModel: Expenses.Line.ViewModel)
}

class ExpensesPresenter {
    weak var output: ExpensesPresenterOutput!

    // MARK: - Presentation logic
    
    func presentLineChart(response: Expenses.Line.Response) {
        let dataSetWrapped = response.dataSet
        switch dataSetWrapped {
        case .value(let dataSet):
            pass(line: dataSet)
        case .none(let message):
            output.show(type: .error(message: message))
        }
    }
    
    private func pass(line dataSet: LineChartDataSet) {
        let data = LineChartData(dataSet: dataSet)
        
        data.setValueFormatter(DefaultValueFormatter(formatter: NumberFormaters.pieFormatter))
        data.setValueTextColor(.black)
        
        let viewModel = Expenses.Line.ViewModel(data: data)
        output.updateChart(viewModel: viewModel)
    }
}
