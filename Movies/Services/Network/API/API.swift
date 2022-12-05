//
//  API.swift
//  Movies
//
//  Created by Vladislav on 28.11.2022.
//

import Foundation

enum API {
    case movieList(request: Parameterable)
    case movieDetails(movieId: Int)
    case movieCredits(movieId: Int)
    case genreList
    case searchMovie(request: Parameterable)
}
