//
//  StopModel.swift
//  Maps_code
//
//  Created by adrià gonzález fernández on 05/06/2021.
//

import Foundation

struct StopModel {
    let address,userName : String?
    let paid : Bool?
    let tripId: Int?
    let price: Double?
    let point : Point?
    let stopTime : Date?
    
    
    init(stopServiceModel: StopServiceModel){
       
        self.address = stopServiceModel.address
        self.userName = stopServiceModel.userName
        self.paid = stopServiceModel.paid
        self.tripId = stopServiceModel.tripId
        self.price = stopServiceModel.price
        self.point =  Point.init(pointServiceModel: stopServiceModel.point)
        
        if let stop = stopServiceModel.stopTime {
            self.stopTime = DateFormatter().getDateFromStringTimeStamp(timeStamp: stop)
        } else {
            self.stopTime = nil
        }
    }
}
