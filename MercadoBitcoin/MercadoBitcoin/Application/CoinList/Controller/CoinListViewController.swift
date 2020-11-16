//
//  CoinListViewController.swift
//  MercadoBitcoin
//
//  Created by Huallyd Smadi on 16/11/20.
//  Copyright © 2020 Huallyd Smadi. All rights reserved.
//

import UIKit

final class CoinListViewController: BaseViewController {

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
        
    }
    
    private func requestCoins() {
        viewModel.request { viewModel in
            
        }
    }

}
