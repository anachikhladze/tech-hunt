//
//  RulesViewController.swift
//  TechHunt
//
//  Created by Anna Sumire on 02.02.24.
//

import UIKit

final class RulesViewController: UIViewController {
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        return stackView
    }()
    
    private let dismissButton: UIButton = {
        let button = UIButton()
        button.setTitle("Dismiss", for: .normal)
        button.titleLabel?.textColor = .white
        button.titleLabel?.font = UIFont.customRoundedFont(size: 18, weight: .black)
        button.backgroundColor = UIColor.buttonBackground
        button.layer.cornerRadius = 14
        button.heightAnchor.constraint(equalToConstant: 46).isActive = true
        return button
    }()
    
    private let discoverLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.customRoundedFont(size: 16, weight: .light)
        return label
    }()
    
    private let trendsLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.customRoundedFont(size: 16, weight: .light)
        return label
    }()
    
    private let createLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.customRoundedFont(size: 16, weight: .light)
        return label
    }()
    
    private let applyLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.customRoundedFont(size: 16, weight: .light)
        return label
    }()
    
    private let findLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.customRoundedFont(size: 16, weight: .light)
        return label
    }()
    
    private let referalLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.customRoundedFont(size: 16, weight: .light)
        return label
    }()
    
    private let favoriteLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.customRoundedFont(size: 16, weight: .light)
        return label
    }()
    
    // MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        navigationItem.title = "How to use TechHunt?"
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    // MARK: - Private Methods
    private func setup() {
        setupBackground()
        addSubviews()
        setupConstraints()
        setDefaultValues()
        
        navigationController?.navigationBar.isHidden = false
    }
    
    private func setupBackground() {
        view.backgroundColor = .systemBackground
    }
    
    private func addSubviews() {
        addMainSubview()
        setupInfoStackViews()
        setupDismissButton()
    }
    
    private func addMainSubview() {
        view.addSubview(scrollView)
        scrollView.addSubview(mainStackView)
    }
    
    private func setupInfoStackViews() {
        let discoverInfo = ExperienceInfoStackView(
            title: "Discover Jobs",
            items: [discoverLabel],
            symbolName: "magnifyingglass.circle"
        )
        mainStackView.addArrangedSubview(discoverInfo)
        
        let trendsInfo = ExperienceInfoStackView(
            title: "Stay on Top of Trends",
            items: [trendsLabel], symbolName: "waveform.path.ecg"
        )
        mainStackView.addArrangedSubview(trendsInfo)
        
        let createInfo = ExperienceInfoStackView(
            title: "Create Your CV for Free",
            items: [createLabel], symbolName: "doc.text"
        )
        mainStackView.addArrangedSubview(createInfo)
        
        let applyInfo = ExperienceInfoStackView(
            title: "Apply Directly from the App",
            items: [applyLabel], symbolName: "paperplane"
        )
        mainStackView.addArrangedSubview(applyInfo)
        
        let findInfo = ExperienceInfoStackView(
            title: "Let Companies Find You",
            items: [findLabel], symbolName: "person.crop.circle.badge.checkmark"
        )
        mainStackView.addArrangedSubview(findInfo)
        
        let referalInfo = ExperienceInfoStackView(
            title: "Refer a Friend",
            items: [referalLabel], symbolName: "person.2"
        )
        mainStackView.addArrangedSubview(referalInfo)
        
        let favoriteInfo = ExperienceInfoStackView(
            title: "Favorite the Jobs You Love",
            items: [favoriteLabel], symbolName: "heart"
        )
        mainStackView.addArrangedSubview(favoriteInfo)
    }
    
    private func setDefaultValues() {
        discoverLabel.text = "Discover the Best Tech Vacancies: We’ve curated a list of the best tech jobs just for you. Browse through them at your leisure and find the one that fits you like a glove."
        trendsLabel.text = "Stay on Top of Trends: With our trending jobs feature, you’ll always be in the know about the hottest jobs in the market. Don’t miss out!"
        createLabel.text = " Create Your CV for Free: First impressions matter! Create a standout CV with our easy-to-use CV builder. It’s free and only takes a few minutes."
        applyLabel.text = "Apply Directly from the App: Found a job you love? Apply directly from the job details page. It’s as easy as a tap!"
        findLabel.text = "Let Companies Find You: After you apply, companies can check out your profile right in the app. Sit back, relax, and let your next job find you."
        referalLabel.text = "Refer a Friend: Know someone perfect for a job? Refer them through the app and you could be part of our New Year’s Eve giveaway. Sharing is caring (and rewarding)!"
        favoriteLabel.text = "Favorite the Jobs You Love: Save the jobs you’re interested in to your favorites. They’ll be waiting for you when you’re ready to apply."
    }
    
    private func setupConstraints() {
        setupMainViewConstraints()
        customizeStackViewSpacing()
    }
    
    private func setupMainViewConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            mainStackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            mainStackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }
    
    private func customizeStackViewSpacing() {
        mainStackView.setCustomSpacing(16, after: mainStackView.subviews[0])
        mainStackView.setCustomSpacing(16, after: mainStackView.subviews[1])
        mainStackView.setCustomSpacing(16, after: mainStackView.subviews[2])
        mainStackView.setCustomSpacing(16, after: mainStackView.subviews[3])
        mainStackView.setCustomSpacing(16, after: mainStackView.subviews[4])
        mainStackView.setCustomSpacing(16, after: mainStackView.subviews[5])
    }
    
    private func setupDismissButton() {
        mainStackView.addArrangedSubview(dismissButton)
        
        dismissButton.addAction(UIAction(handler: { [weak self] _ in
            self?.dismiss(animated: true, completion: nil)
        }), for: .touchUpInside)
    }
}
