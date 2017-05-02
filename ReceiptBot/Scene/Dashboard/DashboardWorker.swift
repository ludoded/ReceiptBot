//
//  DashboardWorker.swift
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

class DashboardWorker {
    let entityId: Int
    
    init(entityId: Int) {
        self.entityId = entityId
    }
    
    func fetchPieData(callback: @escaping (RebotValueWrapper<PieChartDataSet>) -> ()) {
        InvoiceStatusToShowResponse.loadType(request: API.pieChart(with: entityId)) { (pieResp, message) in
            guard message == nil else { callback(.none(message: message!)); return }
            guard let pie = pieResp else { callback(.none(message: "Can't parse Pie Data!")); return }
            
            var values: [PieChartDataEntry] = []
            var colors: [UIColor] = []
            
            if pie.pendingTotal > 0 {
                values.append(PieChartDataEntry(value: Double(pie.pendingTotal), label: "Processing"))
                colors.append(RebotColor.Pie.pending)
            }
            
            if pie.processingTotal > 0 {
                values.append(PieChartDataEntry(value: Double(pie.processingTotal), label: "Processed"))
                colors.append(RebotColor.Pie.processed)
            }
            
            if pie.exportedTotal > 0 {
                values.append(PieChartDataEntry(value: Double(pie.exportedTotal), label: "Exported"))
                colors.append(RebotColor.Pie.exported)
            }
            
            if pie.rejectedTotal > 0 {
                values.append(PieChartDataEntry(value: Double(pie.rejectedTotal), label: "Rejected"))
                colors.append(RebotColor.Pie.rejected)
            }
            
            if pie.approvedTotal > 0 {
                values.append(PieChartDataEntry(value: Double(pie.approvedTotal), label: "Approved"))
                colors.append(RebotColor.Pie.process)
            }
            
    
            let dataSet = PieChartDataSet(values: values, label: nil)
            dataSet.drawIconsEnabled = false
            dataSet.sliceSpace = 0.0
            dataSet.iconsOffset = CGPoint(x: 0, y: 40)
            
            dataSet.colors = colors
            
            callback(.value(dataSet))
        }
    }
}
