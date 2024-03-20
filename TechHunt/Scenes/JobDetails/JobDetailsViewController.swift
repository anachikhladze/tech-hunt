//
//  JobDetailsViewController.swift
//  TechHunt
//
//  Created by Anna Sumire on 21.01.24.
//

import UIKit

final class JobDetailsViewController: UIViewController {
    
    // MARK: - Properties
    private let viewModel = JobDetailsViewModel()
    private var job: Job
    
    init(job: Job) {
        self.job = job
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Components
    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 8
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        return stackView
    }()
    
    private let jobImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.isUserInteractionEnabled = true
        imageView.heightAnchor.constraint(equalToConstant: 210).isActive = true
        return imageView
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = UIColor.jobsFont
        label.font = UIFont.customRoundedFont(size: 17, weight: .light)
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
    
    private lazy var sendButton: MainButtonComponent = {
        let button = MainButtonComponent (text: "Send Resume")
        return button
    }()
    
    private let heartButton: UIButton = {
        let heartButton = UIButton(type: .system)
        heartButton.setImage(UIImage(systemName: "heart"), for: .normal)
        heartButton.tintColor = UIColor.accent
        heartButton.translatesAutoresizingMaskIntoConstraints = false
        return heartButton
    }()
    
    // MARK: - ViewLifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    // MARK: - Private Methods
    private func setup() {
        setupBackground()
        setupMainStackView()
        setupJobWithInformation()
        setupDescriptionLabel()
        setupSendButton()
        setupHeartButtonConstraints()
        setupHeartButton()
    }
    
    private func setupBackground() {
        view.backgroundColor = .systemBackground
    }
    
    private func setupMainStackView() {
        view.addSubview(mainStackView)
        mainStackView.addArrangedSubview(jobImageView)
        
        let spacerView = UIView()
        spacerView.setContentHuggingPriority(.defaultLow, for: .vertical)
        mainStackView.addArrangedSubview(spacerView)
        
        NSLayoutConstraint.activate([
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -90)
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
        stackView.layoutMargins = UIEdgeInsets(top: 2, left: 16, bottom: 0, right: 16)
        
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        imageView.image = UIImage(systemName: imageName)
        
        let detailLabel = UILabel()
        detailLabel.text = detail
        detailLabel.textColor = UIColor.jobsFont
        detailLabel.numberOfLines = 0
        detailLabel.font = UIFont.customRoundedFont(size: 18, weight: .light)
        
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(detailLabel)
        
        mainStackView.addArrangedSubview(stackView)
    }
    
    private func setupJobWithInformation() {
        navigationItem.title = job.title
        jobImageView.image = viewModel.imageForCategory(job.category)
        descriptionLabel.text = job.description
        createInfoStackView("person.fill", detail: job.title)
        createInfoStackView("building.columns", detail: job.company)
        createInfoStackView("list.bullet", detail: job.category)
        createInfoStackView("person.badge.clock", detail: job.type)
    }
    
    private func setupHeartButtonConstraints() {
        jobImageView.addSubview(heartButton)
        
        NSLayoutConstraint.activate([
            heartButton.topAnchor.constraint(equalTo: jobImageView.topAnchor, constant: 8),
            heartButton.trailingAnchor.constraint(equalTo: jobImageView.trailingAnchor, constant: -8),
        ])
    }
    
    // MARK: - Configure
    func configure(with job: Job) {
        self.job = job
    }
    
    // MARK: - Setup Buttons
    private func setupSendButton() {
        mainStackView.addArrangedSubview(sendButton)
        
        Task {
            let hasApplied = await viewModel.hasAppliedForJob(jobId: job.id)
            let buttonTitle = hasApplied ? "Applied" : "Apply Now"
            sendButton.setTitle(buttonTitle, for: .normal)
        }
        
        sendButton.addAction(UIAction(handler: { [weak self] _ in
            guard let self = self else { return }
            Task {
                await self.viewModel.applyForJob(jobId: self.job.id)
                self.sendButton.setTitle("Applied", for: .normal)
            }
        }), for: .touchUpInside)
    }
    
    private func setupHeartButton() {
        Task {
            let isFavorite = await viewModel.isJobFavorite(jobId: job.id)
            DispatchQueue.main.async {
                self.heartButton.setImage(UIImage(systemName: isFavorite ? "heart.fill" : "heart"), for: .normal)
            }
        }
        
        heartButton.addAction(UIAction(handler: { [weak self] _ in
            guard let self = self else { return }
            Task {
                await self.viewModel.toggleFavoriteJob(jobId: self.job.id)
                let isFavorite = await self.viewModel.isJobFavorite(jobId: self.job.id)
                DispatchQueue.main.async {
                    self.heartButton.setImage(UIImage(systemName: isFavorite ? "heart.fill" : "heart"), for: .normal)
                }
            }
        }), for: .touchUpInside)
    }
}
