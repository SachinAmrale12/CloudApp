//
//  WeatherListViewController.swift
//  CloudApp
//
//  Created by Sachin Amrale on 15/05/22.
//

import UIKit

class WeatherListViewController: UIViewController {

    @IBOutlet private weak var viewNavigation: NavigationView!
    @IBOutlet private weak var tableView: UITableView!
    
    var viewModel: WeatherListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupTableView()
        setupNavigationBar()
        viewModel.makeDataSource { [weak self] (isFinished) in
            if isFinished {
                self?.tableView.reloadData()
            }
        }
        // Do any additional setup after loading the view.
    }

    private func setupNavigationBar() {
        viewNavigation.labelHeader.text = "Pune"
        viewNavigation.labelHeader.font = UIFont.getBoldFont(size: 18)
        viewNavigation.buttonBack.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
    }
    
    private func setupTableView() {
        tableView.register(UINib(nibName: "WeatherListTableViewCell", bundle: nil), forCellReuseIdentifier: "WeatherListTableViewCell")
        tableView.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
    }
    
    @objc func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
}

extension WeatherListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellViewModel = viewModel.dataSource[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherListTableViewCell") as! WeatherListTableViewCell
        cell.selectionStyle = .none
        cell.configureUI(viewModel: cellViewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
