//
//  MovieListInteractor.swift
//  Movies
//
//  Created by Vladislav on 28.11.2022.
//

import Foundation

protocol MovieListBusinessLogic {
    func viewLoaded()
    func searchTextChanged(_ query: String)
    func searchCancelled()
    func lastCellDisplayed()
}

final class MovieListInteractor {

    private let presenter: MovieListPresentationLogic

    private let queue = DispatchQueue(label: "prepare.movie.list")
    private var searchTimer: Timer?
    
    private var isLoadingPage: Bool = false

    private var movieListResponse: MovieListResponse?
    private var genres: [Genre] = []
    
    private let moviesService: MoviesServiceable
    
    init(moviesService: MoviesServiceable, presenter: MovieListPresentationLogic) {
        self.moviesService = moviesService
        self.presenter = presenter
    }
}

// MARK: - MovieListBusinessLogic

extension MovieListInteractor: MovieListBusinessLogic {

    func viewLoaded() {
        let group = DispatchGroup()
        
        queue.async { [weak self] in
            group.enter()
            self?.moviesService.fetchGenreList { result in
                switch result {
                case .success(let response):
                    self?.genres = response.genres
                case .failure:
                    break
                }
                group.leave()
            }

            group.enter()
            self?.moviesService.fetchMovieList(request: MovieListRequest()) { result in
                switch result {
                case .success(let response):
                    self?.movieListResponse = response
                case .failure:
                    break
                }
                group.leave()
            }
            
            group.notify(queue: .main) { 
                self?.presentMovieList()
            }
        }
    }

    func searchTextChanged(_ query: String) {
        searchTimer?.invalidate()
        guard !query.isEmpty else {
            presentMovieList()
            return
        }
        
        searchTimer =  Timer.scheduledTimer(withTimeInterval: 0.4, repeats: false, block: { [weak self] _ in
            self?.searchQuery(query)
        })
    }
    
    func searchCancelled() {
        presentMovieList()
    }
    
    func lastCellDisplayed() {
        guard
            !isLoadingPage,
            let page = movieListResponse?.page,
            let total = movieListResponse?.results.count,
            total < 100
        else {
            return
        }

        isLoadingPage = true
        presenter.presentPaginationLoading(true)
        fetchNextPage(page + 1)
    }
}

// MARK: - Private Methods

private extension MovieListInteractor {
    func presentMovieList() {
        guard let movieListResponse = movieListResponse else {
            return
        }
        
        presenter.presentMovieList(response: MovieListPresentationResponse(genres: genres, movieListResponse: movieListResponse))
    }
    
    func fetchNextPage(_ page: Int) {
        let request = MovieListRequest(page: page)
        moviesService.fetchMovieList(request: request) { [weak self] result in
            switch result {
            case .success(let response):
                self?.handleNextResponse(response)
            case .failure:
                break
            }
        }
    }
    
    func searchQuery(_ query: String) {
        let request = SearchMoviesRequest(query: query)
        moviesService.searchMovies(request: request) { [weak self] result in
            switch result {
            case .success(let response):
                self?.handleSearchResponse(response)
            case .failure:
                break
            }
        }
    }
    
    func handleSearchResponse(_ response: MovieListResponse) {
        presenter.presentMovieList(response: MovieListPresentationResponse(genres: genres, movieListResponse: response))
    }
    
    func handleNextResponse(_ response: MovieListResponse) {
        let oldResults = movieListResponse?.results ?? []
        movieListResponse = response
        movieListResponse?.results = oldResults + response.results

        presentMovieList()

        isLoadingPage = false
    }
}
