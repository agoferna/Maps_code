//
//  MapsViewModel.swift
//  Maps_code
//
//  Created by adrià gonzález fernández on 03/06/2021.
//

import Foundation

class MapsViewModel : NSObject {
    
    private(set) var trips : [Trip] = [] {
        didSet {
            self.bindEmployeeViewModelToController()
        }
    }
    
    private(set) var stop : Stop? {
        didSet {
            self.bindMarkerView()
        }
    }
    
    var bindEmployeeViewModelToController : (() -> ()) = {}
    var bindMarkerView: (() -> ()) = {}
    
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
    
    func callFuncToGetStopInfo(stopId : Int) {
        ApiRestManager.getStopsInfo(stopId: "\(stopId)",
                                    { (result) in
                                        if let stopServiceModel = result {
                                            self.stop = Stop.init(stopServiceModel: stopServiceModel)
                                        }
                                    }, {(error) in
                                        
                                    })
    }
    
    func getTrip(tripIndex: Int) ->  Trip? {
        if tripIndex < trips.count {
            return trips[tripIndex]
        } else {
            return nil
        }
    }
}
