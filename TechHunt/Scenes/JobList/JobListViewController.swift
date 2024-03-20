//
//  JobListViewController.swift
//  TechHunt
//
//  Created by Anna Sumire on 20.01.24.
//

import UIKit

final class JobListViewController: UIViewController {
    
    // MARK: - Properties
    private let viewModel = FirebaseDataViewModel()
    private var jobs: [Job] = []
    
    private let categories = [
        "Development", "Architecture", "Data Science", "Design",
        "Engeneering", "Infrastructure", "Product Management",
    ]
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: "categoryCell")
        collectionView.backgroundColor = .systemBackground
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    private let searchController: UISearchController = {
        let controller = UISearchController(searchResultsController: nil)
        controller.searchBar.placeholder = "Enter job title (e.g. Developer)"
        controller.hidesNavigationBarDuringPresentation = false
        controller.obscuresBackgroundDuringPresentation = false
        controller.searchBar.showsCancelButton = false
        controller.searchBar.searchTextField.textColor = UIColor.black
        
        return controller
    }()
    
    // MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBackground()
        setupSubviews()
        setupConstraints()
        setupTableView()
        
        setDelegates()
        setupSearchController()
        setupNavigationItems()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.viewWillAppear()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = CGRect(x: 6, y: 80,
                                      width: view.frame.size.width,
                                      height: 80)
    }
    
    // MARK: - Private Methods
    private func setupBackground() {
        view.backgroundColor = .systemBackground
    }
    
    private func setDelegates() {
        viewModel.delegate = self
        searchController.searchBar.delegate = self
        
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    private func setupSearchController() {
        definesPresentationContext = true
    }
    
    private func setupNavigationItems() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Search",
            style: .plain,
            target: self,
            action: #selector(searchButtonPressed)
        )
        navigationItem.titleView = searchController.searchBar
    }
    
    private func dismissSearchBar() {
        searchController.searchBar.resignFirstResponder()
    }
    
    private func setupSubviews() {
        view.addSubview(collectionView)
        view.addSubview(tableView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 80), // adjust this as needed

            tableView.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
        ])
    }

    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(JobTableViewCell.self, forCellReuseIdentifier: "jobCell")
    }
    
    @objc private func searchButtonPressed() {
        dismissSearchBar()
        guard let searchText = searchController.searchBar.text?.trimmingCharacters(in: .whitespacesAndNewlines), !searchText.isEmpty else {
            return
        }
        viewModel.fetchJob(withSearchText: searchText)
    }
}

// MARK: - TableVIew DataSource
extension JobListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        jobs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = jobs[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: "jobCell") as? JobTableViewCell {
            cell.configure(with: item)
            return cell
        }
        return UITableViewCell()
    }
}

// MARK: - TableVIew Delegate
extension JobListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = JobDetailsViewController(job: jobs[indexPath.row])
        vc.configure(with: jobs[indexPath.row])
        navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - JobListViewModelDelegate
extension JobListViewController: JobListViewModelDelegate {
    func didFetchJobs() {
        DispatchQueue.main.async {
            self.jobs = self.viewModel.jobs
            self.tableView.reloadData()
        }
    }
}

// MARK: - UISearchBarDelegate
extension JobListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            viewModel.fetchJobs()
        }
    }
}

// MARK: - UICollectionViewDataSource
extension JobListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "categoryCell", for: indexPath) as! CategoryCollectionViewCell
        cell.configure(with: categories[indexPath.row])
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension JobListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let label = UILabel()
        label.text = categories[indexPath.row]
        label.sizeToFit()
        return CGSize(width: label.frame.width + 40, height: 50)
    }
}
