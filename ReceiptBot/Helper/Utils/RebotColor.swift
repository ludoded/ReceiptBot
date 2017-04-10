//
//  RebotColor.swift
//  ReceiptBot
//
//  Created by Haik Ampardjian on 4/5/17.
//  Copyright © 2017 receiptbot. All rights reserved.
//

import Foundation
import UIColor_Hex_Swift

struct RebotColor {
    struct Pie {
        static let pending = UIColor("#006C7E")
        static let processed = UIColor("#0086AB")
        static let exported = UIColor("#75DDE6")
        static let rejected = UIColor("#7CB7C7")
        static let process = UIColor("#5196A3")
        
        static let pieColors = [pending, processed, exported, rejected, process]
    }
    
    struct VCColor {
        static let error = UIColor("#CC0000")
        static let success = UIColor("#4BB543")
    }
    
    struct Pager {
        static let separator = UIColor("#4BB543")
    }
    
    struct Text {
        static let green = UIColor("#9ACC2A")
        
    }
}
