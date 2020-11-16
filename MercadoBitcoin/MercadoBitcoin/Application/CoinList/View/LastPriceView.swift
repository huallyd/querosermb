//
//  LastPriceView.swift
//  MercadoBitcoin
//
//  Created by Huallyd Smadi on 16/11/20.
//  Copyright © 2020 Huallyd Smadi. All rights reserved.
//

import UIKit

final class LastPriceView: UIView {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.text = "ÚLTIMO PREÇO"
        label.textAlignment = .right
        
        return label
    }()
    
    private let valueLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "R$ 11.136,00"
        label.textAlignment = .right
        
        return label
    }()
    
    private let percentVariationLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.text = "0,23%"
        label.textAlignment = .right

        return label
    }()
    
    private let iconVariationImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit

        return imageView
    }()
    
    private let hourVariationLabel: UILabel = {
        let label = UILabel()
        label.text = "24H"
        label.textColor = .lightGray

        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, valueLabel, variationStackView])
        stackView.spacing = 1.su
        stackView.axis = .vertical
        stackView.setCustomSpacing(2.su, after: valueLabel)

        return stackView
    }()

    private lazy var variationStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [percentVariationLabel,
                                                       iconVariationImageView,
                                                       hourVariationLabel])
        stackView.spacing = 0.5.su

        return stackView
    }()

    // MARK: Initializer

    init() {
        super.init(frame: .zero)
        
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
        addSubview(fillWith: stackView)
    }
    
    // MARK: Function
    
    func bind(_ value: String, _ percent: String) {
        valueLabel.text = value
        percentVariationLabel.text = percent
    }

}
