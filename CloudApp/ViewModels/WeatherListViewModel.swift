//
//  WeatherListViewModel.swift
//  CloudApp
//
//  Created by Sachin Amrale on 15/05/22.
//

import Foundation

final class WeatherListViewModel {
    
    var dataSource = [WeatherListCellType]()
    private var weatherListDetails: CityWeatherDetails?
    var cityName : String {
        return self.weatherListDetails?.city?.name ?? ""
    }
    
    init (details: CityWeatherDetails) {
        self.weatherListDetails = details
    }
    
    func makeDataSource(clouser: @escaping (_ isFinished: Bool) -> Void) {
        dataSource.removeAll()
        let details = self.weatherListDetails?.list?.first
        let tempViewModel = TemperatureCellViewModel(temp: details?.main?.temp, humidity: details?.main?.humidity, pressure: details?.main?.pressure)
        dataSource.append(tempViewModel)
        
        let weatherViewModel = WeatherCellViewModel(main: details?.weather?.first?.main, description: details?.weather?.first?.description, icon: details?.weather?.first?.icon)
        dataSource.append(weatherViewModel)
        
        let cloudsViewModel = CloudsCellViewModel(all: details?.clouds?.all)
        dataSource.append(cloudsViewModel)
        
        let windViewModel = WindCellViewModel(speed: details?.wind?.speed, deg: details?.wind?.deg, gust: details?.wind?.gust)
        dataSource.append(windViewModel)
        clouser(true)
    }
}
