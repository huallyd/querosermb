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
    func request<T: Decodable>(url: String, method: HTTPMethod, completion: @escaping ([T]?) -> Void)
}

struct AlamofireProviderService: ProviderService {
    
    static let shared = AlamofireProviderService()
    private let jsonDecoder: JSONDecoder = .init()

    private init() {}

    func request<T>(url: String, method: HTTPMethod, completion: @escaping ([T]?) -> Void) where T : Decodable {
        guard let url = URL(string: url) else { return }
        
        AF.request(url, method: .get).response { response in
            if let error = response.error {
                print("error: \(error)")
            } else if let data = response.data {
                do {
                    let decoded = try self.jsonDecoder.decode(Array<T>.self, from: data)
                    completion(decoded)
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }

}
