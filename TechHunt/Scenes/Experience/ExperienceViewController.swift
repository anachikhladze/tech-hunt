//
//  ExperienceViewController.swift
//  TechHunt
//
//  Created by Anna Sumire on 31.01.24.
//

import UIKit

final class ExperienceViewController: UIViewController {
    
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
    
    private let editButton: UIButton = {
        let button = UIButton()
        button.setTitle("Edit Info", for: .normal)
        button.titleLabel?.textColor = .white
        button.titleLabel?.font = UIFont.customRoundedFont(size: 18, weight: .black)
        button.backgroundColor = UIColor.buttonBackground
        button.layer.cornerRadius = 14
        button.heightAnchor.constraint(equalToConstant: 46).isActive = true
        button.addTarget(self, action: #selector(editButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let fullNameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.customRoundedFont(size: 16, weight: .light)
        return label
    }()
    
    private let emailLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.customRoundedFont(size: 16, weight: .light)
        return label
    }()
    
    private let numberLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.customRoundedFont(size: 16, weight: .light)
        return label
    }()
    
    private let linkedinLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.customRoundedFont(size: 16, weight: .light)
        return label
    }()
    
    private let educationLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.customRoundedFont(size: 16, weight: .light)
        return label
    }()
    
    private let experience1Label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.customRoundedFont(size: 16, weight: .light)
        return label
    }()
    
    private let experience2Label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.customRoundedFont(size: 16, weight: .light)
        return label
    }()
    
    private let experience3Label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.customRoundedFont(size: 16, weight: .light)
        return label
    }()
    
    private let languagesLabel: UILabel = {
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
        navigationItem.title = "Experience"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
    }
    
    // MARK: - Private Methods
    private func setup() {
        setupBackground()
        addSubviews()
        setupConstraints()
        setDefaultValues()
    }
    
    private func setupBackground() {
        view.backgroundColor = .systemBackground
    }
    
    private func addSubviews() {
        addMainSubview()
        setupInfoStackViews()
    }
    
    private func addMainSubview() {
        view.addSubview(scrollView)
        scrollView.addSubview(mainStackView)
    }
    
    private func setupInfoStackViews() {
        let contactInfo = ExperienceInfoStackView(
            title: "Contact Info",
            items: [fullNameLabel, emailLabel, numberLabel, linkedinLabel],
            symbolName: "person.crop.circle"
        )
        mainStackView.addArrangedSubview(contactInfo)
        
        let educationInfo = ExperienceInfoStackView(
            title: "Education",
            items: [educationLabel], symbolName: "book"
        )
        mainStackView.addArrangedSubview(educationInfo)
        
        let experienceInfo = ExperienceInfoStackView(
            title: "Experience",
            items: [experience1Label, experience2Label, experience3Label], symbolName: "briefcase"
        )
        mainStackView.addArrangedSubview(experienceInfo)
        
        
        let languagesInfo = ExperienceInfoStackView(
            title: "Languages",
            items: [languagesLabel], symbolName: "globe"
        )
        mainStackView.addArrangedSubview(languagesInfo)
        
        mainStackView.addArrangedSubview(editButton)
    }
    
    private func setDefaultValues() {
        fullNameLabel.text = "Anna Sumire"
        emailLabel.text = "anachikhladze99@gmail.com"
        numberLabel.text = "557773047"
        linkedinLabel.text = "https://www.linkedin.com"
        educationLabel.text = "Free University of Tbilisi"
        experience1Label.text = "Software Engineer at Tech Innovators Inc. (2018-2020)"
        experience2Label.text = "Front-end Developer at Web Solutions Co. (2019-2022)"
        experience3Label.text = "Data Analyst at Data Insights Corp. (2020-2021)"
        languagesLabel.text = "Georgian, English, Russian, French"
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
    }
    
    @objc private func editButtonTapped() {
        let cvFormViewController = CVFormViewController()
        cvFormViewController.delegate = self
        let navigationController = UINavigationController(rootViewController: cvFormViewController)
        present(navigationController, animated: true, completion: nil)
    }
}

extension ExperienceViewController: CVFormViewControllerDelegate {
    func didSaveInfo(fullName: String, school: String, experience1: String, experience2: String, experience3: String, language: String, number: String, email: String, linkedin: String) {
        fullNameLabel.text = fullName
        educationLabel.text = school
        experience1Label.text = experience1
        experience2Label.text = experience2
        experience3Label.text = experience3
        languagesLabel.text = language
        numberLabel.text = number
        emailLabel.text = email
        linkedinLabel.text = linkedin
    }
}
