//
//  CityWeatherDetails.swift
//  CloudApp
//
//  Created by Sachin Amrale on 15/05/22.
//

import Foundation

struct CityWeatherDetails: Codable {
    var list: [WeatherList]?
    var city: CityCoordinateDetails?
    
    enum CodingKeys: String, CodingKey {
        case list
        case city
    }
}

struct WeatherList: Codable {
    var main: TemperatureDetails?
    var weather: [WeatherDetails]?
    var clouds: CloudDetails?
    var wind: WindDetails?
    var visibility: Double?
    
    enum CodingKeys: String, CodingKey {
        case main
        case weather
        case clouds
        case wind
        case visibility
    }
}

struct TemperatureDetails: Codable {
    var temp: Double?
    var feelsLike: Double?
    var tempMin: Double?
    var tempMax: Double?
    var pressure: Double?
    var seaLevel: Double?
    var groundLevel: Double?
    var humidity: Double?
    var tempKf: Double?
    
    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure
        case seaLevel = "sea_level"
        case groundLevel = "grnd_level"
        case humidity
        case tempKf = "temp_kf"
    }
}


struct WeatherDetails: Codable {
    var id: Int?
    var main: String?
    var description: String?
    var icon: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case main
        case description
        case icon
    }
}

struct CloudDetails: Codable {
    var all: Double?
    
    enum CodingKeys: String, CodingKey {
        case all
    }
}

struct WindDetails: Codable {
    var speed: Double?
    var deg: Double?
    var gust: Double?
    
    enum CodingKeys: String, CodingKey {
        case speed
        case deg
        case gust
    }
}
