//
//  UIView+Constraints.swift
//  MercadoBitcoin
//
//  Created by Huallyd Smadi on 16/11/20.
//  Copyright © 2020 Huallyd Smadi. All rights reserved.
//

import UIKit

extension UIView {

    func addSubview<T: UIView>(_ view: T, constraints: [NSLayoutConstraint]) {
        addSubview(view)

        view.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate(constraints)
    }

}

