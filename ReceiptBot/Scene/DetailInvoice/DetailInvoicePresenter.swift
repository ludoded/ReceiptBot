//
//  DetailInvoicePresenter.swift
//  ReceiptBot
//
//  Created by Haik Ampardjian on 4/13/17.
//  Copyright (c) 2017 receiptbot. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit

protocol DetailInvoicePresenterOutput: class, Errorable, Spinnable {
    func displayInitial(viewModel: DetailInvoice.Setup.ViewModel)
}

class DetailInvoicePresenter {
    weak var output: DetailInvoicePresenterOutput!

    // MARK: - Presentation logic
    func presentInitialSetup(response: DetailInvoice.Setup.Response) {
        switch response.invoice {
        case .none(let message): output.show(type: .error(message: message))
        case .value(let invoice): passInitialSetup(from: invoice)
        }
    }
    
    func passInitialSetup(from invoice: SyncConvertedInvoiceResponse) {
        guard var imageURL = URL(string: API.documentsURL) else { output.show(type: .error(message: "Can't load the image")); return }
        imageURL.appendPathComponent(invoice.filePath)
        imageURL.appendPathComponent(invoice.fileName)
        let imageRequest = URLRequest(url: imageURL)
        
        let invoiceDate = DateFormatters.mdytaFormatter.string(from: invoice.invoiceDateMobile ?? Date())
        let dueDate = DateFormatters.mdytaFormatter.string(from: invoice.dueDate ?? Date())
        let categoryName = AppSettings.shared.config.categoryName(for: invoice.categoryId)
        
        let viewModel = DetailInvoice.Setup.ViewModel(imageRequest: imageRequest,
                                                      supplierName: invoice.supplierName,
                                                      invoiceDate: invoiceDate,
                                                      invoiceNumber: invoice.invoiceNumber,
                                                      paymentMethod: invoice.paymentMethod,
                                                      category: categoryName,
                                                      taxRate: invoice.taxPercentage,
                                                      taxAmount: invoice.taxAmount,
                                                      grossAmount: invoice.grossAmount,
                                                      netAmount: invoice.netAmount,
                                                      dueDate: dueDate)
        
        output.displayInitial(viewModel: viewModel)
    }
    
    func presentSave(response: DetailInvoice.Save.Response) {
        output.stopSpinning()
        
        switch response.data {
        case .none(let message): output.show(type: .error(message: message))
        case .value: output.show(type: .success(message: "Saved"))
        }
    }
    
    func presentReject(response: DetailInvoice.Reject.Response) {
        output.stopSpinning()
        
        switch response.data {
        case .none(let message): output.show(type: .error(message: message))
        case .value: output.show(type: .success(message: "Rejected"))
        }
    }
}
