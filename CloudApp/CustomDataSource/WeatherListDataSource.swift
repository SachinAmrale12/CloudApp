//
//  WeatherListDataSource.swift
//  CloudApp
//
//  Created by Sachin Amrale on 15/05/22.
//

import Foundation

enum WeatherListCellTypes {
    case temperature
    case weather
    case clouds
    case wind
}

protocol WeatherListCellType {
    var cellType: WeatherListCellTypes { get }
}

final class TemperatureCellViewModel: WeatherListCellType {
    
    var cellType: WeatherListCellTypes { return .temperature }
    var temperature: Double?
    var humidity: Double?
    var pressure: Double?
    
    init(temp: Double?, humidity: Double?, pressure: Double?) {
        self.temperature = temp
        self.humidity = humidity
        self.pressure = pressure
    }
}

final class WeatherCellViewModel: WeatherListCellType {
    var cellType: WeatherListCellTypes { return .weather }
    var main: String?
    var description: String?
    var icon: String?
    
    init(main: String?, description: String?, icon: String?) {
        self.main = main
        self.description = description
        self.icon = icon
    }
}

final class CloudsCellViewModel: WeatherListCellType {
    var cellType: WeatherListCellTypes { return .clouds }
    var all: Double?
    
    init(all: Double?) {
        self.all = all
    }
}

final class WindCellViewModel: WeatherListCellType {
    var cellType: WeatherListCellTypes { return .wind }
    var speed: Double?
    var deg: Double?
    var gust: Double?
    
    init(speed: Double?, deg: Double?, gust: Double?) {
        self.speed = speed
        self.deg = deg
        self.gust = gust
    }
}
