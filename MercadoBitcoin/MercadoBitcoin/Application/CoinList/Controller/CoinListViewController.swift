//
//  CoinListViewController.swift
//  MercadoBitcoin
//
//  Created by Huallyd Smadi on 16/11/20.
//  Copyright © 2020 Huallyd Smadi. All rights reserved.
//

import UIKit

final class CoinListViewController: BaseViewController {
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.showsVerticalScrollIndicator = false

        return tableView
    }()

    private lazy var dataSource: CoinListDataSource = {
        let didSelectCompletion: (CoinViewModel) -> Void = { [weak self] viewModel in
            self?.didSelect(viewModel: viewModel)
        }

        return .init(tableView: tableView, didSelectCompletion: didSelectCompletion)
    }()

    private lazy var viewModel: CoinListViewModel = .init(gateway: gateway)

    private weak var coordinator: CoinListCoordinator?
    private let gateway: CoinGateway

    // MARK: Initializer
    
    init(coordinator: CoinListCoordinator?, gateway: CoinGateway) {
        self.coordinator = coordinator
        self.gateway = gateway

        super.init()
    }
    
    // MARK: Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupLayout()
        requestCoins()
    }

    // MARK: Private functions
    
    private func setupView() {
        view.backgroundColor = .white
    }
    
    private func setupLayout() {
        view.addSubview(tableView, constraints: [
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor)
        ])
    }

    private func requestCoins() {
        viewModel.request { [weak self] viewModels in
            self?.dataSource.setup(viewModels: viewModels)
        }
    }
    
    private func didSelect(viewModel: CoinViewModel) {
        
    }

}
