//
//  MovieDetailActorsTests.swift
//  MoviesTests
//
//  Created by Vladislav on 02.12.2022.
//

import XCTest
@testable import Movies

final class TestMovieDetailViewController: MovieDetailDisplayLogic {
    var viewModels: [[Movies.AnyItemViewModel]] = []

    func displayMovieDetail(viewModel: Movies.MovieDetailViewModel, viewModels: [[Movies.AnyItemViewModel]]) {
        self.viewModels = viewModels
    }
}

final class MovieDetailTests: XCTestCase {
    
    private let viewController = TestMovieDetailViewController()
    private var presenter: MovieDetailPresenter {
        .init(imagesService: ImagesService(), viewController: self.viewController)
    }

    func testActorCells() {
        // when
        let mockResponse = createMovieDetailPresentationResponseMock()
        
        presenter.presentMovieDetail(response: mockResponse)
        
        let actorViewModelNames = viewController.viewModels.flatMap { $0 }.compactMap { item in
            (item.wrapped as? ActorMovieDetailsCellViewModel)?.name
        }
        
        let actorNames: [String] = mockResponse.cast.compactMap { item in
            guard item.knownForDepartment == .acting else {
                return nil
            }
            return item.name
        }
        
        // then
        // compare actor cells and actors from response
        XCTAssertEqual(actorViewModelNames, actorNames, "wrong actor cells count")
    }
}

private extension MovieDetailTests {
    func createMovieDetailPresentationResponseMock() -> MovieDetailPresentationResponse {
        let cast: [Cast] = [
            Cast(name: "Dwayne Johnson", knownForDepartment: .acting, profilePath: "/cgoy7t5Ve075naBPcewZrc08qGw.jpg"),
            Cast(name: "Aldis Hodge", knownForDepartment: .acting, profilePath: "/jPpnaAGFXaIeOrRNUHIHxk3fIJL.jpg"),
            Cast(name: "Noah Centineo", knownForDepartment: .unknown, profilePath: "/p1bcst401RyxfDGykx2iQLI7CV5.jpg"),
            Cast(name: "Deborah La Mia Denaver", knownForDepartment: .unknown, profilePath: nil),
            Cast(name: "Jalon Christian", knownForDepartment: .acting, profilePath: nil)
        ]
        
        return MovieDetailPresentationResponse(movieDetail: MovieDetail(title: "",
                                                                        overview: nil,
                                                                        voteAverage: 0,
                                                                        posterPath: nil),
                                               cast: cast)
    }
}
