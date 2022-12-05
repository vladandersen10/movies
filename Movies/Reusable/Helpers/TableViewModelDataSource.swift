//
//  TableViewModelDataSource.swift
//  Movies
//
//  Created by Vladislav on 28.11.2022.
//

import Foundation

struct TableViewModelDataSource<ViewModel: ItemViewModel> {

    private(set) var viewModels: [[ViewModel]]

    init(rows: [ViewModel]) {
        self.init(rowsAndSections: [rows])
    }

    init(rowsAndSections items: [[ViewModel]]) {
        viewModels = items
    }

    var numberOfSections: Int {
        viewModels.count
    }

    func numberOfItems(in section: Int) -> Int {
        viewModels[safeIndex: section]?.count ?? 0
    }

    mutating func update(rows: [ViewModel]) {
        update(rowsAndSections: [rows])
    }

    mutating func update(rowsAndSections items: [[ViewModel]]) {
        viewModels = items
    }

    subscript(indexPath: IndexPath) -> ViewModel {
        viewModels[indexPath.section][indexPath.row]
    }

    func lastIndex() -> IndexPath? {
        let section = viewModels.endIndex - 1
        guard let endIndex = viewModels[safeIndex: section]?.endIndex else {
            return nil
        }

        let row = endIndex - 1

        guard row >= 0, section >= 0 else {
            return nil
        }
        
        return IndexPath(row: row,
                         section: section)
    }
}
