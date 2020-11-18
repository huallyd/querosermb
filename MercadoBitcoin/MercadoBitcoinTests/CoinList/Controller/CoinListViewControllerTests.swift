//
//  CoinListViewControllerTests.swift
//  MercadoBitcoinTests
//
//  Created by Huallyd Smadi on 17/11/20.
//  Copyright © 2020 Huallyd Smadi. All rights reserved.
//

import XCTest
import FBSnapshotTestCase

@testable import MercadoBitcoin

final class CoinListViewControllerTests: FBSnapshotTestCase {
    
    private lazy var sut: CoinListViewController = {
        .init(coordinator: nil, gateway: gateway, imageService: imageService)
    }()

    private let gateway = CoinGatewayMock()
    private let imageService = ImageServiceMock()
    
    override func setUp() {
        super.setUp()

        gateway.stubbedRequestCoinsCompletionResult = (.success(CoinMock.coins), ())
        recordMode = false
    }

    func test_coinListViewController_view() {
        FBSnapshotVerifyView(sut.view)
    }

    
}
