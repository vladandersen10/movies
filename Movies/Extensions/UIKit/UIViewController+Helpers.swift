//
//  UIViewController+Helpers.swift
//  Movies
//
//  Created by Vladislav on 01.12.2022.
//

import UIKit

extension UIViewController {
    func setupNavigationBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = .Theme.background4
        appearance.titleTextAttributes = [.foregroundColor: UIColor.Theme.title]

        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance

        navigationController?.setNeedsStatusBarAppearanceUpdate()
        navigationController?.navigationBar.isHidden = false
    }
}
