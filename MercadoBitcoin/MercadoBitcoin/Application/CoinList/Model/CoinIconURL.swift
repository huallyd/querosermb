//
//  CoinIconURL.swift
//  MercadoBitcoin
//
//  Created by Huallyd Smadi on 17/11/20.
//  Copyright © 2020 Huallyd Smadi. All rights reserved.
//

struct CoinIconURL: Decodable {
    let id: String
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case id = "exchange_id"
        case url
    }
}
