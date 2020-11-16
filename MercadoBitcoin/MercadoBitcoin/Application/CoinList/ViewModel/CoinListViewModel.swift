//
//  CoinListViewModel.swift
//  MercadoBitcoin
//
//  Created by Huallyd Smadi on 16/11/20.
//  Copyright © 2020 Huallyd Smadi. All rights reserved.
//

import UIKit

struct CoinListViewModel {
    private let gateway: CoinGateway
    
    // MARK: Initializer
    
    init(gateway: CoinGateway) {
        self.gateway = gateway
    }
    
    // MARK: Function
    
    func request(completion: @escaping ([CoinViewModel]) -> Void) {
        gateway.requestCoins { result in
            switch result {
            case let .success(coins):
                completion(coins.map(CoinViewModel.init))
            case .failure(_): break
            }
        }
    }
}
