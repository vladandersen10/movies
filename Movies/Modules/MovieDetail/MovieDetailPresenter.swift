//
//  MovieDetailPresenter.swift
//  Movies
//
//  Created by Vladislav on 30.11.2022.
//  
//

import Foundation

protocol MovieDetailPresentationLogic {
    func presentMovieDetail(response: MovieDetailPresentationResponse)
}

final class MovieDetailPresenter {

    private weak var viewController: MovieDetailDisplayLogic?
    
    private let imagesService: ImagesServiceable

    init(imagesService: ImagesServiceable, viewController: MovieDetailDisplayLogic) {
        self.imagesService = imagesService
        self.viewController = viewController
    }
}

// MARK: - MovieDetailPresentationLogic

extension MovieDetailPresenter: MovieDetailPresentationLogic {

    func presentMovieDetail(response: MovieDetailPresentationResponse) {
        var viewModel = MovieDetailViewModel()
        viewModel.navigationTitle = response.movieDetail.title
        viewModel.rating = R.string.localizable.movie_detail_rating_label(response.movieDetail.voteAverage)
        let posterURL = imagesService.originalImage(response.movieDetail.posterPath)
        
        var viewModels: [[AnyItemViewModel]] = [
            [PosterMovieDetailsCellViewModel(imageUrl: posterURL).asAnyItem]
        ]
        
        if let overview = response.movieDetail.overview {
            viewModels.append(createOverviewSections(overview: overview))
        }
        
        if let actorItems = createActorsSection(cast: response.cast) {
            viewModels.append(actorItems)
        }
        
        viewController?.displayMovieDetail(viewModel: viewModel, viewModels: viewModels)
    }
}

// MARK: - Private Methods

private extension MovieDetailPresenter {
    func createActorsSection(cast: [Cast]) -> [AnyItemViewModel]? {
        let cast = cast.filter { $0.knownForDepartment == .acting }
        guard !cast.isEmpty else {
            return nil
        }
        
        let title = R.string.localizable.movie_detail_cast_title()
        let titleItem = [TitleReusableCellViewModel(title: title).asAnyItem]

        let actorItems: [AnyItemViewModel] = cast.map {
            let imageURL = imagesService.smallImage($0.profilePath)
            return ActorMovieDetailsCellViewModel(cast: $0, imageURL: imageURL).asAnyItem
        }
        
        return titleItem + actorItems
    }
    
    func createOverviewSections(overview: String) -> [AnyItemViewModel] {
        let title = R.string.localizable.movie_detail_overview_title()
        let titleItem = [TitleReusableCellViewModel(title: title).asAnyItem]
        let overviewItem = [DescriptionReusableCellViewModel(description: overview).asAnyItem]
        
        return titleItem + overviewItem
    }
}
