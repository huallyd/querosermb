//
//  CoinGatewayMock.swift
//  MercadoBitcoinTests
//
//  Created by Huallyd Smadi on 17/11/20.
//  Copyright © 2020 Huallyd Smadi. All rights reserved.
//

import UIKit

@testable import MercadoBitcoin

final class CoinGatewayMock: CoinGateway {

    private(set) var invokedRequestCoins = false
    var stubbedRequestCoinsCompletionResult: (Result<([Coin]), Error>, Void)?
    private(set) var invokedRequestUrls = false
    var stubbedRequestUrlsCompletionResult: (Result<([CoinIconURL]), Error>, Void)?

    func requestCoins(completion: @escaping (Result<([Coin]), Error>) -> Void) {
        invokedRequestCoins = true
        if let result = stubbedRequestCoinsCompletionResult {
            completion(result.0)
        }
    }

    func requestUrls(completion: @escaping (Result<([CoinIconURL]), Error>) ->Void) {
        invokedRequestUrls = true
        if let result = stubbedRequestUrlsCompletionResult {
            completion(result.0)
        }
    }
}
