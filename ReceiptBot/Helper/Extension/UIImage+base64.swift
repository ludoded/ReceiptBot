//
//  UIImage+base64.swift
//  ReceiptBot
//
//  Created by Haik Ampardjian on 4/13/17.
//  Copyright © 2017 receiptbot. All rights reserved.
//

import UIKit

extension UIImage {
    func toBase64() -> String? {
        guard let imageData = UIImagePNGRepresentation(self) else { return nil }
        return imageData.base64EncodedString()
    }
}
