//
//  Constant.swift
//  CloudApp
//
//  Created by Sachin Amrale on 14/05/22.
//

import Foundation

struct Constants {
    struct APIKeys{
        static let OpenWeatherAPIKey = "65d00499677e59496ca2f318eb68c049"
    }
    
    //MARK:- API Configuration Constants
    struct APIConfigConstants {
        static let HttpGET           = "GET"
        static let HttpPOST          = "POST"
        static let HttpPUT           = "PUT"
        static let HttpDELETE        = "DELETE"
        static let HttpPATCH         = "PATCH"
        
        static let ContentTypeKey    = "Content-Type"
        static let AppJson           = "application/json"
    }
    
    //MARK:- API Signatures
    struct APISignature {
        static let coordinateUrl     = "http://api.openweathermap.org/geo/1.0/direct"
        static let weatherForcastUrl = "https://pro.openweathermap.org/data/2.5/forecast/hourly"
    }
    
    struct CopyConstants {
        static let textFieldPlaceholer = "City Name"
        static let buttonTitle = "Lookup"
        static let loaderText = "fetching details..."
    }
    
    struct Error {
        static let cityNameEmptyError = "Please enter city name"
        static let noInternetError = "Please check your internet connection"
        static let genericError = "something went wrong!"
    }
    
    struct StoryboardId {
        static let weatherList = "WeatherListViewController"
    }
}
