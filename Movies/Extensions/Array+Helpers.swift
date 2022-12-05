//
//  Array+Helpers.swift
//  Movies
//
//  Created by Vladislav on 02.12.2022.
//

import Foundation

extension Array {

    public subscript(safeIndex index: Int) -> Element? {
        guard index >= 0, index < endIndex else {
            return nil
        }

        return self[index]
    }
}
