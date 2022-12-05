//
//  Movie.swift
//  Movies
//
//  Created by Vladislav on 29.11.2022.
//

import Foundation

struct Movie: Decodable {
    let id: Int
    let title: String
    let voteAverage: Double
    let genreIds: [Int]
    let posterPath: String?
}
