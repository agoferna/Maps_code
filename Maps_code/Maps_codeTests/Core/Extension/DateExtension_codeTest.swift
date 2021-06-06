//
//  DateExtension_codeTest.swift
//  Maps_codeTests
//
//  Created by adrià gonzález fernández on 06/06/2021.
//

import XCTest
@testable import Maps_code

class DateExtension_codeTest: XCTestCase {
        
    func testT01_VC_getHourMinuteString() {
        let hourAndMinute = Date().getHourMinuteString()
        XCTAssertNotNil(hourAndMinute)
    }

}
    
