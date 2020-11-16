//
//  BaseViewController.swift
//  MercadoBitcoin
//
//  Created by Huallyd Smadi on 16/11/20.
//  Copyright © 2020 Huallyd Smadi. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    // MARK: Initializer

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Functions

    func showTabBar() {
        tabBarController?.tabBar.isHidden = false
    }

    func hideTabBar() {
        tabBarController?.tabBar.isHidden = true
    }

}
