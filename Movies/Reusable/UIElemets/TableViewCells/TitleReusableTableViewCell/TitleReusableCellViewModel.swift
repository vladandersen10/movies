//
//  TitleReusableCellViewModel.swift
//  Movies
//
//  Created by Vladislav on 02.12.2022.
//

import Foundation

struct TitleReusableCellViewModel: ItemViewModel {
    let reuseIdentifier = TitleReusableTableViewCell.reuseIdentifier
    let title: String
}
