//
//  DoubleExtension.swift
//  Maps_code
//
//  Created by adrià gonzález fernández on 05/06/2021.
//

import Foundation

extension Double {
    
    func getCurrency() -> String?{

        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "es_Es")
        formatter.numberStyle = .currency
        formatter.maximumFractionDigits = 2
        formatter.roundingMode = NumberFormatter.RoundingMode.halfUp
        
        if let formattedTipAmount = formatter.string(from: NSNumber(value: self)) {
           return formattedTipAmount
        } else {
            return nil
        }
    }
}
