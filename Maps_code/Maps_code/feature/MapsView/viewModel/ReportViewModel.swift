//
//  ReportViewModel.swift
//  Maps_code
//
//  Created by adrià gonzález fernández on 06/06/2021.
//

import Foundation

class ReportViewModel : NSObject {
    
    func saveReportRealmModel(report: Report){
        let reportRealmModel = ReportRealmModel(report: report)
        ReportRealmModel.createReport(report: reportRealmModel)
    }
}

