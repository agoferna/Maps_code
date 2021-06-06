//
//  ReportRealmModel.swift
//  Maps_code
//
//  Created by adrià gonzález fernández on 06/06/2021.
//

import Foundation
import RealmSwift

class ReportRealmModel: Object {

    @objc dynamic var id : Int = -1
    @objc dynamic var name : String = ""
    @objc dynamic var surname : String = ""
    @objc dynamic var phone : Int = 0
    @objc dynamic var email : String = ""
    @objc dynamic var date : Date?
    @objc dynamic var reportDescription : String = ""

    convenience init(report: Report) {
        
        self.init()
        self.id = self.incrementID()
        self.name = report.name
        self.surname = report.surname
        self.phone = report.phone
        self.email = report.email
        self.date = report.date
        self.reportDescription = report.description
    }


    override static func primaryKey() -> String? {
        return "id"
    }
    
    static func createReport(report: ReportRealmModel) {
        do {
            let realm = try Realm()
            realm.beginWrite()
            realm.add(report, update: .all)
            try realm.commitWrite()
        } catch { print("Error info: \(error.localizedDescription)") }
    }
    
    static func numberOfReports() -> Int {
        let realm = try! Realm()
        let report = realm.objects(ReportRealmModel.self)
        return report.count
    }

    func incrementID() -> Int{
        let realm = try! Realm()
        let reportId = realm.objects(ReportRealmModel.self)
        let maxId = reportId.map{$0.id}.max() ?? -1
        return maxId + 1
    }
}
