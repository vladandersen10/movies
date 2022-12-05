//
//  MovieDetailRouter.swift
//  Movies
//
//  Created by Vladislav on 30.11.2022.
//

import UIKit

protocol MovieDetailRoutingLogic {}

final class  MovieDetailRouter: NSObject {

    private weak var viewController: MovieDetailViewController?
    
    init(viewController: MovieDetailViewController) {
        self.viewController = viewController
    }
}

// MARK: - MovieDetailRoutingLogic

extension MovieDetailRouter: MovieDetailRoutingLogic {
}

// MARK: - Private Methods

private extension  MovieDetailRouter {}
