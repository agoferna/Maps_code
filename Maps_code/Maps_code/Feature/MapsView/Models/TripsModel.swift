//
//  TripsModel.swift
//  Maps_code
//
//  Created by adrià gonzález fernández on 04/06/2021.
//

import Foundation

// MARK: - Welcome

struct Destination  {
    let address : String?
    let point : Point?
    
    init(desServiceModel: DestinationServiceModel?){
        self.address = desServiceModel?.address
        self.point = Point.init(pointServiceModel: desServiceModel?.point)
    }
}

struct Point: Codable {
    let longitude : Double?
    let latitude : Double?
    
    init(pointServiceModel: PointServiceModel?){
        self.longitude = pointServiceModel?._longitude
        self.latitude = pointServiceModel?._latitude
    }
}

struct  Stops {
    let id : Int?
    let point : Point?
    
    init(stopServiceModel: StopsServiceModel?){
        self.id = stopServiceModel?.id
        self.point = Point.init(pointServiceModel: stopServiceModel?.point)
    }
}

enum TripStatus : String {
    case ongoing = "ongoing"
    case scheduled = "scheduled"
    case finalized = "finalized"
    case cancelled = "cancelled"
}

// MARK: - Datum
struct Trip {
    var description, driverName,route : String?
    var status : TripStatus?
    var endTime,startTime : Date?
    var destination, origin : Destination?
    var stops : [Stops?] = []
    
    init(tripServiceModel: TripServiceModel){
        
        self.description = tripServiceModel.description
        self.driverName = tripServiceModel.driverName
        self.route = tripServiceModel.route
        self.destination = Destination.init(desServiceModel: tripServiceModel.destination)
        self.origin = Destination.init(desServiceModel: tripServiceModel.origin)
        
        if let status =  tripServiceModel.status {
            self.status = TripStatus(rawValue: status)
        }
        
        if let endTripTime = tripServiceModel.endTime {
            self.endTime = DateFormatter().getDateFromStringTimeStamp(timeStamp: endTripTime)
        }
        
        if let startTripTime = tripServiceModel.startTime {
            self.startTime = DateFormatter().getDateFromStringTimeStamp(timeStamp: startTripTime)
        }
        
        if let serviceStopsArray = tripServiceModel.stops {
            for serviceStop in serviceStopsArray{
                let stop = Stops.init(stopServiceModel: serviceStop)
                self.stops.append(stop)
            }
        }
    }
}

