//
//  UIColor+Theme.swift
//  Movies
//
//  Created by Vladislav on 01.12.2022.
//

import UIKit

extension UIColor {
    enum Theme {
        static var action = UIColor(named: "AccentColor")!
        static var title = R.color.title()!
        static var text = R.color.text()!
        static var separator = R.color.separator()!

        static var background1 = R.color.background1()!
        static var background2 = R.color.background2()!
        static var background3 = R.color.background3()!
        static var background4 = R.color.background4()!
    }
}
