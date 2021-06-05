//
//  RestConfiguration.swift
//  Maps_code
//
//  Created by adrià gonzález fernández on 05/06/2021.
//

import Foundation

class RestConfiguration {
    
    static let RestId = "<#id>"
    
    static let TripsServiceEndPoint = "https://europe-west1-metropolis-fe-test.cloudfunctions.net/api/trips"
    static let StopServiceEndPoint = "https://europe-west1-metropolis-fe-test.cloudfunctions.net/api/stops/<#id>"
    
    func composeStopServiceEndPoint(_ id : String) -> String {
        var path = RestConfiguration.StopServiceEndPoint
        path = path.replacingOccurrences(of: RestConfiguration.RestId, with: id)
        return path
        
    }
    
}
