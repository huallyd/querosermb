//
//  CoinListViewController.swift
//  MercadoBitcoin
//
//  Created by Huallyd Smadi on 16/11/20.
//  Copyright © 2020 Huallyd Smadi. All rights reserved.
//

import UIKit

final class CoinListViewController: BaseViewController {
    
    private weak var coordinator: CoinListCoordinator?
    
    // MARK: Initializer
    
    init(coordinator: CoinListCoordinator?) {
        self.coordinator = coordinator
        
        super.init()
    }
    
    // MARK: Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupLayout()
    }
    
    // MARK: Private functions
    
    private func setupView() {
        view.backgroundColor = .white
    }
    
    private func setupLayout() {
        
    }

}
