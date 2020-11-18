//
//  CoinListViewModelTests.swift
//  MercadoBitcoinTests
//
//  Created by Huallyd Smadi on 17/11/20.
//  Copyright © 2020 Huallyd Smadi. All rights reserved.
//

import XCTest

@testable import MercadoBitcoin

final class CoinListViewModelTests: XCTestCase {
    
    private lazy var sut: CoinListViewModel = {
        .init(gateway: gateway, imageService: imageService, loadable: loadable)
    }()

    private let gateway = CoinGatewayMock()
    private let imageService = ImageServiceMock()
    private let loadable = LoadableMock()

    private func setupSuccessResponse() {
        gateway.stubbedRequestCoinsCompletionResult = (.success(CoinMock.coins), ())
        gateway.stubbedRequestUrlsCompletionResult = (.success(CoinIconURLMock.coinIcons), ())
    }
    
    private func setupErrorResponse(validationError: ValidationError) {
        gateway.stubbedRequestCoinsCompletionResult = (.failure(validationError), ())
        gateway.stubbedRequestUrlsCompletionResult = (.failure(validationError), ())
    }
    
    func test_request_whenIsSuccess_receiveCoinViewModelsFormatted() {
        setupSuccessResponse()
    
        sut.request { viewModels in
            XCTAssertEqual(viewModels.count, 3)
            XCTAssertEqual(viewModels.first!.title, "Bitcoin (BITCOIN-ID)")
            XCTAssertEqual(viewModels.first!.valueHour, "$232.12")
            XCTAssertEqual(viewModels.first!.valueDay, "$234.34")
            XCTAssertEqual(viewModels.first!.valueMonth, "$29.23")
        }
    }
    
    func test_request_whenIsNetworkFailure_receiveDescription() {
        setupErrorResponse(validationError: .offline)
    
        sut.request { _ in }
        
        let errors = Strings.Alert.Error.self
        
        XCTAssertTrue(loadable.invokedShowError)
        XCTAssertEqual(loadable.invokedShowErrorParameters?.0, errors.networkDescription)
    }
    
    func test_request_whenIsOthersFailure_receiveDescription() {
        setupErrorResponse(validationError: .other)
    
        sut.request { _ in }
        
        let errors = Strings.Alert.Error.self
        
        XCTAssertTrue(loadable.invokedShowError)
        XCTAssertEqual(loadable.invokedShowErrorParameters?.0, errors.othersDescription)
    }
    
    func test_request_callLoadableMethods() {
        setupSuccessResponse()
    
        sut.request { _ in
            XCTAssertTrue(self.loadable.invokedLoad)
            XCTAssertTrue(self.loadable.invokedUnload)
        }
    }

}
