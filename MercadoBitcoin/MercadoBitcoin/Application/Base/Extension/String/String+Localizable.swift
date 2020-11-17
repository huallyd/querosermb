//
//  String+Localizable.swift
//  MercadoBitcoin
//
//  Created by Huallyd Smadi on 17/11/20.
//  Copyright © 2020 Huallyd Smadi. All rights reserved.
//

import UIKit

extension String {

  var localized: String {
    NSLocalizedString(self, comment: "")
  }

}
