//
//  ImageService.swift
//  MercadoBitcoin
//
//  Created by Huallyd Smadi on 17/11/20.
//  Copyright © 2020 Huallyd Smadi. All rights reserved.
//

import UIKit
import Kingfisher

protocol ImageService {
    func request(url: String?, imageView: UIImageView)
}

final class StandardImageService: ImageService {
    
    static let shared = StandardImageService()
    
    private init() {}
    
    func request(url: String?, imageView: UIImageView) {
        let url = URL(string: url ?? "")
        imageView.kf.setImage(with: url, options: [.transition(.fade(0.2)),
                                                   .cacheOriginalImage])
    }

}
