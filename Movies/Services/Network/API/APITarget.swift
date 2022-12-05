//
//  APITarget.swift
//  Movies
//
//  Created by Vladislav on 02.12.2022.
//

import Moya
import Alamofire

protocol Parameterable {
    var parameters: [String: String] { get }
}

struct APITarget {
    let api: API
    
    private let host: URL
    private let apiKey: String

    init(api: API,
         host: URL = UIApplication.configuration.network.host,
         apiKey: String = UIApplication.configuration.network.apiKey) {
        self.api = api
        self.host = host
        self.apiKey = apiKey
    }
}

extension APITarget: TargetType {
    
    var headers: [String: String]? {
        var headers: [String: String] = [:]
        headers["Accept"] = "*/*"
        headers["Accept-Encoding"] = "gzip, deflate, br"

        return headers
    }
    
    var baseURL: URL {
        host
    }
    
    var path: String {
        switch api {
        case .movieList:
            return "/movie/popular"
        case .movieDetails(let id):
            return "/movie/\(id)"
        case .movieCredits(let id):
            return "/movie/\(id)/credits"
        case .genreList:
            return "/genre/movie/list"
        case .searchMovie:
            return "/search/movie"
        }
    }
    
    var method: Moya.Method {
        switch self {
        default:
            return .get
        }
    }
    
    var methodDesc: String {
        switch method {
        case .post:
            return "POST"
        case .put:
            return "PUT"
        case .delete:
            return "DELETE"
        default:
            return "GET"
        }
    }
    
    var parameters: [String: Any] {
        var parameters: [String: Any] = [:]
        
        switch api {
        case    .movieList(let request),
                .searchMovie(let request):
            parameters = request.parameters
        default:
            break
        }
        
        parameters["api_key"] = apiKey
        parameters["language"] = "en-US"
        
        return parameters
    }
    
    var task: Task {
        switch api {
        case    .movieList,
                .movieDetails,
                .movieCredits,
                .genreList,
                .searchMovie:
            return .requestParameters(parameters: parameters, encoding: URLEncoding())
        }
    }
}
