//
//  MovieListConfigurator.swift
//  Movies
//
//  Created by Vladislav on 28.11.2022.
//

import UIKit

final class MovieListConfigurator {

    static func configure() -> UIViewController {
        let service = NetworkService()
        let moviesService = MoviesService(service: service)
        let viewController = MovieListViewController()
        let presenter = MovieListPresenter(imagesService: ImagesService(),
                                           viewController: viewController)
        let interactor = MovieListInteractor(moviesService: moviesService, presenter: presenter)
        let router = MovieListRouter(viewController: viewController)

        viewController.interactor = interactor
        viewController.router = router
        
        return viewController
    }
}
