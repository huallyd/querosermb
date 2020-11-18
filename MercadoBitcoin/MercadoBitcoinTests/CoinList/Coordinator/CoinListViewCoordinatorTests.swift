//
//  CoinListViewCoordinatorTests.swift
//  MercadoBitcoinTests
//
//  Created by Huallyd Smadi on 17/11/20.
//  Copyright © 2020 Huallyd Smadi. All rights reserved.
//

import XCTest

@testable import MercadoBitcoin

final class CoinListViewCoordinatorTests: XCTestCase {
    
    private lazy var sut: CoinListViewCoordinator = .init(navigationController: rootNavigationController)
    private let rootNavigationController: UINavigationController = .init()
    
    override func setUp() {
        super.setUp()
        
        sut.start()
    }
    
    func test_start_showCoinListViewController() {
        let currentViewController = rootNavigationController.topViewController!
        XCTAssertTrue(currentViewController.isKind(of: CoinListViewController.self))
    }
    
    func test_showDetail_showCoinDetailViewController() {
        sut.showDetail(viewModel: .init(entity: CoinMock.coin), animated: false)
        let currentViewController = rootNavigationController.topViewController!
        XCTAssertTrue(currentViewController.isKind(of: CoinDetailViewController.self))
    }
    
    func test_back_showCoinListViewController() {
        sut.showDetail(viewModel: .init(entity: CoinMock.coin), animated: false)
        sut.back(animated: false)

        let currentViewController = rootNavigationController.topViewController!
        XCTAssertTrue(currentViewController.isKind(of: CoinListViewController.self))
    }
    
}
