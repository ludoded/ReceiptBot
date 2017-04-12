//
//  PhotoVerifyInteractor.swift
//  ReceiptBot
//
//  Created by Haik Ampardjian on 4/13/17.
//  Copyright (c) 2017 receiptbot. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit

protocol PhotoVerifyInteractorInput {
    func doSomething(request: PhotoVerify.Something.Request)
}

protocol PhotoVerifyInteractorOutput {
      func presentSomething(response: PhotoVerify.Something.Response)
}

class PhotoVerifyInteractor: PhotoVerifyInteractorInput {
    var output: PhotoVerifyInteractorOutput!
    var worker: PhotoVerifyWorker!

    // MARK: - Business logic

    func doSomething(request: PhotoVerify.Something.Request) {
        // NOTE: Create some Worker to do the work

        worker = PhotoVerifyWorker()
        worker.doSomeWork()

        // NOTE: Pass the result to the Presenter

        let response = PhotoVerify.Something.Response()
        output.presentSomething(response: response)
    }
}