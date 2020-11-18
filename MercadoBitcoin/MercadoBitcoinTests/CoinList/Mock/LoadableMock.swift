//
//  LoadableMock.swift
//  MercadoBitcoinTests
//
//  Created by Huallyd Smadi on 17/11/20.
//  Copyright © 2020 Huallyd Smadi. All rights reserved.
//

@testable import MercadoBitcoin

final class LoadableMock: Loadable {

    private(set) var invokedLoad = false
    private(set) var invokedUnload = false

    func load() {
        invokedLoad = true
    }

    func unload() {
        invokedUnload = true
    }

}
