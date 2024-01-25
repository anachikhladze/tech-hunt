//
//  JobDetailsViewController.swift
//  TechHunt
//
//  Created by Anna Sumire on 21.01.24.
//

import UIKit

final class JobDetailsViewController: UIViewController {
    
    // MARK: - Properties
    private let viewModel = JobListViewModel()
    private var job: Job?
    
    // MARK: - UI Components
    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 8
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let jobImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.heightAnchor.constraint(equalToConstant: 210).isActive = true
        return imageView
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .black
        label.font = UIFont(name: "Avenir Next", size: 16)
        return label
    }()
    
    private let bottomSectionStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .white
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        return stackView
    }()
    
    private let sendButton: UIButton = {
        let button = UIButton()
        button.setTitle("Send Resume", for: .normal)
        button.titleLabel?.textColor = .white
        button.titleLabel?.font = UIFont(name: "Avenir Next", size: 18)
        button.backgroundColor = UIColor.buttonBackground
        button.layer.cornerRadius = 10
        button.heightAnchor.constraint(equalToConstant: 36).isActive = true
        return button
    }()
    
    // MARK: - ViewLifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    // MARK: - Private Methods
    private func setup() {
        view.backgroundColor = .white
        setupMainStackView()
        setupJobWithInformation()
        setupDescriptionLabel()
        setupBottomSectionStackView()
        setupSendButton()
    }
    
    private func setupMainStackView() {
        view.addSubview(mainStackView)
        mainStackView.addArrangedSubview(jobImageView)
        
        NSLayoutConstraint.activate([
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ])
    }
    
    private func setupDescriptionLabel() {
        let stackView = UIStackView()
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 8, left: 16, bottom: 12, right: 16)
        
        stackView.addArrangedSubview(descriptionLabel)
        mainStackView.addArrangedSubview(stackView)
    }
    
    
    private func createInfoStackView(_ imageName: String, detail: String) {
        let stackView = UIStackView()
        stackView.spacing = 8
        stackView.alignment = .leading
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 2, left: 32, bottom: 0, right: 16)
        
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        imageView.image = UIImage(systemName: imageName)
        
        let detailLabel = UILabel()
        detailLabel.text = detail
        detailLabel.textColor = .black
        detailLabel.numberOfLines = 0
        detailLabel.font = UIFont(name: "Avenir Next", size: 17)
        
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(detailLabel)
        
        mainStackView.addArrangedSubview(stackView)
    }
    
    private func setupBottomSectionStackView() {
        view.addSubview(bottomSectionStackView)
        
        NSLayoutConstraint.activate([
            bottomSectionStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomSectionStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomSectionStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            bottomSectionStackView.heightAnchor.constraint(equalToConstant: 114)
        ])
    }
    
    private func setupSendButton() {
        bottomSectionStackView.addArrangedSubview(sendButton)
    }
    
    private func setupJobWithInformation() {
        guard let job else { return }
        navigationItem.title = job.title
        jobImageView.image = viewModel.imageForCategory(job.category)
        descriptionLabel.text = job.description
        createInfoStackView("person.fill", detail: job.title)
        createInfoStackView("building.columns", detail: job.company)
        createInfoStackView("list.bullet", detail: job.category)
        createInfoStackView("person.badge.clock", detail: job.type)
    }
    
    // MARK: - Configure
    func configure(with job: Job) {
        self.job = job
    }
}
