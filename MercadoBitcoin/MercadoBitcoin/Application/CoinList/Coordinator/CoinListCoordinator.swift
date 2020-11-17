//
//  CoinListCoordinator.swift
//  MercadoBitcoin
//
//  Created by Huallyd Smadi on 16/11/20.
//  Copyright © 2020 Huallyd Smadi. All rights reserved.
//

import UIKit

protocol CoinListCoordinator: AnyObject {
    func showDetail()
    func back()
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
        viewController.title = Strings.CoinList.navigationTitle.localized
        navigationController.pushViewController(viewController, animated: true)
    }

}

// MARK: CoinListCoordinator conforms

extension CoinListViewCoordinator: CoinListCoordinator {
    
    func showDetail() {
        
    }
    
    func back() {
        navigationController.popViewController(animated: true)
    }

}
