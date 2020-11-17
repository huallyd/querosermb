//
//  CoinViewModel.swift
//  MercadoBitcoin
//
//  Created by Huallyd Smadi on 16/11/20.
//  Copyright © 2020 Huallyd Smadi. All rights reserved.
//

import UIKit
import Kingfisher

struct CoinViewModel {
    var title: String {
        "\(name) (\(id))"
    }

    var currencyValue: String {
        let formatter = NumberFormatter()
        formatter.locale = .init(identifier: "en_US")
        formatter.numberStyle = .currency

        return formatter.string(from: NSNumber(value: value)) ?? ""
    }

    let id: String
    let name: String
    let value: Double
    let url: String?

    // MARK: Initializers

    init(entity: Coin) {
        id = entity.id
        name = entity.name
        value = entity.valueDay
        url = nil
    }
    
    init(entity: Coin, url: String) {
        id = entity.id
        name = entity.name
        value = entity.valueDay
        self.url = url
    }

    // MARK: Function

    func requestImage(of imageView: UIImageView) {
        let url = URL(string: self.url ?? "")
        imageView.kf.setImage(with: url, options: [.transition(.fade(0.2)), .cacheOriginalImage])
    }
}
