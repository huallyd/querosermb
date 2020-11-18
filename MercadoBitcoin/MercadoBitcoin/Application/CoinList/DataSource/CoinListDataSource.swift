//
//  CoinListDataSource.swift
//  MercadoBitcoin
//
//  Created by Huallyd Smadi on 16/11/20.
//  Copyright © 2020 Huallyd Smadi. All rights reserved.
//

import UIKit

final class CoinListDataSource: NSObject {
    
    private var viewModels: [CoinViewModel] = [] {
        didSet {
            tableView?.reloadData()
        }
    }

    private weak var tableView: UITableView?
    private let didSelectCompletion: (CoinViewModel) -> Void

    // MARK: Initializer

    init(tableView: UITableView, didSelectCompletion: @escaping (CoinViewModel) -> Void) {
        self.tableView = tableView
        self.didSelectCompletion = didSelectCompletion

        super.init()

        registerCell()
        setupDataSource()
    }

    // MARK: Private functions

    private func registerCell() {
        tableView?.registerReusableCell(CoinTableViewCell.self)
    }

    private func setupDataSource() {
        tableView?.dataSource = self
        tableView?.delegate = self
    }

    // MARK: Functions

    func setup(viewModels: [CoinViewModel]) {
        self.viewModels = viewModels
    }

}

// MARK: UITableViewDataSource conforms

extension CoinListDataSource: UITableViewDataSource {

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = viewModels[indexPath.row]

        let cell: CoinTableViewCell = tableView.dequeueReusableCell(indexPath: indexPath)
        cell.bind(viewModel)

        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModels.count
    }

}

// MARK: UITableViewDelegate conforms

extension CoinListDataSource: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        90
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didSelectCompletion(viewModels[indexPath.row])
    }

}
