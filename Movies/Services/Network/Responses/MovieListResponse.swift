//
//  MovieListResponse.swift
//  Movies
//
//  Created by Vladislav on 29.11.2022.
//

import Foundation

struct MovieListResponse: Decodable {
    var results: [Movie]
    let page: Int
    let totalPages: Int
}
