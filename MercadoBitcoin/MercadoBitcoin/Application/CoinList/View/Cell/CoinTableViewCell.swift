//
//  CoinTableViewCell.swift
//  MercadoBitcoin
//
//  Created by Huallyd Smadi on 16/11/20.
//  Copyright © 2020 Huallyd Smadi. All rights reserved.
//

import UIKit

final class CoinTableViewCell: UITableViewCell, Reusable {
    
    private let iconCoinImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        
        return label
    }()
    
    private lazy var valueLabel: UILabel = {
        let label = UILabel()
        label.textColor = .blue
        
        return label
    }()

    private let showDetailLabel: UILabel = {
        let label = UILabel()
        label.textColor = .blue
        
        return label
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, valueLabel, showDetailLabel])
        stackView.axis = .vertical
        stackView.spacing = 1.su

        return stackView
    }()
    
//    private let lastPriceView: LastPriceView = .init()

    // MARK: Initializer

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Private functions

    private func setupView() {
        backgroundColor = .white
    }

    private func setupLayout() {
        addSubview(iconCoinImageView, constraints: [
            iconCoinImageView.topAnchor.constraint(equalTo: topAnchor, constant: 2.su),
            iconCoinImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 2.su),
            iconCoinImageView.heightAnchor.constraint(equalToConstant: 30),
            iconCoinImageView.widthAnchor.constraint(equalToConstant: 30)
        ])
        
        addSubview(stackView, constraints: [
            stackView.topAnchor.constraint(equalTo: iconCoinImageView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: iconCoinImageView.trailingAnchor, constant: 1.su),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    // MARK: Function
    
    func bind(_ viewModel: CoinViewModel) {
        titleLabel.text = viewModel.title
        valueLabel.text = viewModel.currencyValue

        viewModel.requestImage(of: iconCoinImageView)
    }

}
