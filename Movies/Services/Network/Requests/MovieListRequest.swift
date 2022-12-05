//
//  MovieListRequest.swift
//  Movies
//
//  Created by Vladislav on 29.11.2022.
//

import Foundation

struct MovieListRequest: Parameterable {
    var page: Int = 1

    var parameters: [String : String] {
        var parameters: [String : String] = [:]

        parameters["page"] = "\(page)"
        
        return parameters
    }
}
