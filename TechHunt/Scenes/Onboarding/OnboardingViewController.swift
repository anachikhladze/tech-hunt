//
//  OnboardingViewController.swift
//  TechHunt
//
//  Created by Anna Sumire on 19.03.24.
//

import UIKit

final class OnboardingViewController: UIViewController {
    
    // MARK: - Properties
    let navigationManager: NavigationManager
    
    private let onBoardingImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "working-lady")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [welcomeTextStackView, getStartedButton])
        stackView.axis = .vertical
        stackView.spacing = 32
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var welcomeTextStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [welcomeLabel, appBenefitLabel])
        stackView.axis = .vertical
        stackView.spacing = 12
        return stackView
    }()
    
    private let welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome to TechHunt"
        label.font = .customRoundedFont(size: 32, weight: .black)
        label.adjustsFontSizeToFitWidth = true
        label.textColor = .jobsFont
        return label
    }()
    
    private let appBenefitLabel: UILabel = {
        let label = UILabel()
        label.text = "Explore a wide range of job opportunities in the tech industry, from startups to tech giants."
        label.font = .customRoundedFont(size: 22, weight: .medium)
        label.textColor = .jobsFont
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var getStartedButton: MainButtonComponent = {
        let button = MainButtonComponent (text: "GET STARTED")
        button.addTarget(self, action: #selector(getStartedButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Init
    init(navigationManager: NavigationManager) {
        self.navigationManager = navigationManager
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    // MARK: - Private Methods
    private func setup() {
        setupBackground()
        setupSubviews()
        setupConstraints()
    }
    
    private func setupBackground() {
        view.backgroundColor = .systemBackground
    }
    
    private func setupSubviews() {
        view.addSubview(onBoardingImageView)
        view.addSubview(mainStackView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            onBoardingImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            onBoardingImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            onBoardingImageView.bottomAnchor.constraint(equalTo: mainStackView.topAnchor, constant: -60),
            
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    @objc func getStartedButtonDidTap() {
        navigationManager.showRootView()
    }
}
