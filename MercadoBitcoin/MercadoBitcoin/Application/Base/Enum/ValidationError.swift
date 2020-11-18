//
//  ValidationError.swift
//  MercadoBitcoin
//
//  Created by Huallyd Smadi on 17/11/20.
//  Copyright © 2020 Huallyd Smadi. All rights reserved.
//

import Foundation

enum ValidationError: Error {
    case offline
    case other
}

extension ValidationError: LocalizedError {
    var errorDescription: String? {
        let errors = Strings.Alert.Error.self
        switch self {
        case .offline: return errors.networkDescription.localized
        case .other: return errors.othersDescription.localized
        }
    }
}
