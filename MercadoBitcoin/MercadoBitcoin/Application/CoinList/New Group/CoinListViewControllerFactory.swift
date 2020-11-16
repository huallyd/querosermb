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
        .init(coordinator: coordinator, gateway: StandardCoinGateway.shared)
    }

}
