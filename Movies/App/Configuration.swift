//
//  Configuration.swift
//  Movies
//
//  Created by Vladislav on 28.11.2022.
//

import UIKit

struct Configuration {
    struct Network {
        let apiKey: String
        let host: URL
    }
    
    struct Images {
        let originalHost: URL
        let smallHost: URL
    }

    let network: Network
    let images: Images
}

extension UIApplication {
    static var configuration: Configuration = .init(
        network: .init(apiKey: "815b63b537c380370911f6cb083031b0",
                       host: URL(string: "https://api.themoviedb.org/3")!),
        images: .init(originalHost: URL(string: "https://image.tmdb.org/t/p/original")!,
                      smallHost: URL(string: "https://image.tmdb.org/t/p/w500")!)
    )
}
