//
//  NavigationManager.swift
//  CloudApp
//
//  Created by Sachin Amrale on 15/05/22.
//

import Foundation
import UIKit

class NavigationManager {
    class func navigateToWeatherListScreen(_ viewModel: WeatherListViewModel,
                                           from viewController: UIViewController) {
        guard let controller = viewController.instantiateVC(withIdentifier: Constants.StoryboardId.weatherList) as? WeatherListViewController else {
            return
        }
        controller.viewModel = viewModel
        viewController.navigationController?.pushViewController(controller, animated: true)
    }
}
