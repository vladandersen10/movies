//
//  AnyItemViewModel.swift
//  Movies
//
//  Created by Vladislav on 28.11.2022.
//

import Foundation

protocol ViewModelCellIdentifiable {
    var reuseIdentifier: String { get }
}

protocol ItemViewModel: ViewModelCellIdentifiable {}

struct AnyItemViewModel: ItemViewModel {

    var reuseIdentifier: String { wrapped.reuseIdentifier }

    let wrapped: ItemViewModel

    init(wrapped: ItemViewModel) {
        self.wrapped = wrapped
    }
}

extension ItemViewModel {
    var asAnyItem: AnyItemViewModel {
        AnyItemViewModel(wrapped: self)
    }
}
