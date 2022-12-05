//
//  MovieListRouter.swift
//  Movies
//
//  Created by Vladislav on 28.11.2022.
//

import UIKit

protocol MovieListRoutingLogic {
    func routeToMovieDetail(movieId: Int)
}

final class  MovieListRouter {

    private weak var viewController: MovieListViewController?
    
    init(viewController: MovieListViewController) {
        self.viewController = viewController
    }
}

// MARK: - MovieListRoutingLogic

extension MovieListRouter: MovieListRoutingLogic {
    func routeToMovieDetail(movieId: Int) {
        let vc = MovieDetailConfigurator.configure(movieId: movieId)
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - Private Methods

private extension  MovieListRouter {}
