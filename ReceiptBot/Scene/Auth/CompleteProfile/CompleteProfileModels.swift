//
//  CompleteProfileModels.swift
//  ReceiptBot
//
//  Created by Haik Ampardjian on 4/8/17.
//  Copyright (c) 2017 receiptbot. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit

struct CompleteProfile {
    struct Registration {
        struct Request {
            let fullName: String
            let companyName: String
        }
        
        struct Response {
            let data: RebotValueWrapper<AuthResponse>
        }
        
        struct Params {
            let fullName: String
            let companyName: String
            let countryId: Int
            let accType: Int
            let email: String
            let password: String
            let userType: Int
            
            var params: [String : Any] {
                return [
                    "Email" : email,
                    "Username" : email,
                    "FirstName" : firstLastName().first,
                    "LastName" : firstLastName().last,
                    "OrganizationName" : companyName,
                    "CountryId" : countryId,
                    "AccountId" : accType,
                    "UserType" : userType
                ]
            }
            
            
            func firstLastName() -> (first: String, last: String) {
                var names = fullName.components(separatedBy: CharacterSet.whitespaces)
                let first = names.removeFirst()
                let last = names.joined(separator: " ")
                
                return (first, last)
            }
        }
    }
}
