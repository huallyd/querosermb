//
//  ImageServiceMock.swift
//  MercadoBitcoinTests
//
//  Created by Huallyd Smadi on 17/11/20.
//  Copyright © 2020 Huallyd Smadi. All rights reserved.
//

import UIKit

@testable import MercadoBitcoin

final class ImageServiceMock: ImageService {

    private(set) var invokedRequest = false
    private(set) var invokedRequestParameters: (url: String?, imageView: UIImageView)?

    func request(url: String?, imageView: UIImageView) {
        invokedRequest = true
        invokedRequestParameters = (url, imageView)
    }

}
