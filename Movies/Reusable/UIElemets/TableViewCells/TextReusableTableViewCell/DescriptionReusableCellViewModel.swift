//
//  DescriptionReusableCellViewModel.swift
//  Movies
//
//  Created by Vladislav on 02.12.2022.
//

import Foundation

struct DescriptionReusableCellViewModel: ItemViewModel {
    let reuseIdentifier = DescriptionReusableTableViewCell.reuseIdentifier
    let description: String
}
