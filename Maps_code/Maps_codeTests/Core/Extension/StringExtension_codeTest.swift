//
//  StringExtension_codeTest.swift
//  Maps_codeTests
//
//  Created by adrià gonzález fernández on 06/06/2021.
//

import XCTest
@testable import Maps_code

class StringExtension_codeTest: XCTestCase {
    
    func testT01_VC_isValidEmail() {
        let email1 = "a@a.com"
        let email2 = ".com"
        
        XCTAssertTrue(email1.isValidEmail())
        XCTAssertFalse(email2.isValidEmail())
    }
    
    func testT01_VC_isValidPhone() {
        let phone1 = "987654321"
        let phone2 = "00"
        
        XCTAssertTrue(phone1.isValidPhone())
        XCTAssertFalse(phone2.isValidPhone( ))
    }
}
    
