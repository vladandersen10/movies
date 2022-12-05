//
//  PosterMovieDetailsCellViewModel.swift
//  Movies
//
//  Created by Vladislav on 02.12.2022.
//

import Foundation

struct PosterMovieDetailsCellViewModel: ItemViewModel {
    let reuseIdentifier = PosterMovieDetailsTableViewCell.reuseIdentifier
    let imageUrl: URL?

    init(imageUrl: URL?) {
        self.imageUrl = imageUrl
    }
}
