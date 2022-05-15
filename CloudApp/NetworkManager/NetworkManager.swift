//
//  NetworkManager.swift
//  CloudApp
//
//  Created by Sachin Amrale on 14/05/22.
//

import Foundation
import Alamofire

final class NetworkManager {
    
    static let shared = NetworkManager()
    private init () {}
    
    // MARK: - Get city coordinates
    func getCityCoordinates(cityName: String, limit: Int = 1, completionClouser: @escaping (_ isSuccessful: Bool, _ error: String?, _ result: Any?, _ statusCode: Int) -> Void) {
        let url = Constants.APISignature.coordinateUrl + "?q=\(cityName)&limit=\(limit)&appid=\(Constants.APIKeys.OpenWeatherAPIKey)"
        print(url)
        executeRequest(url: url,
                       httpMethodType: Constants.APIConfigConstants.HttpGET,
                       parameters: nil) { isSuccessful, error, result, statusCode in
            if isSuccessful {
                completionClouser(isSuccessful, nil, result, statusCode)
            } else {
                completionClouser(isSuccessful, error, nil, statusCode)
            }
        }
    }
    
    // MARK: - Get weather details
    func getWeatherDetails(latitude: Double, longitude: Double, completionClouser: @escaping (_ isSuccessful: Bool, _ error: String?, _ result: Any?, _ statusCode: Int) -> Void) {
        let url = Constants.APISignature.weatherForcastUrl + "?lat=\(latitude)&lon=\(longitude)&appid=\(Constants.APIKeys.OpenWeatherAPIKey)"
        print(url)
        executeRequest(url: url,
                       httpMethodType: Constants.APIConfigConstants.HttpGET,
                       parameters: nil) { isSuccessful, error, result, statusCode in
            if isSuccessful {
                completionClouser(isSuccessful, nil, result, statusCode)
            } else {
                completionClouser(isSuccessful, error, nil, statusCode)
            }
        }
    }
    
    
    // MARK: - Server Connections Method
    fileprivate func executeRequest(url: String, httpMethodType: String, parameters: [String: Any]?, completionClouser: @escaping (_ isSuccessful: Bool, _ error: String?, _ result: Any?, _ statusCode: Int) -> Void) {
        guard let URL = URL(string: url) else { return }
        var request = URLRequest(url: URL)
        request.httpMethod = httpMethodType
        request.timeoutInterval = 60

        request.setValue(Constants.APIConfigConstants.AppJson, forHTTPHeaderField: Constants.APIConfigConstants.ContentTypeKey)

        if let params = parameters {
            do {
                if let data = try JSONSerialization.data(withJSONObject: params, options: JSONSerialization.WritingOptions(rawValue: 0)) as NSData? {
                    request.httpBody = data as Data
                }
            } catch {
            }
        }
        
        AF.request(request).response { response in
            if let statusCode = response.response?.statusCode {
                if statusCode >= 200 || statusCode <= 300 {
                    guard let data = response.data else { return }
                    completionClouser(true, nil, data, statusCode)
                } else {
                    completionClouser(false, response.error?.localizedDescription , nil, statusCode)
                }
            }
        }
    }
}
