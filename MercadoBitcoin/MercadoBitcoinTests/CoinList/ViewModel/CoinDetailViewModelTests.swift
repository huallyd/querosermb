//
//  CoinDetailViewModelTests.swift
//  MercadoBitcoinTests
//
//  Created by Huallyd Smadi on 17/11/20.
//  Copyright © 2020 Huallyd Smadi. All rights reserved.
//

import XCTest

@testable import MercadoBitcoin

final class CoinDetailViewModelTests: XCTestCase {
    
    private lazy var sut: CoinDetailViewModel = {
        .init(coinViewModel: CoinMock.coinViewModel, imageService: imageService)
    }()

    private let imageService = ImageServiceMock()

    func test_detailViewModels_whenItsCreated_itsFormatted() {
        XCTAssertEqual(sut.detailViewModels.count, 7)
        
        let titles = Strings.CoinDetail.Title.self
        
        XCTAssertEqual(sut.detailViewModels.first!.title, titles.id.localized)
        XCTAssertEqual(sut.detailViewModels[1].title, titles.name.localized)
        XCTAssertEqual(sut.detailViewModels[2].title, titles.startDate.localized)
        XCTAssertEqual(sut.detailViewModels[3].title, titles.endDate.localized)
        XCTAssertEqual(sut.detailViewModels[4].title, titles.volumeHour.localized)
        XCTAssertEqual(sut.detailViewModels[5].title, titles.volumeDay.localized)
        XCTAssertEqual(sut.detailViewModels[6].title, titles.volumeMonth.localized)
        
        XCTAssertEqual(sut.detailViewModels.first!.description, "BITCOIN-ID")
        XCTAssertEqual(sut.detailViewModels[1].description, "Bitcoin")
        XCTAssertEqual(sut.detailViewModels[2].description, "10/09/2011")
        XCTAssertEqual(sut.detailViewModels[3].description, "11/10/2020")
        XCTAssertEqual(sut.detailViewModels[4].description, "$232.12")
        XCTAssertEqual(sut.detailViewModels[5].description, "$234.34")
        XCTAssertEqual(sut.detailViewModels[6].description, "$29.23")
    }

    func test_requestImage_callImageServiceMethod() {
        sut.requestImage(of: .init())
        
        XCTAssertTrue(imageService.invokedRequest)
        XCTAssertEqual(imageService.invokedRequestParameters!.url, "www.google.com")
    }

}
