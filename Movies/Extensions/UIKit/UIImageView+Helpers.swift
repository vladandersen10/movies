//
//  UIImageView+Helpers.swift
//  Movies
//
//  Created by Vladislav on 29.11.2022.
//

import UIKit
import Kingfisher

extension UIImageView {
    func setImage(_ url: URL?) {
        guard let url = url
        else {
            return
        }

        kf.setImage(with: url,
                    options: [.fromMemoryCacheOrRefresh]) { [weak self] result in
            switch result {
            case .success(let value):
                self?.image = value.image
            case .failure:
                break
            }
        }
    }
}
