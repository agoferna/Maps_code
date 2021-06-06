//
//  Maps_codeTests.swift
//  Maps_codeTests
//
//  Created by adrià gonzález fernández on 02/06/2021.
//

import XCTest
@testable import Maps_code

class MapsViewController_codeTests: XCTestCase {

    
    private var mapsVCTest: MapsViewController!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let storyboard = UIStoryboard(name: "Maps", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "MapsViewController") as! MapsViewController
        mapsVCTest = vc
        let _ = mapsVCTest.view
    }
    
    override func tearDown() {
        mapsVCTest = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testT01_VC_01_isViewLoaded() {
        let view = mapsVCTest.view
        XCTAssertNotNil(view,"Can't find View instance")
    }
    
    func testT01_VC_02_didReceiveMemoryWarning() {
        let view = mapsVCTest.view
        mapsVCTest.didReceiveMemoryWarning()
        XCTAssertNotNil(view, "View is nil")
    }
    
    func testT01_VC_03_viewWillAppear() {
        mapsVCTest.viewWillAppear(true)
        XCTAssertNotNil(mapsVCTest, "View Controller is nil")
    }
    
    func testT01_VC_04_viewDidAppear() {
        mapsVCTest.viewDidAppear(true)
        XCTAssertNotNil(mapsVCTest, "View Controller is nil")
    }
    
    func testT01_VC_05_viewWillDisappear() {
        mapsVCTest.viewWillDisappear(true)
        XCTAssertNotNil(mapsVCTest, "View Controller is nil")
    }
    
    func testT01_VC_06_viewDidDisappear() {
        mapsVCTest.viewDidDisappear(true)
        XCTAssertNotNil(mapsVCTest, "View Controller is nil")
    }
    
    func testT01_VC_PublicMethods_01() {
       
        let pointServiceModel = PointServiceModel(_longitude: 41.0000, _latitude: 41.0000)
        let point = Point(pointServiceModel: pointServiceModel)
        let marker1 = mapsVCTest.createMarker(point: point)
        
        XCTAssert(true)
        XCTAssertNotNil(marker1)
        
        let pointServiceModel2 = PointServiceModel(_longitude: nil, _latitude: nil)
        let point2 = Point(pointServiceModel: pointServiceModel2)
        let marker2 = mapsVCTest.createMarker(point: point2)
        
        XCTAssert(true)
        XCTAssertNil(marker2)
    }
    
    func testT01_VC_PublicMethods_02() {
        
        let pointServiceModel = PointServiceModel(_longitude: 41.0000, _latitude: 41.0000)
        let destinationServiceModel = DestinationServiceModel(address: "", point: pointServiceModel)
        let tripServiceModel = TripServiceModel(description: "",
                                                driverName: "",
                                                endTime: "",
                                                startTime: "",
                                                status: "ongoing",
                                                route: "",
                                                destination: destinationServiceModel,
                                                origin: destinationServiceModel,
                                                stops: [])
        
        
        let trip =  Trip(tripServiceModel: tripServiceModel)
        let polilyne = mapsVCTest.configureMapPolyline(trip: trip)
        
        XCTAssert(true)
        XCTAssertNotNil(polilyne)
    }
    
    func testT01_VC_PublicMethods_03() {
        
        let pointServiceModel = PointServiceModel(_longitude: 41.0000, _latitude: 41.0000)
        let destinationServiceModel = DestinationServiceModel(address: "", point: pointServiceModel)
        let stopServiceModel : StopsServiceModel = StopsServiceModel(id: 1, point: pointServiceModel)
        
        let tripServiceModel = TripServiceModel(description: "",
                                                driverName: "",
                                                endTime: "",
                                                startTime: "",
                                                status: "ongoing",
                                                route: "",
                                                destination: destinationServiceModel,
                                                origin: destinationServiceModel,
                                                stops: [stopServiceModel])
        
        
        let trip =  Trip(tripServiceModel: tripServiceModel)
        let markers = mapsVCTest.configureMapMarkers(trip: trip)
        
        XCTAssert(true)
        XCTAssertNotNil(markers)
    }
}
