//
//  ItemMovieListTableViewCell.swift
//  Movies
//
//  Created by Vladislav on 28.11.2022.
//

import UIKit

final class ItemMovieListTableViewCell: UITableViewCell {

    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var separatorView: UIView!
    @IBOutlet private weak var movieImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var subtitleLabel: UILabel!
    @IBOutlet private weak var ratingLabel: UILabel!
    @IBOutlet private weak var rightArrowImage: UIImageView!
    @IBOutlet private weak var ratingLineView: RatingLineView!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
        subtitleLabel.text = nil
        ratingLabel.text = nil
        movieImageView.image = nil
    }
}

private extension ItemMovieListTableViewCell {
    func setupUI() {
        selectionStyle = .none
        
        backgroundColor = .Theme.background1
        contentView.backgroundColor = .Theme.background1
        containerView.backgroundColor = .Theme.background2
        containerView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        containerView.clipsToBounds = true
        
        separatorView.backgroundColor = .Theme.separator
        
        titleLabel.textColor = .Theme.title
        titleLabel.font = .Theme.Headline.h1
        
        subtitleLabel.textColor = .Theme.text
        subtitleLabel.font = .Theme.Headline.h4
        
        ratingLabel.textColor = .Theme.text
        ratingLabel.font = .Theme.Headline.h2
        
        rightArrowImage.tintColor = .Theme.text
        rightArrowImage.backgroundColor = .Theme.background2
    }
}

// MARK: - CellViewModelConfigurable

extension ItemMovieListTableViewCell: CellViewModelConfigurable {
    func configure(with viewModel: ItemViewModel) {
        guard let viewModel = viewModel as? ItemMovieListCellViewModel else {
            return
        }

        titleLabel.text = viewModel.title
        subtitleLabel.text = viewModel.subtitle
        ratingLabel.text = "\(viewModel.ratingText)"
        ratingLineView.rating = viewModel.ratingLine
        movieImageView.setImage(viewModel.imageUrl)
        containerView.layer.cornerRadius = viewModel.isCornered ? 10 : 0
    }
}
