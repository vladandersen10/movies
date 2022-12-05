//
//  ItemMovieListViewModel.swift
//  Movies
//
//  Created by Vladislav on 28.11.2022.
//

import Foundation

struct ItemMovieListCellViewModel: ItemViewModel {

    let reuseIdentifier = ItemMovieListTableViewCell.reuseIdentifier
    let movieId: Int
    let title: String
    let subtitle: String
    let ratingLine: Double
    let ratingText: String
    let imageUrl: URL?
    var isCornered: Bool = false
    
    init(movie: Movie, genres: String, ratingLine: Double, ratingText: String, imageUrl: URL?) {
        movieId = movie.id
        title = movie.title
        self.ratingLine = ratingLine
        self.ratingText = ratingText
        subtitle = genres
        self.imageUrl = imageUrl
    }
}
