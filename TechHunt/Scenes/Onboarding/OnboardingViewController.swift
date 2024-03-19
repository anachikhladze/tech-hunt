//
//  OnboardingViewController.swift
//  TechHunt
//
//  Created by Anna Sumire on 19.03.24.
//


import UIKit

final class OnboardingViewController: UIViewController {
    
    let navigationManager: NavigationManager
    
    init(navigationManager: NavigationManager) {
        self.navigationManager = navigationManager
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Properties
    private let onboardingBackgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "rocket")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [welcomeTextStackView, tryItButton])
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
    
    private lazy var tryItButton: MainButtonComponent = {
        let button = MainButtonComponent (text: "GET STARTED")
        button.addTarget(self, action: #selector(tryButtonDidTap), for: .touchUpInside)
        return button
    }()
    
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
        view.addSubview(onboardingBackgroundImageView)
        view.addSubview(mainStackView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            onboardingBackgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            onboardingBackgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            onboardingBackgroundImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            onboardingBackgroundImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    //    private func animateImageScroll() {
    //        UIView.animate(withDuration: 1.5, delay: 0.0,
    //                       options: [.beginFromCurrentState],
    //                       animations: {
    //            self.onboardingBackgroundImageView.transform = CGAffineTransform(
    //                translationX: 0,
    //                y: -self.view.frame.height / 4.0)
    //        }, completion: nil)
    //    }
    
    @objc func tryButtonDidTap() {
        //        UIView.animate(withDuration: 1.0, delay: 0.0, options: [.curveEaseOut], animations: {
        //            // Change the center of the imageView to the top leading corner
        //            self.onboardingBackgroundImageView.center = CGPoint(x: 0, y: 0)
        //        }) { _ in
        self.navigationManager.showRootView()
//    }
    }
}
