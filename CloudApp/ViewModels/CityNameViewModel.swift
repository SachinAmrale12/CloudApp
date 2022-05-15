//
//  CityNameViewModel.swift
//  CloudApp
//
//  Created by Sachin Amrale on 14/05/22.
//

import Foundation

final class CityNameViewModel {
    
    private var latitude: Double?
    private var longitude: Double?
    
    func getCityDetails(name:  String, clouser: @escaping (_ weatherDetails: CityWeatherDetails?, _ error: String?) -> Void) {
        NetworkManager.shared.getCityCoordinates(cityName: name) { [weak self] isSuccessful, error, result, statusCode in
            if isSuccessful {
                do {
                    let decoder = JSONDecoder()
                    guard let data = result as? Data else { return }
                    let responseData = try decoder.decode([CityCoordinateDetails].self, from: data)
                    self?.longitude = responseData.first?.lon
                    self?.latitude = responseData.first?.lat
                    self?.getWeatherDetails(clouser: clouser)
                } catch(let error) {
                    print(error)
                }
            } else {
                clouser(nil, error ?? Constants.Error.genericError)
            }
        }
    }
    
    private func getWeatherDetails(clouser: @escaping (_ weatherDetails: CityWeatherDetails?, _ error: String?) -> Void) {
        if let latitude = self.latitude, let longitude = self.longitude {
            NetworkManager.shared.getWeatherDetails(latitude: latitude, longitude: longitude) { isSuccessful, error, result, statusCode in
                if isSuccessful {
                    do {
                        let decoder = JSONDecoder()
                        guard let data = result as? Data else { return }
                        let responseData = try decoder.decode(CityWeatherDetails.self, from: data)
                        clouser(responseData, nil)
                    } catch(let error) {
                        print(error)
                    }
                } else {
                    clouser(nil, error ?? Constants.Error.genericError)
                }
            }
        }
    }
}
