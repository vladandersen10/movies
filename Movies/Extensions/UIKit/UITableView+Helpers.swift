//
//  UITableView+Helpers.swift
//  Movies
//
//  Created by Vladislav on 28.11.2022.
//

import UIKit

extension UITableView {

    /// Register a cell from a given nib file class type
    /// Both nib name and reuse identifier will have the same string.
    /// - Parameter cellTypes: The cells that will registered
    func registerCells(_ cellTypes: [UITableViewCell.Type]) {
        cellTypes.forEach({ self.register($0.nib, forCellReuseIdentifier: $0.reuseIdentifier) })
    }

    /// Register a cell from a given class type
    /// - Parameter cellTypes: The cells that will registered
    func registerCellClasses(_ cellTypes: [UITableViewCell.Type]) {
        cellTypes.forEach({ self.register($0.self, forCellReuseIdentifier: $0.reuseIdentifier) })
    }
}
