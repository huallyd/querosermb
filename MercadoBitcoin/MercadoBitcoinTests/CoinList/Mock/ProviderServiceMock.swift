//
//  ProviderServiceMock.swift
//  MercadoBitcoinTests
//
//  Created by Huallyd Smadi on 17/11/20.
//  Copyright © 2020 Huallyd Smadi. All rights reserved.
//

import Foundation

@testable import MercadoBitcoin

final class ProviderServiceMock<T>: ProviderService {

    private(set) var invokedGetRequest = false
    private(set) var invokedGetRequestParameters: (url: String, Void)?
    private(set) var stubbedGetRequestCompletionResult: (Result<([T]), Error>, Void)?

    func getRequest<U: Decodable>(url: String, completion: @escaping (Result<([U]), Error>) -> Void) {
        invokedGetRequest = true
        invokedGetRequestParameters = (url, ())

        if let result = stubbedGetRequestCompletionResult {
            completion(result.0 as! (Result<([U]), Error>))
        }
    }
    
}
