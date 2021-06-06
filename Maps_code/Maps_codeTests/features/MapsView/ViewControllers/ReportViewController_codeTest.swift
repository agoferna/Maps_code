//
//  ReportViewController_codeTest.swift
//  Maps_codeTests
//
//  Created by adrià gonzález fernández on 06/06/2021.
//

import XCTest
@testable import Maps_code

class ReportViewController_codeTests: XCTestCase {

    
    private var reportVCTest: ReportViewController!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let storyboard = UIStoryboard(name: "Maps", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "ReportViewController") as! ReportViewController
        reportVCTest = vc
        let _ = reportVCTest.view
    }
    
    override func tearDown() {
        reportVCTest = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testT01_VC_01_isViewLoaded() {
        let view = reportVCTest.view
        XCTAssertNotNil(view,"Can't find View instance")
    }
    
    func testT01_VC_02_didReceiveMemoryWarning() {
        let view = reportVCTest.view
        reportVCTest.didReceiveMemoryWarning()
        XCTAssertNotNil(view, "View is nil")
    }
    
    func testT01_VC_03_viewWillAppear() {
        reportVCTest.viewWillAppear(true)
        XCTAssertNotNil(reportVCTest, "View Controller is nil")
    }
    
    func testT01_VC_04_viewDidAppear() {
        reportVCTest.viewDidAppear(true)
        XCTAssertNotNil(reportVCTest, "View Controller is nil")
    }
    
    func testT01_VC_05_viewWillDisappear() {
        reportVCTest.viewWillDisappear(true)
        XCTAssertNotNil(reportVCTest, "View Controller is nil")
    }
    
    func testT01_VC_06_viewDidDisappear() {
        reportVCTest.viewDidDisappear(true)
        XCTAssertNotNil(reportVCTest, "View Controller is nil")
    }
}
