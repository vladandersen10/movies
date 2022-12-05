//
//  ActorMovieDetailsTableViewCell.swift
//  Movies
//
//  Created by Vladislav on 30.11.2022.
//

import UIKit

final class ActorMovieDetailsTableViewCell: UITableViewCell {

    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var photoImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        nameLabel.text = nil
        photoImageView.image = nil
    }
}

private extension ActorMovieDetailsTableViewCell {
    func setupUI() {
        contentView.backgroundColor = .Theme.background1
        
        nameLabel.textColor = .Theme.text
        nameLabel.font = .Theme.Headline.h2

        photoImageView.layer.cornerRadius = 25
        photoImageView.contentMode = .scaleAspectFill
    }
}

extension ActorMovieDetailsTableViewCell: CellViewModelConfigurable {
    func configure(with viewModel: ItemViewModel) {
        guard let viewModel = viewModel as? ActorMovieDetailsCellViewModel else {
            return
        }
        
        nameLabel.text = viewModel.name
        photoImageView.setImage(viewModel.imageUrl)
    }
}
