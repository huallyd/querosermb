//
//  UITableView+DeselectRow.swift
//  MercadoBitcoin
//
//  Created by Huallyd Smadi on 17/11/20.
//  Copyright © 2020 Huallyd Smadi. All rights reserved.
//

import UIKit

extension UITableView {
    
    func deselectRow() {
        if let indexPath = indexPathForSelectedRow {
            deselectRow(at: indexPath, animated: true)
        }
    }

}
