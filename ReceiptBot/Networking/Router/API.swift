//
//  API.swift
//  ReceiptBot
//
//  Created by Haik Ampardjian on 4/5/17.
//  Copyright © 2017 receiptbot. All rights reserved.
//

import Alamofire


private var router: Router.Type {
    Router.baseURLString = API.stageURL
    return Router.self
}

struct API {
    static let stageURL = "http://51.140.104.181:82"
    static let documentsURL = "http://51.140.104.181"
}

/// MARK: Sessions
extension API {
    static func signUpFirst(_ params: Parameters) -> DataRequest {
        SessionRouter.baseURLString = API.stageURL
        return Alamofire.request(SessionRouter.signUpFirst(params))
    }
    
    static func signUpSecond(_ params: Parameters) -> DataRequest {
        SessionRouter.baseURLString = API.stageURL
        return Alamofire.request(SessionRouter.signUpSecond(params))
    }
    
    static func signIn(_ params: Parameters) -> DataRequest {
        SessionRouter.baseURLString = API.stageURL
        return Alamofire.request(SessionRouter.signIn(params))
    }
    
    static func externalLogin(_ email: String) -> DataRequest {
        SessionRouter.baseURLString = API.stageURL
        return Alamofire.request(SessionRouter.external(email: email))
    }
    
    static func forgotPassword(_ email: String) -> DataRequest {
        SessionRouter.baseURLString = API.stageURL
        return Alamofire.request(SessionRouter.forgotPassword(email: email))
    }
}

/// MARK: Services
extension API {
    static func syncData(with entityId: Int) -> DataRequest {
        return Alamofire.request(router.syncData(entityId: entityId))
    }
    
    static func pieChart(with entityId: Int) -> DataRequest {
        return Alamofire.request(router.pieChart(entityId: entityId))
    }
    
    static func lineChart(with entityId: Int) -> DataRequest {
        return Alamofire.request(router.lineChart(entityId: entityId))
    }
    
    static func convertedInvoice(with originalInvoiceId: Int) -> DataRequest {
        return Alamofire.request(router.convertedInvoice(originalInvoiceId: originalInvoiceId))
    }
    
    static func allExpense(with softwareId: String, and entityId: Int) -> DataRequest {
        return Alamofire.request(router.allExpense(softwareId: softwareId, entityId: entityId))
    }
    
    static func fileUpload(with params: Parameters) -> DataRequest {
        return Alamofire.request(router.fileUpload(params: params))
    }
    
    static func xeroCategories() -> DataRequest {
        return Alamofire.request(router.xeroCategories)
    }
    
    static func qbCategories() -> DataRequest {
        return Alamofire.request(router.qbCategories)
    }
    
    static func updateConvertedInvoice(with params: Parameters) -> DataRequest {
        return Alamofire.request(router.updateConvertedInvoice(params: params))
    }
    
    static func suppliers(with softwareId: String, and entityId: Int) -> DataRequest {
        return Alamofire.request(router.suppliers(softwareId: softwareId, entityId: entityId))
    }
    
    static func reject(with entityId: Int, and convertedInvoiceId: String, originalInvoiceId: String, reason: String) -> DataRequest {
        return Alamofire.request(router.reject(entityId: entityId, convertedInvoiceId: convertedInvoiceId, originalInvoicId: originalInvoiceId, reason: reason))
    }
}
