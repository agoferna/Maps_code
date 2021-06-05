//
//  ApiRestManager.swift
//  Maps_code
//
//  Created by adrià gonzález fernández on 03/06/2021.
//

import Foundation
import Alamofire

struct NetworkError: Decodable {
    
    var error: String?
}

enum ResponseType {
    case data
    case json
    case string
}

class ApiRestManager {

    
    static func getTripsService(_ completion: @escaping (([TripServiceModel]) -> Void),
                         _ completionError: @escaping ((AFError) -> Void)){
        
        let tripsServiceUrl = RestConfiguration.TripsServiceEndPoint
        AF.request(tripsServiceUrl,method: .get).responseJSON(completionHandler: { response in
            switch response.result {

            case .success(let json):
                var tripsData : [TripServiceModel] = []
                if let res = json as? [[String: Any]]{
                    for item in res{
                        do {
                             let data = try JSONSerialization.data(withJSONObject: item, options: [])
                               let trip = try JSONDecoder().decode(TripServiceModel.self, from:data)
                            tripsData.append(trip)
                           } catch  {}
                    }
                    completion(tripsData)
               }
            case .failure(let error):
                completionError(error)
            }
        })
        }
    
    
    static func getStopsInfo(stopId: String,
                             _ completion: @escaping ((StopServiceModel?) -> Void),
                         _ completionError: @escaping ((AFError) -> Void)){
        
        let stopsServiceUrl = RestConfiguration().composeStopServiceEndPoint(stopId)
        AF.request(stopsServiceUrl,
                   method: .get).responseJSON(completionHandler: { response in
            switch response.result {

            case .success(let json):
                var stopData : StopServiceModel?
                if let res = json as? [String: Any]{
                        do {
                             let data = try JSONSerialization.data(withJSONObject: res, options: [])
                            stopData = try JSONDecoder().decode(StopServiceModel.self, from:data)
                           } catch  {}
                    completion(stopData)
               }
            case .failure(let error):
                completionError(error)
            }
        })
        }
}
