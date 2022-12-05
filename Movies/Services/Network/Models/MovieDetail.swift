//
//  MovieDetails.swift
//  Movies
//
//  Created by Vladislav on 30.11.2022.
//

import Foundation

struct MovieDetail: Decodable {
    let title: String
    let overview: String?
    let voteAverage: Double
    let posterPath: String?
}
