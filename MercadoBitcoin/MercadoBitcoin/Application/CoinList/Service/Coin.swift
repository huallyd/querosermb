//
//  Coin.swift
//  MercadoBitcoin
//
//  Created by Huallyd Smadi on 16/11/20.
//  Copyright © 2020 Huallyd Smadi. All rights reserved.
//

import Foundation

struct Coin: Decodable {
    let id: String
    let site: String
    let name: String
    let startDate: String?
    let endDate: String?
    let valueHour: Double
    let valueDay: Double
    let valueMonth: Double

    enum CodingKeys: String, CodingKey {
        case id = "exchange_id"
        case site = "website"
        case name
        case startDate = "data_start"
        case endDate = "data_end"
        case valueHour = "volume_1hrs_usd"
        case valueDay = "volume_1day_usd"
        case valueMonth = "volume_1mth_usd"
    }
}
