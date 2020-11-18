//
//  CoinMock.swift
//  MercadoBitcoinTests
//
//  Created by Huallyd Smadi on 17/11/20.
//  Copyright © 2020 Huallyd Smadi. All rights reserved.
//

@testable import MercadoBitcoin

struct CoinMock {
    static var coins: [Coin] {
        [coin, coin, coin]
    }
    
    static var coin: Coin {
        .init(id: "BITCOIN-ID", site: "www.bitcoin.com", name: "Bitcoin", startDate: "10/09/2011", endDate: "11/10/2020", valueHour: 232.12,
              valueDay: 234.34, valueMonth: 29.23)
    }
    
    static var coinViewModel: CoinViewModel {
        .init(entity: coin, url: "www.google.com", imageService: ImageServiceMock())
    }
    
    static var coinDetailViewModel: CoinDetailViewModel {
        .init(coinViewModel: coinViewModel, imageService: ImageServiceMock())
    }
}
