//
//  CoinIconURLMock.swift
//  MercadoBitcoinTests
//
//  Created by Huallyd Smadi on 17/11/20.
//  Copyright © 2020 Huallyd Smadi. All rights reserved.
//

@testable import MercadoBitcoin

struct CoinIconURLMock {
    static var coinIcons: [CoinIconURL] {
        [coinIcon, coinIcon, coinIcon]
    }
    
    static var coinIcon: CoinIconURL {
        .init(id: "BITCOIN-ID", url: "www.google.com")
    }
}
