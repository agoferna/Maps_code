//
//  DateExtension.swift
//  Maps_code
//
//  Created by adrià gonzález fernández on 05/06/2021.
//

import Foundation

extension Date {
    
    func getHourMinuteString() -> String{
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: self)
        let min = calendar.component(.minute, from: self)
        
        return "\(hour):\(min)"
    }
}
