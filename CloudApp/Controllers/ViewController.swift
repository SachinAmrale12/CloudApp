//
//  ViewController.swift
//  CloudApp
//
//  Created by Sachin Amrale on 14/05/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var textFieldCityName: UITextField!
    @IBOutlet private weak var buttonLookUp: UIButton!
    
    let viewModel = CityNameViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupTextField()
        setupButton()
        // Do any additional setup after loading the view.
    }
    
    private func setupTextField() {
        textFieldCityName.font  =  UIFont.getStandardFont(size: 16)
        textFieldCityName.textColor = .black
        textFieldCityName.setPlaceholder(Constants.CopyConstants.textFieldPlaceholer,                              .lightGray,
                                         UIFont.getStandardFont(size: 16))
        textFieldCityName.addBottomLine()
    }
    
    private func setupButton() {
        buttonLookUp.layer.cornerRadius = 5
        buttonLookUp.layer.borderColor = UIColor.black.cgColor
        buttonLookUp.layer.borderWidth = 1
        buttonLookUp.titleLabel?.font = UIFont.getBoldFont(size: 17)
        buttonLookUp.setTitle(Constants.CopyConstants.buttonTitle, for: .normal)
        buttonLookUp.setTitleColor(.black, for: .normal)
    }

    @IBAction func lookUpButtonTapped(_ sender: Any) {
        if let name = textFieldCityName.text?.trimmingCharacters(in: .whitespacesAndNewlines), !name.isEmpty {
            if Reachability.isConnectedToNetwork() {
                showActivityIndicator(loadingText: Constants.CopyConstants.loaderText)
                viewModel.getCityDetails(name: name) { [weak self] (weatherDetails, error) in
                    self?.hideActivityIndicator()
                    guard let details = weatherDetails else {
                        self?.showToast(message: error ?? Constants.Error.genericError)
                        return
                    }
                    guard let self = self else { return }
                    let viewModel = WeatherListViewModel(details: details)
                    NavigationManager.navigateToWeatherListScreen(viewModel, from: self)
                }
            } else {
                showToast(message: Constants.Error.noInternetError)
            }
        } else {
            showToast(message: Constants.Error.cityNameEmptyError)
        }
        
    }
    
}

