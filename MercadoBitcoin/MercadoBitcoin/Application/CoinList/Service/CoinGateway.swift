//
//  CoinGateway.swift
//  MercadoBitcoin
//
//  Created by Huallyd Smadi on 16/11/20.
//  Copyright © 2020 Huallyd Smadi. All rights reserved.
//

import UIKit
import Alamofire

protocol CoinGateway {
    func requestCoins(completion: @escaping (Result<([Coin]), Error>) -> Void)
    func requestUrls(completion: @escaping (Result<([CoinIconURL]), Error>) ->Void)
}

final class StandardCoinGateway: CoinGateway {

    private let baseUrl = "https://rest.coinapi.io/v1/exchanges"
    static let shared = StandardCoinGateway()

    private let provider: ProviderService
    
    // MARK: Initializer

    private init(provider: ProviderService = AlamofireProviderService.shared) {
        self.provider = provider
    }
    
    func requestCoins(completion: @escaping (Result<([Coin]), Error>) -> Void) {
        provider.request(url: baseUrl, method: .get) { (entities: [Coin]?) in
            if let coins = entities {
                completion(.success(coins))
            }
        }
    }
    
    func requestUrls(completion: @escaping (Result<([CoinIconURL]), Error>) ->Void) {
        let url = baseUrl + "/icons/500"

        provider.request(url: url, method: .get) { (entities: [CoinIconURL]?) in
            if let coinIcons = entities {
                completion(.success(coinIcons))
            }
        }
    }

}
