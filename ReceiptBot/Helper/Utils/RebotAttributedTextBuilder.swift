//
//  RebotAttributedTextBuilder.swift
//  ReceiptBot
//
//  Created by Haik Ampardjian on 4/20/17.
//  Copyright © 2017 receiptbot. All rights reserved.
//

import UIKit

struct RebotAttributedTextBuilder {
    static func buildPie(for value: Int, and label: String, with color: UIColor) -> NSAttributedString {
        let paragraph = NSMutableParagraphStyle()
        paragraph.lineBreakMode = .byTruncatingTail
        paragraph.alignment = .center
        
        let valueStr = String(value)
        let title: NSString = valueStr + "\n" + label as NSString
        let attributed = NSMutableAttributedString(string: String(title), attributes: [NSFontAttributeName : UIFont.systemFont(ofSize: 18.0),
                                                                                       NSForegroundColorAttributeName : UIColor.darkGray,
                                                                                       NSParagraphStyleAttributeName : paragraph])
        attributed.addAttributes([NSForegroundColorAttributeName : color, NSFontAttributeName : UIFont.systemFont(ofSize: 40.0)], range: title.range(of: valueStr))
        
        return attributed
    }
}
