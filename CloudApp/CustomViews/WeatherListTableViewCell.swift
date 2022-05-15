//
//  WeatherListTableViewCell.swift
//  CloudApp
//
//  Created by Sachin Amrale on 15/05/22.
//

import UIKit

class WeatherListTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var labelTitle: UILabel!
    @IBOutlet private weak var labelDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupLabels()
    }

    private func setupLabels() {
        labelTitle.textColor = .black
        labelDescription.textColor = .black
        labelDescription.font = UIFont.getBoldFont(size: 16)
        labelTitle.font = UIFont.getStandardFont(size: 16)
    }
    
    func configureUI(viewModel: WeatherListCellType) {
        switch viewModel.cellType {
        case .temperature:
            guard let viewModel = viewModel as? TemperatureCellViewModel else { return }
            labelTitle.text = "Temperature"
            labelDescription.text = "\(viewModel.temperature ?? 0)"
        case .weather:
            guard let viewModel = viewModel as? WeatherCellViewModel else { return }
            labelTitle.text = "Weather"
            labelDescription.text = "\(viewModel.main ?? "No data available")"
        case .clouds:
            guard let viewModel = viewModel as? CloudsCellViewModel else { return }
            labelTitle.text = "Clouds"
            labelDescription.text = "\(viewModel.all ?? 0)"
        case .wind:
            guard let viewModel = viewModel as? WindCellViewModel else { return }
            labelTitle.text = "Wind"
            labelDescription.text = "\(viewModel.speed ?? 0)"
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
