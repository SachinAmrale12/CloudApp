//
//  CityCoordinateDetails.swift
//  CloudApp
//
//  Created by Sachin Amrale on 14/05/22.
//

import Foundation

struct CityCoordinateDetails: Codable {
    
    let name: String?
    let lat: Double?
    let lon: Double?
    let country: String?
    let state: String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case lat
        case lon
        case country
        case state
    }
}
