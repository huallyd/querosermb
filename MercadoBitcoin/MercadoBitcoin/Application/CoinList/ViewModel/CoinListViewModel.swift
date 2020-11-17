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
    
    // MARK: Private function
    
    private func resquestImages(entities: [Coin], completion: @escaping ([CoinViewModel]) -> Void) {
        gateway.requestUrls { result in
            switch result {
            case let .success(coinsUrl):

            completion(entities.map { coin -> CoinViewModel in
                let url = (coinsUrl.first(where: {$0.id == coin.id}))?.url ?? ""
                return .init(entity: coin, url: url)
            })

            case .failure(_): break
            }
        }
    }

    // MARK: Function
    
    func request(completion: @escaping ([CoinViewModel]) -> Void) {
        gateway.requestCoins { result in
            switch result {
            case let .success(coins):
                completion(coins.map(CoinViewModel.init))
                self.resquestImages(entities: coins, completion: completion)
            case .failure(_): break
            }
        }
    }
}
