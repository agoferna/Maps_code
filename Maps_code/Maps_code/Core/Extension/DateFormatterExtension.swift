//
//  DateExtension.swift
//  Maps_code
//
//  Created by adrià gonzález fernández on 05/06/2021.
//

import Foundation

extension DateFormatter {
    
    func getDateFromStringTimeStamp(timeStamp : String) -> Date?{

        self.locale = Locale(identifier: "en_US_POSIX")
        self.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        return self.date(from: timeStamp)
    }
    
    func getDateFromStringTextField(dateString: String) -> Date?{

        let dateFormmater = DateFormatter()
        dateFormmater.dateFormat = "dd/MM/yyyy - HH:mm"
        return dateFormmater.date(from: dateString)
    }
    
    func getStringFromDateTextField(date: Date) -> String?{

        let dateFormmater = DateFormatter()
        dateFormmater.dateFormat = "dd/MM/yyyy - HH:mm"
        return dateFormmater.string(from: date)
    }
}
