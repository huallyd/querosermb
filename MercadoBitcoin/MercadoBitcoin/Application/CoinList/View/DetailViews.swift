//
//  DetailViews.swift
//  MercadoBitcoin
//
//  Created by Huallyd Smadi on 17/11/20.
//  Copyright © 2020 Huallyd Smadi. All rights reserved.
//

import UIKit

final class DetailViews: UIView {
    
    private lazy var detailViews: [DetailView] = viewModels.map(DetailView.init)

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: detailViews)
        stackView.axis = .vertical
        stackView.spacing = 1.5.su

        return stackView
    }()

    private let viewModels: [DetailViewModel]

    // MARK: Initializer

    init(viewModels: [DetailViewModel]) {
        self.viewModels = viewModels
        
        super.init(frame: .zero)
        
        setupView()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Private functions
    
    private func setupView() {
        backgroundColor = .clear
        layer.cornerRadius = 8
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 1
    }
    
    private func setupLayout() {
        addSubview(stackView, constraints: [
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 2.su),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 2.su),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -2.su),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -2.su)
        ])
    }

}
