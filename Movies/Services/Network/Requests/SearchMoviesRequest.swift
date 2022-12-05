//
//  SearchMoviesRequest.swift
//  Movies
//
//  Created by Vladislav on 02.12.2022.
//

import Foundation

struct SearchMoviesRequest: Parameterable {
    let query: String?

    var parameters: [String : String] {
        var parameters: [String : String] = [:]

        parameters["query"] = query
        
        return parameters
    }
}
