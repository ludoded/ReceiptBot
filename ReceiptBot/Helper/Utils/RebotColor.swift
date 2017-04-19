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
        static let pending = UIColor("#70DEE4")
        static let processed = UIColor("#7AB8C4")
        static let exported = UIColor("#006E7B")
        static let rejected = UIColor("#0088A6")
        static let process = UIColor("#4F96A1")
        
        static let pieColors = [pending, processed, exported, rejected, process]
    }
    
    struct Line {
        static let line = UIColor("#33691E")
        static let fill = UIColor("#9BCA3B")
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
