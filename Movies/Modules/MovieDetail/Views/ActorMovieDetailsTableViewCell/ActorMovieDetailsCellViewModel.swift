//
//  ActorMovieDetailsCellViewModel.swift
//  Movies
//
//  Created by Vladislav on 02.12.2022.
//

import Foundation

struct ActorMovieDetailsCellViewModel: ItemViewModel {
    let reuseIdentifier = ActorMovieDetailsTableViewCell.reuseIdentifier
    let name: String
    let imageUrl: URL?
    
    init(cast: Cast, imageURL: URL?) {
        name = cast.name
        self.imageUrl = imageURL
    }
}
