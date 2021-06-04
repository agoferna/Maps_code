//
//  MapsViewModel.swift
//  Maps_code
//
//  Created by adrià gonzález fernández on 03/06/2021.
//

import Foundation


import Foundation

class MapsViewModel : NSObject {
    
    private(set) var trips : [Trip] = [] {
        didSet {
            self.bindEmployeeViewModelToController()
        }
    }
    
    var bindEmployeeViewModelToController : (() -> ()) = {}
    
    override init() {
        super.init()
        callFuncToGetTrips()
    }
    
    func callFuncToGetTrips() {
        ApiRestManager.getTripsService({ (result) in
            var trips:  [Trip] = []
            for  serviceTrip in result {
                let trip = Trip.init(tripServiceModel: serviceTrip)
                trips.append(trip)
            }
            self.trips = trips
        }, {(error) in
            
        })
    }
}
