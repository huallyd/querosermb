//
//  DetailView.swift
//  MercadoBitcoin
//
//  Created by Huallyd Smadi on 17/11/20.
//  Copyright © 2020 Huallyd Smadi. All rights reserved.
//

import UIKit

final class DetailView: UIView {

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .white
        label.text = viewModel.title
        
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 18)
        label.textColor = .gray
        label.numberOfLines = 0
        label.text = viewModel.description

        return label
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, descriptionLabel])
        stackView.axis = .vertical
        stackView.spacing = 4

        return stackView
    }()
    
    private let viewModel: DetailViewModel
    
    // MARK: Initializer
    
    init(viewModel: DetailViewModel) {
        self.viewModel = viewModel
        
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
    }
 
    private func setupLayout() {
        addSubview(fillWith: stackView)
    }

}
