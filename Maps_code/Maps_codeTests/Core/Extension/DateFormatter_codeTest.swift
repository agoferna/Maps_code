//
//  DateFormatter_codeTest.swift
//  Maps_codeTests
//
//  Created by adrià gonzález fernández on 06/06/2021.
//


import XCTest
@testable import Maps_code

class DateFormatter_codeTest: XCTestCase {
    
    func testT01_VC_getDateFromStringTimeStamp() {
        let timeStamp = "2018-12-18T09:00:00.000Z"
        let date = DateFormatter().getDateFromStringTimeStamp(timeStamp: timeStamp)
        XCTAssertNotNil(date)
    }
    
    func testT01_VC_getDateFromStringTextField() {
        let dateText = "15/06/2021 - 14:02"
        let date = DateFormatter().getDateFromStringTextField(dateString: dateText)
        XCTAssertNotNil(date)
        
        let dateText2 = "15/06/2021"
        let date2 = DateFormatter().getDateFromStringTextField(dateString: dateText2)
        XCTAssertNil(date2)
    }
    
    func testT01_VC_getStringFromDateTextField() {
        let date = Date()
        let string = DateFormatter().getStringFromDateTextField(date: date)
        XCTAssertNotNil(string)
    }
    
}
