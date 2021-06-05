//
//  StopServiceModel.swift
//  Maps_code
//
//  Created by adrià gonzález fernández on 05/06/2021.
//

import Foundation

struct StopServiceModel: Codable {
    let stopTime, address,userName : String?
    let paid : Bool?
    let tripId: Int
    let price: Double
    let point : PointServiceModel

    enum CodingKeys: String, CodingKey {
        case stopTime
        case address
        case userName
        case paid
        case tripId
        case price
        case point
    }
}
