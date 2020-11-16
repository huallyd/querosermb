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

        // Do any additional setup after loading the view.
    }
    
    // MARK: Private functions
    
    private func setupView() {
        view.backgroundColor = .white
    }
    
    private func setupLayout() {
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
