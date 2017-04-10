//
//  Reactive+ErrorTextField.swift
//  ReceiptBot
//
//  Created by Haik Ampardjian on 4/9/17.
//  Copyright © 2017 receiptbot. All rights reserved.
//

import UIKit
import Material
import RxCocoa
import RxSwift

extension Reactive where Base: ErrorTextField {
    var isErrorRevealed: UIBindingObserver<Base, Bool> {
        return UIBindingObserver(UIElement: self.base) { control, value in
            control.isErrorRevealed = !value
        }
    }
}
