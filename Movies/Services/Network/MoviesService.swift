//
//  MoviesService.swift
//  Movies
//
//  Created by Vladislav on 28.11.2022.
//

import Foundation

protocol MoviesServiceable {
    func fetchMovieList(request: MovieListRequest, completion: @escaping (Result<MovieListResponse, Error>) -> Void)
    func fetchGenreList(completion: @escaping (Result<GenreListResponse, Error>) -> Void)
    func fetchMovieDetail(movieId: Int, completion: @escaping (Result<MovieDetail, Error>) -> Void)
    func fetchMovieCredits(movieId: Int, completion: @escaping (Result<MovieCreditsResponse, Error>) -> Void)
    func searchMovies(request: SearchMoviesRequest, completion: @escaping (Result<MovieListResponse, Error>) -> Void)
}

final class MoviesService {
    
    private let service: Networkable
    
    init(service: Networkable) {
        self.service = service
    }
}

// MARK: - MoviesServiceable

extension MoviesService: MoviesServiceable {

    func fetchMovieList(request: MovieListRequest, completion: @escaping (Result<MovieListResponse, Error>) -> Void) {
        service.request(api: .movieList(request: request), completion: completion)
    }

    func fetchGenreList(completion: @escaping (Result<GenreListResponse, Error>) -> Void) {
        service.request(api: .genreList, completion: completion)
    }

    func fetchMovieDetail(movieId: Int, completion: @escaping (Result<MovieDetail, Error>) -> Void) {
        service.request(api: .movieDetails(movieId: movieId), completion: completion)
    }
    
    func fetchMovieCredits(movieId: Int, completion: @escaping (Result<MovieCreditsResponse, Error>) -> Void) {
        service.request(api: .movieCredits(movieId: movieId), completion: completion)
    }

    func searchMovies(request: SearchMoviesRequest, completion: @escaping (Result<MovieListResponse, Error>) -> Void) {
        service.request(api: .searchMovie(request: request), completion: completion)
    }
}
