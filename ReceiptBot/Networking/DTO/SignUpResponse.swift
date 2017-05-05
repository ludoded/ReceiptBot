//
//  SignUpResponse.swift
//  ReceiptBot
//
//  Created by Haik Ampardjian on 4/4/17.
//  Copyright © 2017 receiptbot. All rights reserved.
//

import Foundation
import SwiftyJSON

/// Struct for last and first names
struct CredentialsResponse: JSONable {
    let firstName: String
    let lastName: String
    
    var fullName: String {
        return firstName + " " + lastName
    }
    
    init(json: JSON) {
        self.firstName = json["FirstName"].stringValue
        self.lastName = json["LastName"].stringValue
    }
}

/// Response when request first stage for signing up
struct SignUpFirstResponse: JSONable {
    let id: String
    let identityUserId: String
    
    /// Email is not in credentials, because back-end responses are incosistent.
    /// It returns Email in one case, and EmailAddress in another. 
    /// If this would ever be fixe, you can move this to CredentialsResponse
    let email: String
    
    let credentials: CredentialsResponse
    let isVerified: Bool
    let message: String
    let userAlreadyCreated: Bool
    
    init(json: JSON) {
        self.id = json["Id"].stringValue
        self.identityUserId = json["IdentityUserId"].stringValue
        self.email = json["Email"].stringValue
        self.credentials = CredentialsResponse(json: json)
        self.isVerified = json["IsVerified"].boolValue
        self.message = json["message"].stringValue
        self.userAlreadyCreated = json["userAllradyCreated"].boolValue
    }
}

/// Response when logging in or second stage for signing up
struct AuthResponse: JSONable {
    let accountPackageId: String
    let accountPackageIdMobile: String
    let applicationUserId: Int
    let emailAddress: String
    let entityId: Int
    let entityName: String
    let credentials: CredentialsResponse
    let organisationId: Int
    let organisationName: String
    let userEmail: String
    let detail: String
    let isEmailVerified: Bool
    let vatRegister: Bool
    let status: Bool
    
    init(json: JSON) {
        self.accountPackageId = json["AccountPackageId"].stringValue
        self.accountPackageIdMobile = json["AccountPackageIdMobile"].string ?? "3" /// NOTE: Nabeel told that 3 is default
        self.applicationUserId = json["ApplicationUserid"].intValue
        self.emailAddress = json["EmailAddress"].stringValue
        self.entityId = json["EntityId"].intValue
        self.entityName = json["EntityName"].stringValue
        self.credentials = CredentialsResponse(json: json)
        self.organisationId = json["OrganizationId"].intValue
        self.organisationName = json["OrganizationName"].stringValue
        self.userEmail = json["UserEmail"].stringValue
        self.detail = json["detail"].stringValue
        self.isEmailVerified = json["isEmailVerified"].boolValue
        self.vatRegister = json["VATRegister"].boolValue
        self.status = json["status"].boolValue
    }
}
