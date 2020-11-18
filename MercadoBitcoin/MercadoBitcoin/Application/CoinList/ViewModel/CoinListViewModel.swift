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
    private let imageService: ImageService
    private weak var loadable: Loadable?
    
    // MARK: Initializer
    
    init(gateway: CoinGateway, imageService: ImageService, loadable: Loadable) {
        self.gateway = gateway
        self.imageService = imageService
        self.loadable = loadable
    }

    // MARK: Private function
    
    private func resquestImages(entities: [Coin], completion: @escaping ([CoinViewModel]) -> Void) {
        gateway.requestUrls { result in
            switch result {
            case let .success(coinsUrl):

            completion(entities.map { coin -> CoinViewModel in
                let url = (coinsUrl.first(where: {$0.id == coin.id}))?.url ?? ""
                return .init(entity: coin, url: url, imageService: self.imageService)
            })

            case .failure(_): break
            }
        }
    }

    // MARK: Function
    
    func request(completion: @escaping ([CoinViewModel]) -> Void) {
        loadable?.load()

        gateway.requestCoins { result in
            self.loadable?.unload()
            switch result {
            case let .success(coins):
                completion(coins.map(CoinViewModel.init))
                self.resquestImages(entities: coins, completion: completion)
            case let .failure(error):
                completion([])
                self.loadable?.showError(description: error.localizedDescription)
            }
        }
    }
}
