//
//  MovieDetailViewController.swift
//  Movies
//
//  Created by Vladislav on 30.11.2022.
//

import UIKit

protocol MovieDetailDisplayLogic: AnyObject {
    func displayMovieDetail(viewModel: MovieDetailViewModel, viewModels: [[AnyItemViewModel]])
}

final class MovieDetailViewController: UIViewController {

    private enum Constants {
        static let tableEstimatedRowHeight: CGFloat = 50
        static let rightNavigationLabelHeight: CGFloat = 20
        static let rightNavigationLabelWidth: CGFloat = 50
    }

    private let tableView = UITableView()
    private var rightNavigationLabel = UILabel()
    
    private var viewModel = MovieDetailViewModel()
    private var dataSource = TableViewModelDataSource<AnyItemViewModel>(rows: [])

    var interactor: MovieDetailBusinessLogic?
    var router: MovieDetailRoutingLogic?

    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBar()
        setupSubviews()
        interactor?.viewLoaded()
    }
}

// MARK: - MovieDetailDisplayLogic

extension MovieDetailViewController: MovieDetailDisplayLogic {

    func displayMovieDetail(viewModel: MovieDetailViewModel, viewModels: [[AnyItemViewModel]]) {
        updateViewModel(viewModel)
        dataSource.update(rowsAndSections: viewModels)
        
        tableView.reloadData()
    }
}

// MARK: - Private Methods

private extension MovieDetailViewController {
    func setupSubviews() {
        view.backgroundColor = .Theme.background1
        
        rightNavigationLabel.snp.makeConstraints { make in
            make.width.equalTo(Constants.rightNavigationLabelWidth)
            make.height.equalTo(Constants.rightNavigationLabelHeight)
        }
        rightNavigationLabel.font = .Theme.Headline.h2
        rightNavigationLabel.textColor = .Theme.text
        rightNavigationLabel.text = viewModel.rating
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightNavigationLabel)

        tableView.backgroundColor = .Theme.background1
        tableView.separatorStyle = .none
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalToSuperview()
        }

        setupTableView()
    }
    
    func setupTableView() {
        tableView.registerCells([TitleReusableTableViewCell.self,
                                 PosterMovieDetailsTableViewCell.self,
                                 DescriptionReusableTableViewCell.self,
                                 ActorMovieDetailsTableViewCell.self])
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = Constants.tableEstimatedRowHeight
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    func updateViewModel(_ viewModel: MovieDetailViewModel) {
        self.viewModel = viewModel
        title = viewModel.navigationTitle
        rightNavigationLabel.text = viewModel.rating
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension MovieDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        dataSource.numberOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.numberOfItems(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = dataSource[indexPath].wrapped
        let cell = tableView.dequeueReusableCell(withIdentifier: viewModel.reuseIdentifier, for: indexPath)

        (cell as? CellViewModelConfigurable)?.configure(with: viewModel)
        return cell
    }
}
