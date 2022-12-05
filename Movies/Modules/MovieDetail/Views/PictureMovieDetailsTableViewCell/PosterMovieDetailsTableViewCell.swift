//
//  PictureMovieDetailsTableViewCell.swift
//  Movies
//
//  Created by Vladislav on 30.11.2022.
//

import UIKit

final class PosterMovieDetailsTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var pictureImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }
}

private extension PosterMovieDetailsTableViewCell {
    func setupUI() {
        contentView.backgroundColor = .Theme.background1
        pictureImageView.contentMode = .scaleAspectFill
    }
}

extension PosterMovieDetailsTableViewCell: CellViewModelConfigurable {
    func configure(with viewModel: ItemViewModel) {
        guard let viewModel = viewModel as? PosterMovieDetailsCellViewModel else {
            return
        }
        
        pictureImageView.setImage(viewModel.imageUrl)
    }
}
