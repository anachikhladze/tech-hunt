//
//  ExperienceViewController.swift
//  TechHunt
//
//  Created by Anna Sumire on 31.01.24.
//

import UIKit

final class ExperienceViewController: UIViewController {
    
    // MARK: - Properties
    private let viewModel = ExperienceViewModel()
    
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
        button.backgroundColor = UIColor.accent
        button.layer.cornerRadius = 14
        button.heightAnchor.constraint(equalToConstant: 46).isActive = true
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
    }
    
    // MARK: - Private Methods
    private func setup() {
        setupBackground()
        setupNavigationBar()
        addSubviews()
        setupConstraints()
        setDefaultValues()
        setupEditButton()
    }
    
    private func setupBackground() {
        view.backgroundColor = .systemBackground
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.isHidden = false
        navigationItem.title = "Experience"
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
        let contactInfo = InfoStackViewComponent(
            title: "Contact Info",
            items: [fullNameLabel, emailLabel, numberLabel, linkedinLabel],
            symbolName: "person.crop.circle"
        )
        mainStackView.addArrangedSubview(contactInfo)
        
        let educationInfo = InfoStackViewComponent(
            title: "Education",
            items: [educationLabel], symbolName: "book"
        )
        mainStackView.addArrangedSubview(educationInfo)
        
        let experienceInfo = InfoStackViewComponent(
            title: "Experience",
            items: [experience1Label, experience2Label, experience3Label], symbolName: "briefcase"
        )
        mainStackView.addArrangedSubview(experienceInfo)
        
        
        let languagesInfo = InfoStackViewComponent(
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
    
    private func setupEditButton() {
        editButton.addAction(UIAction(handler: { [weak self] _ in
            let cvFormViewController = CVFormViewController()
            cvFormViewController.delegate = self
            
            cvFormViewController.currentFullName = self?.viewModel.fullName
            cvFormViewController.currentSchool = self?.viewModel.education
            cvFormViewController.currentExperience1 = self?.viewModel.experience1
            cvFormViewController.currentExperience2 = self?.viewModel.experience2
            cvFormViewController.currentExperience3 = self?.viewModel.experience3
            cvFormViewController.currentLanguages = self?.viewModel.languages
            cvFormViewController.currentContactNumber = self?.viewModel.number
            cvFormViewController.currentEmail = self?.viewModel.email
            cvFormViewController.currentLinkedIn = self?.viewModel.linkedin
            
            let navigationController = UINavigationController(rootViewController: cvFormViewController)
            self?.present(navigationController, animated: true, completion: nil)
        }), for: .touchUpInside)
    }
}


extension ExperienceViewController: CVFormViewControllerDelegate {
    func didSaveInfo(fullName: String, school: String, experience1: String, experience2: String, experience3: String, language: String, number: String, email: String, linkedin: String) {
        
        viewModel.updateInfo(fullName: fullName, email: email, number: number, linkedin: linkedin, education: school, experience1: experience1, experience2: experience2, experience3: experience3, languages: language)
        
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
