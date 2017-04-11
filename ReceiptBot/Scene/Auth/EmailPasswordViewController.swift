//
//  EmailPasswordViewController.swift
//  ReceiptBot
//
//  Created by Haik Ampardjian on 4/9/17.
//  Copyright © 2017 receiptbot. All rights reserved.
//

import UIKit
import Material
import RxCocoa
import RxSwift

class EmailPasswordViewController: SignBaseViewController {
    var disposeBag = DisposeBag()
    
    @IBOutlet weak var loginButton: Button!
    @IBOutlet weak var recoveryButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupValidators()
    }
    
    private func setupValidators() {
        let emailValid = textFields![0].rx.text.orEmpty
            .map{ RebotValidator.validate(email: $0) }
            .shareReplay(1)
        let passwordValid = textFields![1].rx.text.orEmpty
            .map{ RebotValidator.validate(password: $0) }
            .shareReplay(1)
        let everythingValid = Observable.combineLatest(emailValid, passwordValid) { $0 && $1 }
        
        emailValid
            .bind(to: textFields![0].rx.isErrorRevealed)
            .disposed(by: disposeBag)
        emailValid
            .bind(to: recoveryButton.rx.isEnabled)
            .disposed(by: disposeBag)
        passwordValid
            .bind(to: textFields![1].rx.isErrorRevealed)
            .disposed(by: disposeBag)
        everythingValid
            .bind(to: loginButton.rx.isEnabled)
            .disposed(by: disposeBag)
    }
}
