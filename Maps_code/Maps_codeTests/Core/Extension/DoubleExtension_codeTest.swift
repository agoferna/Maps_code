//
//  DoubleExtension_codeTest.swift
//  Maps_codeTests
//
//  Created by adrià gonzález fernández on 06/06/2021.
//

import XCTest
@testable import Maps_code

class DoubleExtension_codeTest: XCTestCase {
    
    func testT01_VC_getDateFromStringTimeStamp() {
        let double = 3.544
        let doubleCurrency = double.getCurrency()
        XCTAssertNotNil(doubleCurrency)
        XCTAssertEqual(doubleCurrency, "3,54 €")
        
        let double2 : Double? = nil
        let doubleCurrency2 = double2?.getCurrency()
        XCTAssertNil(doubleCurrency2)
    }
    
}
