//
//  NetworkService.swift
//  Movies
//
//  Created by Vladislav on 28.11.2022.
//

import Moya

protocol Networkable {
    func request<T: Decodable>(api: API, completion: @escaping (Result<T, Error>) -> ())
}

final class NetworkService: Networkable {
    
    var provider = MoyaProvider<APITarget>(plugins: [NetworkLoggerPlugin()])
    
    func request<T: Decodable>(api: API, completion: @escaping (Result<T, Error>) -> ()) {
        
        let apiTarget = APITarget(api: api)
        
        provider.request(apiTarget) { result in
            switch result {
            case let .success(response):
                switch response.statusCode {
                case 200...210:
                    do {
                        let result: T = try response.data.decode()
                        completion(.success(result))
                    } catch {
                        completion(.failure(error))
                    }
                default:
                    completion(.failure(AppError.unknown))
                }
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}
