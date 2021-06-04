//
//  TripsServiceModel.swift
//  Maps_code
//
//  Created by adrià gonzález fernández on 03/06/2021.
//

import Foundation

// MARK: - Welcome

struct PointServiceModel: Codable {
    let _longitude : Double?
    let _latitude : Double?
    
    
    enum CodingKeys: String, CodingKey {
        case _longitude
        case _latitude
    }
}

struct DestinationServiceModel: Codable {
    let address : String?
    let point : PointServiceModel?
}


struct  StopsServiceModel: Codable {
    let id : Int?
    let point : PointServiceModel?
    
    enum CodingKeys: String, CodingKey {
        case id
        case point
    }
}

// MARK: - Datum
struct TripServiceModel: Codable {
    let description, driverName,endTime,startTime,status,route : String?
    let destination, origin : DestinationServiceModel?
    let stops : [StopsServiceModel?]?
    

    enum CodingKeys: String, CodingKey {
        case description
        case driverName
        case endTime
        case startTime
        case status
        case route
        case destination
        case origin
        case stops
    }
}
