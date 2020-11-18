//
//  CoinListCoordinator.swift
//  MercadoBitcoin
//
//  Created by Huallyd Smadi on 16/11/20.
//  Copyright © 2020 Huallyd Smadi. All rights reserved.
//

import UIKit

protocol CoinListCoordinator: AnyObject {
    func showDetail(viewModel: CoinViewModel, animated: Bool)
    func back(animated: Bool)
}

extension CoinListCoordinator {
    func showDetail(viewModel: CoinViewModel) {
        showDetail(viewModel: viewModel, animated: true)
    }
    
    func back() {
        back(animated: true)
    }
}

final class CoinListViewCoordinator {
    
    private let navigationController: UINavigationController
    
    // MARK: Initializer

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

}

// MARK: Coordinator conforms

extension CoinListViewCoordinator: Coordinator {
    
    func start() {
        let viewController = CoinListViewControllerFactory.make(coordinator: self)
        navigationController.pushViewController(viewController, animated: true)
    }

}

// MARK: CoinListCoordinator conforms

extension CoinListViewCoordinator: CoinListCoordinator {
    
    func showDetail(viewModel: CoinViewModel, animated: Bool) {
        let viewController = CoinDetailViewControllerFactory.make(coordinator: self,
                                                                  coinViewModel: viewModel)
        navigationController.pushViewController(viewController, animated: animated)
    }
    
    func back(animated: Bool) {
        navigationController.popViewController(animated: animated)
    }

}
