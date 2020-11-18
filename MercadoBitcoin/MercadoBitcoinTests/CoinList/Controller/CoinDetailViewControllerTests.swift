//
//  CoinDetailViewControllerTests.swift
//  MercadoBitcoinTests
//
//  Created by Huallyd Smadi on 17/11/20.
//  Copyright © 2020 Huallyd Smadi. All rights reserved.
//

import XCTest
import FBSnapshotTestCase

@testable import MercadoBitcoin

final class CoinDetailViewControllerTests: FBSnapshotTestCase {
    
    private lazy var sut: CoinDetailViewController = {
        .init(coordinator: nil, viewModel: CoinMock.coinDetailViewModel)
    }()
    
    override func setUp() {
        super.setUp()

        recordMode = false
    }

    func test_coinListViewController_view() {
        FBSnapshotVerifyView(sut.view)
    }
    
}
