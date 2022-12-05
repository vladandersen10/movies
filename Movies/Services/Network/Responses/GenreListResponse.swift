//
//  GenresResponse.swift
//  Movies
//
//  Created by Vladislav on 29.11.2022.
//

import Foundation

struct GenreListResponse: Decodable {
    let genres: [Genre]
}
