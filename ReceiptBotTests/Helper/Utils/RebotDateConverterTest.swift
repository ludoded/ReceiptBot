//
//  RebotDateConverterTest.swift
//  ReceiptBot
//
//  Created by Haik Ampardjian on 4/8/17.
//  Copyright © 2017 receiptbot. All rights reserved.
//

import XCTest
import ReceiptBot

class RebotDateConverterTest: XCTestCase {
    func testValidMonth() {
        let janInt = 1
        let febInt = 2
        let marInt = 3
        let aprInt = 4
        let mayInt = 5
        let junInt = 6
        let julInt = 7
        let augInt = 8
        let sepInt = 9
        let octInt = 10
        let novInt = 11
        let decInt = 12
        
        let jan = RebotDateConverter.convertToMonth(from: janInt)
        let feb = RebotDateConverter.convertToMonth(from: febInt)
        let mar = RebotDateConverter.convertToMonth(from: marInt)
        let apr = RebotDateConverter.convertToMonth(from: aprInt)
        let may = RebotDateConverter.convertToMonth(from: mayInt)
        let jun = RebotDateConverter.convertToMonth(from: junInt)
        let jul = RebotDateConverter.convertToMonth(from: julInt)
        let aug = RebotDateConverter.convertToMonth(from: augInt)
        let sep = RebotDateConverter.convertToMonth(from: sepInt)
        let oct = RebotDateConverter.convertToMonth(from: octInt)
        let nov = RebotDateConverter.convertToMonth(from: novInt)
        let dec = RebotDateConverter.convertToMonth(from: decInt)
        
        XCTAssertEqual(jan, "Jan")
        XCTAssertEqual(feb, "Feb")
        XCTAssertEqual(mar, "Mar")
        XCTAssertEqual(apr, "Apr")
        XCTAssertEqual(may, "May")
        XCTAssertEqual(jun, "Jun")
        XCTAssertEqual(jul, "Jul")
        XCTAssertEqual(aug, "Aug")
        XCTAssertEqual(sep, "Sep")
        XCTAssertEqual(oct, "Oct")
        XCTAssertEqual(nov, "Nov")
        XCTAssertEqual(dec, "Dec")
    }
    
    func testInvalidMonth() {
        let monthInt = 10
        let month = RebotDateConverter.convertToMonth(from: monthInt)
        
        XCTAssertNotEqual(month, "Feb")
    }
}
