//
//  ApplicationCoordinator.swift
//  MercadoBitcoin
//
//  Created by Huallyd Smadi on 16/11/20.
//  Copyright © 2020 Huallyd Smadi. All rights reserved.
//

import UIKit

final class ApplicationCoordinator {
    
    private lazy var listCoordinator: Coordinator = CoinListViewCoordinator(navigationController: rootNavigationController)

    private weak var window: UIWindow?
    private let rootNavigationController: UINavigationController
    
    // MARK: Initializer

    init(window: UIWindow?) {
        self.window = window
        rootNavigationController = .init()
    }

}

// MARK: ApplicationCoordinator conforms

extension ApplicationCoordinator: Coordinator {
    
    func start() {
        window?.rootViewController = rootNavigationController
        window?.makeKeyAndVisible()

        listCoordinator.start()
    }

}
