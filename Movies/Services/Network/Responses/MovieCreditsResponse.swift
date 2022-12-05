//
//  MovieCreditsResponse.swift
//  Movies
//
//  Created by Vladislav on 30.11.2022.
//

import Foundation

struct MovieCreditsResponse: Decodable {
    let cast: [Cast]
}
