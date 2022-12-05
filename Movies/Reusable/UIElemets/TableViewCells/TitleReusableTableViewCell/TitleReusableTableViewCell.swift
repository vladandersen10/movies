//
//  TitleReusableTableViewCell.swift
//  Movies
//
//  Created by Vladislav on 30.11.2022.
//

import UIKit

final class TitleReusableTableViewCell: UITableViewCell {

    @IBOutlet private weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }
}

private extension TitleReusableTableViewCell {
    func setupUI() {
        contentView.backgroundColor = .Theme.background1
        
        titleLabel.textColor = .Theme.title
        titleLabel.font = .Theme.Headline.h1
    }
}

extension TitleReusableTableViewCell: CellViewModelConfigurable {
    func configure(with viewModel: ItemViewModel) {
        guard let viewModel = viewModel as? TitleReusableCellViewModel else {
            return
        }
        
        titleLabel.text = viewModel.title
    }
}
