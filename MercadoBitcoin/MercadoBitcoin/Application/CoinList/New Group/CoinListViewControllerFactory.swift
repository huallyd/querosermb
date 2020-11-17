//
//  CoinListViewControllerFactory.swift
//  MercadoBitcoin
//
//  Created by Huallyd Smadi on 16/11/20.
//  Copyright © 2020 Huallyd Smadi. All rights reserved.
//

import UIKit

final class CoinListViewControllerFactory: NSObject {
    
    static func make(coordinator: CoinListViewCoordinator) -> CoinListViewController {
        let viewController = CoinListViewController(coordinator: coordinator,
                                                    gateway: StandardCoinGateway.shared,
                                                    imageService: StandardImageService.shared)
        viewController.title = Strings.CoinList.navigationTitle.localized
        
        return viewController
    }

}
