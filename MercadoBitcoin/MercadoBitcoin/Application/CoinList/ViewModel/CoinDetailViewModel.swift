//
//  CoinDetailViewModel.swift
//  MercadoBitcoin
//
//  Created by Huallyd Smadi on 17/11/20.
//  Copyright © 2020 Huallyd Smadi. All rights reserved.
//

import UIKit

struct CoinDetailViewModel {
    let url: String?
    let detailViewModels: [DetailViewModel]
    
    private let imageService: ImageService

    init(coinViewModel: CoinViewModel,
         imageService: ImageService) {
        url = coinViewModel.url
        detailViewModels = CoinDetailViewModel.setupDetailViewModels(at: coinViewModel)
        self.imageService = imageService
    }

    private static func setupDetailViewModels(at coinViewModel: CoinViewModel) -> [DetailViewModel] {
        let texts = Strings.CoinDetail.Title.self
        
        var titles = [texts.id.localized, texts.name.localized]
        var values = [coinViewModel.id, coinViewModel.name]
        
        if let startDate = coinViewModel.startDate {
            titles.append(texts.startDate.localized)
            values.append(startDate)
        }
        
        if let endDate = coinViewModel.endDate {
            titles.append(texts.endDate.localized)
            values.append(endDate)
        }
        
        titles.append(contentsOf: [texts.volumeHour.localized, texts.volumeDay.localized, texts.volumeMonth.localized])
        values.append(contentsOf: [coinViewModel.valueHour, coinViewModel.valueDay,
                                   coinViewModel.valueMonth])

        return zip(titles, values).map(DetailViewModel.init)
    }
    
    // MARK: Function

    func requestImage(of imageView: UIImageView) {
        imageService.request(url: url, imageView: imageView, placeholderImage: UIImage(named: "placeholder-icon")!)
    }

}
