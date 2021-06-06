//
//  MarkerView_codeTest.swift
//  Maps_codeTests
//
//  Created by adrià gonzález fernández on 06/06/2021.
//

import XCTest
@testable import Maps_code

class MarkerView_codeTest: XCTestCase {

    
    private var markerView: MarkerView!
    
    override func setUp() {
        super.setUp()
        self.markerView = MarkerView(frame: CGRect(x: 0, y: 0, width: 200, height: 80))
        self.markerView?.configureData(stationName: "stationName",
                                          passengerName: "passenger",
                                          stopTime: "time",
                                          price: "22.0")
        markerView.configureView()
    }
    
    func testT01_VC_01_initNotNil() {
        markerView.awakeFromNib()
        XCTAssertNotNil(markerView,"Can't find View instance")
    }
}
