//
//  TextReusableTableViewCell.swift
//  Movies
//
//  Created by Vladislav on 30.11.2022.
//

import UIKit

final class DescriptionReusableTableViewCell: UITableViewCell {

    @IBOutlet private weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
}

private extension DescriptionReusableTableViewCell {
    func setupUI() {
        contentView.backgroundColor = .Theme.background1
        
        descriptionLabel.textColor = .Theme.text
        descriptionLabel.font = .Theme.Headline.h3
        descriptionLabel.numberOfLines = 0
    }
}

extension DescriptionReusableTableViewCell: CellViewModelConfigurable {
    func configure(with viewModel: ItemViewModel) {
        guard let viewModel = viewModel as? DescriptionReusableCellViewModel else {
            return
        }

        descriptionLabel.text = viewModel.description
    }
}
