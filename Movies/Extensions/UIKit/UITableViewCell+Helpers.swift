//
//  UITableViewCell+Helpers.swift
//  Movies
//
//  Created by Vladislav on 28.11.2022.
//

import UIKit

extension UITableViewCell {

    static var reuseIdentifier: String { return String(describing: self) }

    static var nibName: String { return Self.reuseIdentifier }

    static var nib: UINib { return UINib(nibName: nibName, bundle: nil) }

}
