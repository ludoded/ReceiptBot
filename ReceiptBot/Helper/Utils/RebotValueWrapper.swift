//
//  RebotValueWrapper.swift
//  ReceiptBot
//
//  Created by Haik Ampardjian on 4/5/17.
//  Copyright © 2017 receiptbot. All rights reserved.
//

import Foundation

enum RebotValueWrapper<T> {
    case none(message: String)
    case value(T)
}
