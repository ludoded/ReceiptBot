//
//  CompleteProfileViewController.swift
//  ReceiptBot
//
//  Created by Haik Ampardjian on 4/8/17.
//  Copyright (c) 2017 receiptbot. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import ActionSheetPicker_3_0
import Material

protocol CompleteProfileViewControllerOutput {
    var email: String! { get set }
    var password: String! { get set }
    var countries: [String] { get }
    var roles: [String] { get }
    
    var countryId: Int { get set }
    var accountType: Int { get set }
    var type: CompleteProfileType { get set }
    
    var externalInfo: SignIn.CompleteProfileInfo! { get set }
    
    func completeRegistration(request: CompleteProfile.Registration.Request)
}

class CompleteProfileViewController: SignBaseViewController {
    var output: CompleteProfileViewControllerOutput!
    var router: CompleteProfileRouter!

    @IBOutlet weak var country: UILabel!
    @IBOutlet weak var accountType: UILabel!
    
    @IBAction func completeProfile(_ sender: Button) {
        completeRegistration()
    }
    
    @IBAction func back(_ sender: UIButton) {
        let alert = UIAlertController(title: "Caution!", message: "Do you really want to cancel profile completion?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { [weak self] _ in self?.navigationController?.popToRootViewController(animated: true) }))
        navigationController?.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func pickCountry(_ sender: UITapGestureRecognizer) {
        displayCountryPicker()
    }
    
    @IBAction func pickAccountType(_ sender: UITapGestureRecognizer) {
        displayRolePicker()
    }
    
    // MARK: - Object lifecycle

    override func awakeFromNib() {
        super.awakeFromNib()
        CompleteProfileConfigurator.sharedInstance.configure(viewController: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        trySetupFullName()
    }
    
    /// Setup full name in case it's external request
    private func trySetupFullName() {
        guard let name = output.externalInfo?.name else { return }
        textFields?[0].text = name
    }

    // MARK: - Event handling

    func completeRegistration() {
        startSpinning()
        
        let request = CompleteProfile.Registration.Request(fullName: textFields[0].text ?? "",
                                                           companyName: textFields[1].text ?? "")
        output.completeRegistration(request: request)
    }

    // MARK: - Display logic

    func displayHome() {
        router.navigateToMain()
    }
    
    func displayCountryPicker() {
        let picker = ActionSheetStringPicker(title: "Pick the County",
                                             rows: output.countries,
                                             initialSelection: 0,
                                             doneBlock: { [weak self] (_, index, value) in
                                                self?.output.countryId = index
                                                self?.country.text = (value as? String)
                                            },
                                             cancel: nil,
                                             origin: self.view)
        picker?.show()
    }
    
    func displayRolePicker() {
        let picker = ActionSheetStringPicker(title: "Pick Account Type",
                                             rows: output.roles,
                                             initialSelection: 0,
                                             doneBlock: { [weak self] (_, index, value) in
                                                self?.output.accountType = index
                                                self?.accountType.text = (value as? String)
                                            },
                                             cancel: nil,
                                             origin: self.view)
        picker?.show()
    }
}
