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
            items: [
                "Full Name: Anna Sumire",
                "Email Address: anachikhladze99@gmail.com",
                "Contact Number: 557773047",
                "LinkedIn Profile: https://www.linkedin.com"
            ], symbolName: "person.crop.circle"
        )
        mainStackView.addArrangedSubview(contactInfo)
        
        let educationInfo = ExperienceInfoStackView(
            title: "Education",
            items: ["School/University: Free University of Tbilisi"], symbolName: "book"
        )
        mainStackView.addArrangedSubview(educationInfo)
        
        let experienceInfo = ExperienceInfoStackView(
            title: "Experience",
            items: [
                "Software Engineer at Tech Innovators Inc. (2018-2020)",
                "Front-end Developer at Web Solutions Co. (2019-2022)",
                "Data Analyst at Data Insights Corp. (2020-2021)"
            ], symbolName: "briefcase"
        )
        mainStackView.addArrangedSubview(experienceInfo)
        
        let languagesInfo = ExperienceInfoStackView(
            title: "Languages",
            items: ["Georgian, English, Russian, French"], symbolName: "globe"
        )
        mainStackView.addArrangedSubview(languagesInfo)
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
    }
}
