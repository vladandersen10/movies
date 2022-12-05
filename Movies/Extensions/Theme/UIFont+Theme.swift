//
//  UIFont+Theme.swift
//  Movies
//
//  Created by Vladislav on 01.12.2022.
//

import UIKit

extension UIFont {
    enum Theme {
        enum Headline {
            static var h0: UIFont {
                .systemFont(ofSize: 22, weight: .bold)
            }

            static var h1: UIFont {
                .systemFont(ofSize: 18, weight: .bold)
            }

            static var h2: UIFont {
                .systemFont(ofSize: 16, weight: .regular)
            }
            
            static var h3: UIFont {
                .systemFont(ofSize: 14, weight: .regular)
            }

            static var h4: UIFont {
                .systemFont(ofSize: 12, weight: .regular)
            }
        }
    }
}
