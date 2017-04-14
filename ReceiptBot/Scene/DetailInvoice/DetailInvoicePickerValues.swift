//
//  DetailInvoicePickerValues.swift
//  ReceiptBot
//
//  Created by Haik Ampardjian on 4/14/17.
//  Copyright © 2017 receiptbot. All rights reserved.
//

import Foundation

struct DetailInvoicePickerValues {
    struct Payment {
        static var values = [
            "Select Payment Method",
            "Bank",
            "Cash",
            "CreditCard",
            "Paypal",
            "None"
        ]
    }
    
    struct Category {
        static var values = [
            "Advertising",
            "Bank Fees",
            "Bank Revaluations",
            "Business Licenses and Permits",
            "Charitable Contributions",
            "Cleaning",
            "Commissions Paid",
            "Computer and Internet Expenses",
            "Consulting & Accounting",
            "Continuing Education",
            "Cost of Goods Sold",
            "Cost of Sales",
            "Cost of Sales - billable expenses",
            "Deprecation",
            "Deprecation Expense",
            "Dues and Subscriptions",
            "Entertainment",
            "Entertainment Booking Fees paid on",
            "Equipment rental",
            "Freight & Courier",
            "General Expenses",
            "Income Tax Expense",
            "Insurance",
            "Insurance Expense",
            "Insurance Expense - General Liability",
            "Insurance Expense - Health Insurance",
            "Insurance Expense - Life and Disability",
            "Insurance Expense - Professional Liability",
            "Interest Expense",
            "Janitorial Expense",
            "Legal expenses",
            "Light, Power, Heating",
            "Marketing Expense",
            "Meals and entertainment",
            "Merchant Account Fees",
            "Motor Vehicle Expenses",
            "Office Expenses",
            "Office Supplies",
            "Postage and Delivery",
            "Printed Materials purchased for clients",
            "Printing & Stationery",
            "Printing and Reproduction",
            "Professional Fees",
            "Purchases",
            "Realised Currency Gains",
            "Rent",
            "Rent Expense",
            "Repair and maintenance",
            "Repairs and Maintenance",
            "Subcontracted Services",
            "Subscriptions",
            "Superannuation",
            "Taxes - Property",
            "Telephone & Internet",
            "Telephone Expense",
            "Travel - International",
            "Travel - National",
            "Travel Expense",
            "Unapplied Cash Bill Payment Expense",
            "Uncategorised Expense",
            "Unrealised Currency Gains",
            "Utilities",
            "Utilities:Utilities - Electric & Gas",
            "Utilities:Utilities - Water",
            "Venue Fees paid on behalf of clients",
            "Wages and Salaries"
        ]
    }
    
    struct Tax {
        static var values = [
            "0",
            "5",
            "20"
        ]
    }
}
