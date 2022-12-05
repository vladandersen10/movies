//
//  PaginationActivityIndicator.swift
//  Movies
//
//  Created by Vladislav on 02.12.2022.
//

import UIKit

extension UIActivityIndicatorView {
    static func paginationActivityIndicator(view: UIView, scrollView: UIScrollView) -> UIActivityIndicatorView {
        let indicator = UIActivityIndicatorView()
        indicator.hidesWhenStopped = true
        indicator.style = .medium
        view.addSubview(indicator)
        indicator.bringSubviewToFront(scrollView)

        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.bottomAnchor.constraint(equalTo: view.bottomAnchor,
                                          constant: -50).isActive = true
        indicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        return indicator
    }
}
