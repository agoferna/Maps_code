//
//  ReportViewModel_codeTest.swift
//  Maps_codeTests
//
//  Created by adrià gonzález fernández on 06/06/2021.
//


import XCTest
@testable import Maps_code

class ReportViewModel_codeTest: XCTestCase {
    
    func testT01_VC_initViewModel() {
        let reportViewModel = ReportViewModel()
        XCTAssertNotNil(reportViewModel)
    }
    
    func testT01_VC_saveReportRealmModel() {
        let reportViewModel = ReportViewModel()
        let report = Report(name: "", surname: "", phoneString: "", email: "", dateString: "", description: "")
        reportViewModel.saveReportRealmModel(report: report)
        XCTAssert(true)
    }
}
