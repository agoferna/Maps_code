//
//  StopModel_codeTest.swift
//  Maps_codeTests
//
//  Created by adrià gonzález fernández on 06/06/2021.
//

import XCTest
@testable import Maps_code

class StopModel_codeTest: XCTestCase {
    
    func testT01_VC_initStopModel() {
        
        let point = PointServiceModel(_longitude: 41.00, _latitude: 41.00)
        let stopServiceModel = StopServiceModel(stopTime: "",
                                                address: "",
                                                userName: "",
                                                paid: true,
                                                tripId: 1,
                                                price: 0.0,
                                                point: point)
        let stop = Stop(stopServiceModel: stopServiceModel)
        XCTAssertNotNil(stop)
    }
}
