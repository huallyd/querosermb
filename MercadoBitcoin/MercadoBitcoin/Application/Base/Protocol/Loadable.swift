//
//  Loadable.swift
//  MercadoBitcoin
//
//  Created by Huallyd Smadi on 17/11/20.
//  Copyright © 2020 Huallyd Smadi. All rights reserved.
//

import UIKit

protocol Loadable: AnyObject {
    func load()
    func unload()
}

extension Loadable where Self: BaseViewController {

    func load() {
        let lockView = UIView(frame: view.bounds)
        lockView.backgroundColor = UIColor(white: 0.0, alpha: 0.75)
        lockView.alpha = 0.0
        lockView.tag = 999

        let activityIndicator = UIActivityIndicatorView(style: .whiteLarge)
        activityIndicator.color = .orange
        activityIndicator.hidesWhenStopped = true
        activityIndicator.center = lockView.center
        activityIndicator.startAnimating()
        
        view.addSubview(lockView)

        lockView.addSubview(activityIndicator, constraints: [
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])

        UIView.animate(withDuration: 0.2) {
            lockView.alpha = 1.0
        }
    }

    func unload() {
        if let lockView = view.viewWithTag(999) {
            UIView.animate(withDuration: 0.2, animations: {
                lockView.alpha = 0.0
            }) { _ in
                lockView.removeFromSuperview()
            }
        }
    }

}
