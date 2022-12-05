//
//  MovieListPresenter.swift
//  Movies
//
//  Created by Vladislav on 28.11.2022.
//  
//

import Foundation

protocol MovieListPresentationLogic {
    func presentMovieList(response: MovieListPresentationResponse)
    func presentPaginationLoading(_ isAnimating: Bool)
}

final class MovieListPresenter {

    private weak var viewController: MovieListDisplayLogic?
    
    private var genresCache: [Int: String] = [:]
    
    private let imagesService: ImagesServiceable

    init(imagesService: ImagesServiceable, viewController: MovieListDisplayLogic) {
        self.imagesService = imagesService
        self.viewController = viewController
    }
}

// MARK: - MovieListPresentationLogic

extension MovieListPresenter: MovieListPresentationLogic {

    func presentMovieList(response: MovieListPresentationResponse) {
        handleGenres(response.genres)
        let viewModels: [ItemMovieListCellViewModel] = response.movieListResponse.results.enumerated().map { index, movie in
            let genres = movie.genreIds.compactMap { id in
                genresCache[id]
            }.joined(separator: ", ").uppercased()
            let ratingLine = round(movie.voteAverage * 10) / 100
            let ratingText = "\(round(movie.voteAverage * 10) / 10)"
            let imageURL = imagesService.smallImage(movie.posterPath)
            var item = ItemMovieListCellViewModel(movie: movie,
                                                  genres: genres,
                                                  ratingLine: ratingLine,
                                                  ratingText: ratingText,
                                                  imageUrl: imageURL)
            if index == 0 {
                item.isCornered = true
            }
            return item
        }
        
        viewController?.displayMovieList(viewModels)
    }
    
    func presentPaginationLoading(_ isAnimating: Bool) {
        viewController?.displayPaginationLoading(isAnimating)
    }
}

// MARK: - Private Methods

private extension MovieListPresenter {
    func handleGenres(_ items: [Genre]) {
        guard genresCache.isEmpty else {
            return
        }

        items.forEach { item in
            genresCache[item.id] = item.name
        }
    }
}
