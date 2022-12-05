//
//  MovieDetailConfigurator.swift
//  Movies
//
//  Created by Vladislav on 30.11.2022.
//

import UIKit

final class MovieDetailConfigurator {

    static func configure(movieId: Int) -> UIViewController {
        let service = NetworkService()
        let moviesService = MoviesService(service: service)
        let viewController = MovieDetailViewController()
        let presenter = MovieDetailPresenter(imagesService: ImagesService(), viewController: viewController)
        let interactor = MovieDetailInteractor(movieId: movieId, moviesService: moviesService, presenter: presenter)
        let router = MovieDetailRouter(viewController: viewController)

        viewController.interactor = interactor
        viewController.router = router

        return viewController
    }
}
