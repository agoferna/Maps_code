//
//  ReportModel.swift
//  Maps_code
//
//  Created by adrià gonzález fernández on 06/06/2021.
//

import Foundation

struct Report {
    let name,surname, email,description : String
    let phone: Int
    let date : Date?
    
    
    init(name: String, surname: String, phone: Int, email:String, date: Date?, description: String){
       
        self.name = name
        self.surname = surname
        self.phone = phone
        self.email = email
        self.date = date
        self.description =  description
    }
    
    init(name: String, surname: String, phoneString: String, email:String, dateString: String, description: String){
       
        let phoneNumber = Int(phoneString) ?? -1
        let date = DateFormatter().getDateFromStringTextField(dateString: dateString)
        
        self.init(name: name, surname: surname, phone: phoneNumber, email: email, date: date, description: description)
    }
}
