//
//  ProviderService.swift
//  MercadoBitcoin
//
//  Created by Huallyd Smadi on 16/11/20.
//  Copyright © 2020 Huallyd Smadi. All rights reserved.
//

import UIKit
import Alamofire

protocol ProviderService {
    func getRequest<T: Decodable>(url: String, completion: @escaping (Result<([T]), Error>) -> Void)
}

struct AlamofireProviderService: ProviderService {
    
    static let shared = AlamofireProviderService()
    private let jsonDecoder: JSONDecoder = .init()

    private init() {}

    func getRequest<T>(url: String, completion: @escaping (Result<([T]), Error>) -> Void) where T : Decodable {
        guard let url = URL(string: url) else { return }
        
        AF.request(url, method: .get).response { response in
            if let error = response.error {
                switch error {
                case .sessionTaskFailed(let sessionError):
                    if let urlError = sessionError as? URLError,
                        urlError.code == .notConnectedToInternet {
                        completion(.failure(ValidationError.offline))
                        return
                    }
                default: completion(.failure(ValidationError.other))
                }
            } else if let data = response.data {
                do {
                    let decoded = try self.jsonDecoder.decode(Array<T>.self, from: data)
                    completion(.success(decoded))
                } catch {
                    completion(.failure(ValidationError.other))
                }
            }
        }
    }

}
