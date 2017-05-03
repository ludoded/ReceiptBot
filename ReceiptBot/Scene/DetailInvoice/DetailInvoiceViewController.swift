//
//  DetailInvoiceViewController.swift
//  ReceiptBot
//
//  Created by Haik Ampardjian on 4/13/17.
//  Copyright (c) 2017 receiptbot. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit
import ActionSheetPicker_3_0
import Kingfisher
import Material

protocol DetailInvoiceViewControllerOutput {
    var originalInvoice: SyncConvertedInvoiceResponse? { get set }
    
    func initialSetup()
    func save(request: DetailInvoice.Save.Request)
    func reject(request: DetailInvoice.Reject.Request)
}

class DetailInvoiceViewController: UITableViewController {
    var output: DetailInvoiceViewControllerOutput!
    var router: DetailInvoiceRouter!
    
    /// Pickers
    var invoiceDatePicker: UIDatePicker!
    var dueDatePicker: UIDatePicker!
    var paymentPicker: UIPickerView!
    var categoryPicker: UIPickerView!
    var taxPicker: UIPickerView!
    var toolbar: UIToolbar!
    
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet var textFields: [TextField]!
    
    @IBAction func reject(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Reject", message: "Please enter the comment on reason you reject.", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "Reason"
        }
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Reject", style: .default, handler: { [weak self] (_) in
            guard let text =  alert.textFields?[0].text else { return }
            DispatchQueue.main.async { self?.reject(with: text) }
        }))
        
        navigationController?.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func save(_ sender: UIBarButtonItem) {
        save()
    }
    
    // MARK: - Object lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        DetailInvoiceConfigurator.sharedInstance.configure(viewController: self)
    }

    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPickers()
        initialSetup()
    }
    
    /// MARK: - Setup handling
    func setupPickers() {
        toolbar = UIToolbar()
        toolbar.barStyle = .default
        toolbar.isTranslucent = false
        toolbar.isUserInteractionEnabled = true
        let done = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done(toolbar:)))
        toolbar.items = [done]
        
        invoiceDatePicker = UIDatePicker()
        invoiceDatePicker.addTarget(self, action: #selector(datePickerValueChanged(picker:)), for: .valueChanged)
        textFields?[1].inputAccessoryView = toolbar
        textFields?[1].inputView = invoiceDatePicker
        
        dueDatePicker = UIDatePicker()
        dueDatePicker.addTarget(self, action: #selector(datePickerValueChanged(picker:)), for: .valueChanged)
        textFields?[9].inputAccessoryView = toolbar
        textFields?[9].inputView = dueDatePicker
        
        paymentPicker = UIPickerView()
        paymentPicker.dataSource = self
        paymentPicker.delegate = self
        textFields?[3].inputAccessoryView = toolbar
        textFields?[3].inputView = paymentPicker
        
        categoryPicker = UIPickerView()
        categoryPicker.dataSource = self
        categoryPicker.delegate = self
        textFields?[4].inputAccessoryView = toolbar
        textFields?[4].inputView = categoryPicker
        
        taxPicker = UIPickerView()
        taxPicker.dataSource = self
        taxPicker.delegate = self
        textFields?[5].inputAccessoryView = toolbar
        textFields?[5].inputView = taxPicker
        
        toolbar.sizeToFit()
    }
    
    // MARK: - Event handling
    func initialSetup() {
        output.initialSetup()
    }
    
    func save() {
        startSpinning()
        
        let request = DetailInvoice.Save.Request(supplierName: textFields?[0].text,
                                                 invoiceDate: textFields?[1].text,
                                                 invoiceNumber: textFields?[2].text,
                                                 paymentMethod: textFields?[3].text,
                                                 category: textFields?[4].text,
                                                 taxRate: textFields?[5].text,
                                                 taxAmount: textFields?[6].text,
                                                 netAmount: textFields?[7].text,
                                                 grossAmount: textFields?[8].text,
                                                 dueDate: textFields?[9].text)
        output.save(request: request)
    }
    
    func reject(with comment: String) {
        startSpinning()
        
        let request = DetailInvoice.Reject.Request(comment: comment)
        output.reject(request: request)
    }

    // MARK: - Display logic
    func displayInitial(viewModel: DetailInvoice.Setup.ViewModel) {
        /// Loading image
        var isWebView = false
        switch viewModel.type {
        case .pdf(let req):
            webView.loadRequest(req)
            isWebView = true
        case .image(let res): imageView.kf.setImage(with: res)
        }
        
        webView.isHidden = !isWebView
        imageView.isHidden = isWebView
        dueDatePicker.minimumDate = viewModel.dueDateMin
        
        textFields?[0].text = viewModel.supplierName
        textFields?[1].text = viewModel.invoiceDate
        textFields?[2].text = viewModel.invoiceNumber
        textFields?[3].text = viewModel.paymentMethod
        textFields?[4].text = viewModel.category
        textFields?[5].text = viewModel.taxRate
        textFields?[6].text = viewModel.taxAmount
        textFields?[7].text = viewModel.grossAmount
        textFields?[8].text = viewModel.netAmount
        textFields?[9].text = viewModel.dueDate
    }
    
    func goBack() {
        navigationController?.popViewController(animated: true)
    }
}

/// MARK: UITableViewDelegate
extension DetailInvoiceViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        guard row > 0 else { return }
        let textFieldIndex = row.advanced(by: -1) /// Because first row is the image. It can be moved into another section to simplify this logic
        
        activateTextField(at: textFieldIndex)
    }
}

extension DetailInvoiceViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let index = textFields.index(of: textField as! TextField) else { return true }
        if case 6...8 = index {
            var set = CharacterSet.decimalDigits
            set.insert(charactersIn: ".")
            
            let trimmed = string.trimmingCharacters(in: set)
            return trimmed.isEmpty
        }
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let index = textFields.index(of: textField as! TextField) else { return false }
        let total = textFields.count
        
        /// Index of next textfield which should become first responder
        let nextIndex = index.advanced(by: 1)
        if nextIndex >= total { return textField.resignFirstResponder() }
        
        return activateTextField(at: nextIndex)
    }
    
    @discardableResult
    fileprivate func activateTextField(at index: Int) -> Bool {
        deactivateAllTextFields()
        
        let textField = textFields[index]
        textField.isUserInteractionEnabled = true
        return textField.becomeFirstResponder()
    }
    
    /// Set isUserInteractionEnabled to false for all textFields, so they won't be able to clicked directly
    private func deactivateAllTextFields() {
        textFields.forEach { $0.isUserInteractionEnabled = false }
    }
}

/// MARK: Picker view delegates 
extension DetailInvoiceViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView {
        case paymentPicker: return AppSettings.shared.config.paymentNames().count
        case categoryPicker: return AppSettings.shared.config.categoryNames().count
        case taxPicker: return AppSettings.shared.config.taxNames().count
        default: return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView {
        case paymentPicker: return AppSettings.shared.config.paymentNames()[row]
        case categoryPicker: return AppSettings.shared.config.categoryNames()[row]
        case taxPicker: return AppSettings.shared.config.taxNames()[row]
        default: return ""
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView {
        case paymentPicker:
            let title = AppSettings.shared.config.paymentNames()[row]
            textFields?[3].text = title
        case categoryPicker:
            let title = AppSettings.shared.config.categoryNames()[row]
            textFields?[4].text = title
        case taxPicker:
            let title = AppSettings.shared.config.taxNames()[row]
            textFields?[5].text = title
        default: break
        }
    }
    
    func datePickerValueChanged(picker: UIDatePicker) {
        switch picker {
        case invoiceDatePicker: textFields?[0].text = DateFormatters.mdytaFormatter.string(from: picker.date)
        case dueDatePicker: textFields?[9].text = DateFormatters.mdytaFormatter.string(from: picker.date)
        default: break
        }
    }
    
    func done(toolbar: UIToolbar) {
        view.endEditing(true)
    }
}
