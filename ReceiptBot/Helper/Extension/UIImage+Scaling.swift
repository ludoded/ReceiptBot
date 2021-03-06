//
//  UIImage+Scaling.swift
//  ReceiptBot
//
//  Created by Haik Ampardjian on 5/6/17.
//  Copyright © 2017 receiptbot. All rights reserved.
//

import UIKit

extension UIImage {
    func rebotSize() -> UIImage? {
        var makeScale: CGFloat = 0.3
        if size.width > UIScreen.main.bounds.width {
            makeScale = UIScreen.main.bounds.width / size.width
        }
        
        let newSize = size.applying(CGAffineTransform(scaleX: makeScale, y: makeScale))
        let hasAlpha = false
        let scale: CGFloat = 1.0 // Automatically use scale factor of main screen you should use 0.0
        
        UIGraphicsBeginImageContextWithOptions(newSize, !hasAlpha, scale)
        self.draw(in: CGRect(origin: .zero, size: newSize))
        
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return scaledImage
    }
}
