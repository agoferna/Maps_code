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

    
    static func getTripsService(_ completion: @escaping (([Trip]) -> Void),
                         _ completionError: @escaping ((AFError) -> Void)){
        
        let tripsServiceUrl = "https://europe-west1-metropolis-fe-test.cloudfunctions.net/api/trips"
        AF.request(tripsServiceUrl,method: .get).responseJSON(completionHandler: { response in
            switch response.result {

            case .success(let json):
                var tripsData : [Trip] = []
                if let res = json as? [[String: Any]]{
                    for item in res{
                        do {
                             let data = try JSONSerialization.data(withJSONObject: item, options: [])
                               let trip = try JSONDecoder().decode(Trip.self, from:data)
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
}
