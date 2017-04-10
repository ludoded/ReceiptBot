//
//  CategoryResponse.swift
//  ReceiptBot
//
//  Created by Haik Ampardjian on 4/4/17.
//  Copyright © 2017 receiptbot. All rights reserved.
//

import Foundation
import SwiftyJSON

/// struct response for fetching all categories
struct CategoryResponse: JSONable {
    let category: String
    let isDefaultCategory: Bool
    let masterId: Int
    let rebotCategoryCode: String
    
    init(json: JSON) {
        self.category = json["Category"].stringValue
        self.isDefaultCategory = json["isDefaultCategory"].boolValue
        self.masterId = json["MasterId"].intValue
        self.rebotCategoryCode = json["RebotCategoryCode"].stringValue
    }
}
