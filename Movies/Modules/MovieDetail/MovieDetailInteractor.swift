//
//  MovieDetailInteractor.swift
//  Movies
//
//  Created by Vladislav on 30.11.2022.
//

import Foundation

protocol MovieDetailBusinessLogic {
    func viewLoaded()
}

final class MovieDetailInteractor {

    private let presenter: MovieDetailPresentationLogic
    
    private let queue = DispatchQueue(label: "prepare.movie.detail")
    
    private var cast: [Cast] = []
    private var movieDetail: MovieDetail?

    private let movieId: Int
    private let moviesService: MoviesServiceable
    
    init(movieId: Int, moviesService: MoviesServiceable, presenter: MovieDetailPresentationLogic) {
        self.movieId = movieId
        self.moviesService = moviesService
        self.presenter = presenter
    }
}

// MARK: - MovieDetailBusinessLogic

extension MovieDetailInteractor: MovieDetailBusinessLogic {

    func viewLoaded() {
        let group = DispatchGroup()
        let movieId = movieId
        
        queue.async { [weak self] in
            
            group.enter()
            self?.moviesService.fetchMovieCredits(movieId: movieId) { result in
                switch result {
                case .success(let response):
                    self?.cast = response.cast
                case .failure:
                    break
                }
                group.leave()
            }
            
            group.enter()
            self?.moviesService.fetchMovieDetail(movieId: movieId){ result in
                switch result {
                case .success(let response):
                    self?.movieDetail = response
                case .failure:
                    break
                }
                group.leave()
            }
            
            group.notify(queue: .main) {
                self?.presentMovieDetail()
            }
        }
    }
}

// MARK: - Private Methods

private extension MovieDetailInteractor {
    func presentMovieDetail() {
        guard let movieDetail = movieDetail else {
            return
        }
        
        let response = MovieDetailPresentationResponse(movieDetail: movieDetail, cast: cast)
        presenter.presentMovieDetail(response: response)
    }
}
