//
//  JSONObject+DateFormatterTest.swift
//  ReceiptBot
//
//  Created by Haik Ampardjian on 4/4/17.
//  Copyright © 2017 receiptbot. All rights reserved.
//

import XCTest
import ReceiptBot
import SwiftyJSON

class DateFormattersTest: XCTestCase {
    var equatableDate: Date!
    
    override func setUp() {
        super.setUp()
        NSTimeZone.default = TimeZone(abbreviation: "UTC")!
        
        var comp = DateComponents()
        comp.month = 11
        comp.day = 1
        comp.year = 1989
        comp.hour = 12
        comp.minute = 59
        equatableDate = Calendar.current.date(from: comp)
    }
    
    override func tearDown() {
        NSTimeZone.resetSystemTimeZone()
        super.tearDown()
    }
    
    func testEquatableDate() {
        let testDateFormatShouldSuccess = "Nov 1 1989 1:59PM"
        let testDateFormatShouldFail = "May 1 2011 10:20AM"
        
        let testDateShouldSuccess = DateFormatters.mdytaFormatter.date(from: testDateFormatShouldSuccess)
        let testDateShouldFail = DateFormatters.mdytaFormatter.date(from: testDateFormatShouldFail)
        
        XCTAssertNotNil(testDateShouldSuccess)
        XCTAssertNotNil(testDateShouldFail)
        
        XCTAssertEqual(testDateShouldSuccess!, equatableDate)
        XCTAssertNotEqual(testDateShouldFail!, equatableDate)
    }
}
