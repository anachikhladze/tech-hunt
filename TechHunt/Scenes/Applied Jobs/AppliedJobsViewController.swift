//
//  AppliedJobsViewController.swift
//  TechHunt
//
//  Created by Anna Sumire on 05.02.24.
//

import UIKit

final class AppliedJobsViewController: UIViewController {
    
    // MARK: - Properties
    private var jobs: [Job] = []
    private let viewModel = FirebaseDataViewModel()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    // MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBackground()
        setupNavigationBar()
        setupSubviews()
        setupConstraints()
        setupTableView()
        fetchAppliedJobs()
    }
    
    // MARK: - Private Methods
    private func setupBackground() {
        view.backgroundColor = .systemBackground
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.isHidden = false
        navigationItem.title = "Applied Jobs"
    }
    
    private func setupSubviews() {
        view.addSubview(tableView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
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
    
    private func fetchAppliedJobs() {
        Task {
            self.jobs = await viewModel.fetchAppliedJobs()
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}

// MARK: - TableVIew DataSource
extension AppliedJobsViewController: UITableViewDataSource {
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
extension AppliedJobsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = JobDetailsViewController(job: jobs[indexPath.row])
        vc.configure(with: jobs[indexPath.row])
        navigationController?.pushViewController(vc, animated: true)
    }
}
