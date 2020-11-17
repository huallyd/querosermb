//
//  CoinDetailViewController.swift
//  MercadoBitcoin
//
//  Created by Huallyd Smadi on 17/11/20.
//  Copyright © 2020 Huallyd Smadi. All rights reserved.
//

import UIKit

final class CoinDetailViewController: BaseViewController {

    private lazy var iconCoinImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit

        return imageView
    }()

    private lazy var detailViews: DetailViews = .init(viewModels: viewModel.detailViewModels)

    private weak var coordinator: CoinListCoordinator?
    private let viewModel: CoinDetailViewModel

    // MARK: Initializer
    
    init(coordinator: CoinListCoordinator?, viewModel: CoinDetailViewModel) {
        self.coordinator = coordinator
        self.viewModel = viewModel

        super.init()
    }

    // MARK: Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupLayout()
        requestImage()
    }

    // MARK: Private functions
    
    private func setupView() {
        view.backgroundColor = .white
    }
    
    private func setupLayout() {
        view.addSubview(iconCoinImageView, constraints: [
            iconCoinImageView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 2.su),
            iconCoinImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            iconCoinImageView.heightAnchor.constraint(equalToConstant: 50),
            iconCoinImageView.widthAnchor.constraint(equalToConstant: 50)
        ])
        
        view.addSubview(detailViews, constraints: [
            detailViews.topAnchor.constraint(equalTo: iconCoinImageView.bottomAnchor, constant: 1.su),
            detailViews.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 1.su),
            detailViews.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -1.su)
        ])
    }
    
    private func requestImage() {
        viewModel.requestImage(of: iconCoinImageView)
    }

}
