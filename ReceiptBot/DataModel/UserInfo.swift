//
//  UserInfo.swift
//  ReceiptBot
//
//  Created by Haik Ampardjian on 4/8/17.
//  Copyright © 2017 receiptbot. All rights reserved.
//

import CoreData

@objc(UserInfo)
final class UserInfo: NSManagedObject {
    @NSManaged fileprivate(set) var userId: NSNumber?
    @NSManaged fileprivate(set) var orgId: NSNumber?
    @NSManaged fileprivate(set) var companyId: NSNumber?
    @NSManaged fileprivate(set) var emailAddress: String?
    @NSManaged fileprivate(set) var fullName: String?
    @NSManaged fileprivate(set) var orgName: String?
    @NSManaged fileprivate(set) var country: NSNumber?
    @NSManaged fileprivate(set) var accType: NSNumber?
    @NSManaged fileprivate(set) var businessSector: String?
    @NSManaged fileprivate(set) var profileImage: Data?
    @NSManaged fileprivate(set) var companyName: String?
    @NSManaged fileprivate(set) var accountingSoftware: NSNumber?
    
    static func insert(into context: NSManagedObjectContext, response: AuthResponse) -> UserInfo {
        let userInfo: UserInfo = context.insertObject()
        userInfo.userId = NSNumber(value: 1)
        userInfo.orgId = NSNumber(value: response.organisationId)
        userInfo.companyId = NSNumber(value: response.entityId)
        userInfo.emailAddress = response.emailAddress
        userInfo.fullName = response.credentials.fullName
        userInfo.orgName = response.organisationName
        userInfo.country = NSNumber(value: 0) /// NOTE: Back-end returns Null for countryId
        userInfo.accType = NSNumber(value: 0) /// NOTE: Back-end returns Null for accType
        userInfo.businessSector = nil /// NOTE: Back-end doesn't returns business sector
        userInfo.profileImage = nil /// NOTE: Back-end doesn't returns profileImage
        userInfo.companyName = response.entityName
        userInfo.accountingSoftware = NSNumber(value: Int(response.accountPackageId) ?? 0)
        
        return userInfo
    }
}

extension UserInfo: Managed, ManagedCrud {
    typealias R = AuthResponse
}
