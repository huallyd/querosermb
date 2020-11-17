//
//  CoinListViewController.swift
//  MercadoBitcoin
//
//  Created by Huallyd Smadi on 16/11/20.
//  Copyright © 2020 Huallyd Smadi. All rights reserved.
//

import UIKit

final class CoinListViewController: BaseViewController {
    
    private let refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.tintColor = .orange
        refreshControl.addTarget(self, action: #selector(requestCoins), for: .valueChanged)

        return refreshControl
    }()

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

    private lazy var viewModel: CoinListViewModel = .init(gateway: gateway,
                                                          imageService: imageService,
                                                          loadable: self)

    private weak var coordinator: CoinListCoordinator?
    private let gateway: CoinGateway
    private let imageService: ImageService

    // MARK: Initializer
    
    init(coordinator: CoinListCoordinator?, gateway: CoinGateway, imageService: ImageService) {
        self.coordinator = coordinator
        self.gateway = gateway
        self.imageService = imageService

        super.init()
    }

    // MARK: Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupLayout()
        setupRefreshControl()
        requestCoins()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        tableView.deselectRow()
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

    @objc private func requestCoins() {
        viewModel.request { [weak self] viewModels in
            self?.dataSource.setup(viewModels: viewModels)
            self?.refreshControl.endRefreshing()
        }
    }

    private func setupRefreshControl() {
        tableView.refreshControl = refreshControl
    }

    private func didSelect(viewModel: CoinViewModel) {
        coordinator?.showDetail(viewModel: viewModel)
    }

}
