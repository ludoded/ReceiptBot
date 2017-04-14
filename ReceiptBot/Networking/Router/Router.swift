//
//  Router.swift
//  ReceiptBot
//
//  Created by Haik Ampardjian on 4/4/17.
//  Copyright © 2017 receiptbot. All rights reserved.
//

import Foundation
import Alamofire

protocol BaseRouter: URLRequestConvertible {
    static var baseURLString: String? { get }
}

enum SessionRouter: BaseRouter {
    static var baseURLString: String?
    
    case signUpFirst(Parameters)
    case signUpSecond(Parameters)
    case signIn(Parameters)
    case external(email: String)
    case forgotPassword(email: String)
    
    var method: Alamofire.HTTPMethod {
        switch self {
        case .signUpFirst, .signUpSecond, .signIn:
            return .post
        case .forgotPassword, .external:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .signUpFirst:
            return "/AccountService.svc/RegisterUser"
        case .signUpSecond:
            return "/AccountService.svc/SignUpOrgInfo"
        case .signIn:
            return "/AccountService.svc/Login"
        case .external(let email):
            return "/AccountService.svc/ExternalLogin/\(email)"
        case .forgotPassword(let email):
            return "/AccountService.svc/ForgotPassword/\(email)"
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = Foundation.URL(string: SessionRouter.baseURLString!)!
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        
        let encoder = JSONEncoding.default
        
        switch self {
        case .signUpFirst(let params):
            return try encoder.encode(urlRequest, with: params)
        case .signUpSecond(let params):
            return try encoder.encode(urlRequest, with: params)
        case .signIn(let params):
            return try encoder.encode(urlRequest, with: params)
        case .forgotPassword, .external:
            return try encoder.encode(urlRequest, with: nil)
        }
    }
}

enum Router: BaseRouter {
    static var baseURLString: String?
    static var OAuthToken: String?
    
    case syncData(entityId: Int)
    case pieChart(entityId: Int)
    case lineChart(entityId: Int)
    case convertedInvoice(originalInvoiceId: Int)
    case allExpense(softwareId: String, entityId: Int)
    case fileUpload(params: Parameters)
    case xeroCategories
    case qbCategories
    case updateConvertedInvoice(params: Parameters)
    case suppliers(softwareId: String, entityId: Int)
    case reject(entityId: Int, convertedInvoiceId: String, originalInvoicId: String, reason: String)
    
    var method: Alamofire.HTTPMethod {
        switch self {
        case .syncData,
             .pieChart,
             .lineChart,
             .convertedInvoice,
             .allExpense,
             .xeroCategories,
             .qbCategories,
             .suppliers:
            return .get
            
        case .fileUpload,
             .updateConvertedInvoice,
             .reject:
            return .post
        }
    }
    
    var path: String {
        switch self {
        case .syncData(let entityId):
            return "/DataCorrectionService.svc/SyncConvertedInvoicesMobile/\(entityId)"
        case .pieChart(let entityId):
            return "/CommonService.svc/InvoiceStatusToShow/\(entityId)"
        case .lineChart(let entityId):
            return "/CommonService.svc/linechart/\(entityId)"
        case .convertedInvoice(let originalInvoiceId):
            return "/DataCorrectionService.svc/GetConvertedInvoicesMobile/\(originalInvoiceId)"
        case .allExpense(let softwareId, let entityId):
            return "/CommonService.svc/GetCategories/\(softwareId)/\(entityId)"
        case .fileUpload:
            return "/FileService.svc/FileUploadMobile"
        case .xeroCategories:
            return "/CommonService.svc/GetAllXeroExpenseCategories"
        case .qbCategories:
            return "/CommonService.svc/GetAllQBExpenseCategories"
        case .updateConvertedInvoice:
            return "/DataCorrectionService.svc/UpdateConvertedInvoiceMobile"
        case .suppliers(let softwareId, let entityId):
            return "/DataCorrectionService.svc/GetSuppliers/\(softwareId)/\(entityId)"
        case .reject(let entityId, let convertedInvoiceId, let originalInvoicId, let reason):
            return "/DataCorrectionService.svc/AddInvoiceCommentMobile/\(entityId)/\(convertedInvoiceId)/\(originalInvoicId)/\(reason)"
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = Foundation.URL(string: Router.baseURLString!)!
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        
        let urlEncoder = URLEncoding.default
        let jsonEncoder = JSONEncoding.default
        
        switch self {
        case .syncData,
             .pieChart,
             .lineChart,
             .convertedInvoice,
             .allExpense,
             .xeroCategories,
             .qbCategories,
             .suppliers,
             .reject:
            return try urlEncoder.encode(urlRequest, with: nil)
            
        case .fileUpload(let params),
             .updateConvertedInvoice(let params):
            return try jsonEncoder.encode(urlRequest, with: params)
        }
    }
}
