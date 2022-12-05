//
//  MovieListViewController.swift
//  Movies
//
//  Created by Vladislav on 28.11.2022.
//

import UIKit
import SnapKit

protocol MovieListDisplayLogic: AnyObject {
    func displayMovieList(_ viewModels: [ItemMovieListCellViewModel])
    func displayPaginationLoading(_ isAnimating: Bool)
}

final class MovieListViewController: UIViewController {
    
    private enum Constants {
        static let tableEstimatedRowHeight: CGFloat = 120
        static let tableRowHeight: CGFloat = 120
        static let tableContentInsetBottom: CGFloat = 80
    }
    
    private let searchBar = UISearchBar()
    private let tableView = UITableView()
    private lazy var loadingSpinner: UIActivityIndicatorView = {
        .paginationActivityIndicator(view: view, scrollView: tableView)
    }()

    private var dataSource = TableViewModelDataSource<ItemMovieListCellViewModel>(rows: [])

    var interactor: MovieListBusinessLogic?
    var router: MovieListRouter?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        setupSubviews()

        interactor?.viewLoaded()        
    }
}

// MARK: - MovieListDisplayLogic

extension MovieListViewController: MovieListDisplayLogic {
    func displayMovieList(_ viewModels: [ItemMovieListCellViewModel]) {
        loadingSpinner.stopAnimating()
        dataSource.update(rows: viewModels)
        tableView.reloadData()
    }

    func displayPaginationLoading(_ isAnimating: Bool) {
        isAnimating ? loadingSpinner.startAnimating() : loadingSpinner.stopAnimating()
    }
}

// MARK: - Private Methods

private extension MovieListViewController {
    func setupSubviews() {
        title = R.string.localizable.movie_list_navigation_title()
        
        view.backgroundColor = .Theme.background1

        searchBar.delegate = self
        searchBar.placeholder = R.string.localizable.movie_list_search_placeholder()
        searchBar.searchTextField.textColor = .Theme.text
        searchBar.searchTextField.tintColor = .Theme.text
        searchBar.backgroundColor = .Theme.background1
        searchBar.backgroundImage = UIImage()
        
        setupTableView()
    }

    func setupTableView() {
        tableView.tableHeaderView = searchBar
        searchBar.sizeToFit()
        tableView.separatorStyle = .none
        tableView.keyboardDismissMode = .onDrag
        tableView.registerCells([ItemMovieListTableViewCell.self])
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = Constants.tableEstimatedRowHeight
        tableView.rowHeight = Constants.tableRowHeight
        tableView.contentInset.bottom = Constants.tableContentInsetBottom
        tableView.backgroundColor = .Theme.background1

        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalToSuperview()
        }
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension MovieListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.numberOfItems(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = dataSource[indexPath]
        let cell = tableView.dequeueReusableCell(withIdentifier: viewModel.reuseIdentifier, for: indexPath)
        
        (cell as? CellViewModelConfigurable)?.configure(with: viewModel)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewModel = dataSource[indexPath]
        router?.routeToMovieDetail(movieId: viewModel.movieId)
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {

        guard let lastIndex = dataSource.lastIndex(), indexPath == lastIndex else {
            return
        }

        interactor?.lastCellDisplayed()
    }
}

// MARK: - UISearchBarDelegate

extension MovieListViewController: UISearchBarDelegate {
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        interactor?.searchCancelled()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        interactor?.searchTextChanged(searchText)
    }
}
