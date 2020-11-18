//
//  CoinViewModel.swift
//  MercadoBitcoin
//
//  Created by Huallyd Smadi on 16/11/20.
//  Copyright © 2020 Huallyd Smadi. All rights reserved.
//

import UIKit

struct CoinViewModel {
    var title: String {
        "\(name) (\(id))"
    }

    let id: String
    let name: String
    let valueHour: String
    let valueDay: String
    let valueMonth: String
    let url: String?
    let startDate: String?
    let endDate: String?
    
    private let imageService: ImageService?

    // MARK: Initializers

    init(entity: Coin) {
        id = entity.id
        name = entity.name
        valueHour = CoinViewModel.setupCurrency(at: entity.valueHour)
        valueDay = CoinViewModel.setupCurrency(at: entity.valueDay)
        valueMonth = CoinViewModel.setupCurrency(at: entity.valueMonth)
        startDate = entity.startDate
        endDate = entity.endDate
        url = nil
        imageService = nil
    }

    init(entity: Coin, url: String, imageService: ImageService) {
        id = entity.id
        name = entity.name
        valueHour = CoinViewModel.setupCurrency(at: entity.valueHour)
        valueDay = CoinViewModel.setupCurrency(at: entity.valueDay)
        valueMonth = CoinViewModel.setupCurrency(at: entity.valueMonth)
        startDate = entity.startDate
        endDate = entity.endDate
        self.url = url
        self.imageService = imageService
    }
    
    // MARK: Private function

    private static func setupCurrency(at value: Double) -> String {
        let formatter = NumberFormatter()
        formatter.locale = .init(identifier: "en_US")
        formatter.numberStyle = .currency

        return formatter.string(from: NSNumber(value: value)) ?? ""
    }

    // MARK: Function

    func requestImage(of imageView: UIImageView) {
        imageService?.request(url: url, imageView: imageView,
                              placeholderImage: Assets.placeholderIcon.image)
    }
}
