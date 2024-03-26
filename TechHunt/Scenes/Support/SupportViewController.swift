//
//  SupportViewController.swift
//  TechHunt
//
//  Created by Anna Sumire on 06.02.24.
//

import UIKit

final class SupportViewController: UIViewController {
    
    // MARK: - Properties
    private let navigationManager: NavigationManager
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let supportImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "customer-service")
        return imageView
    }()
    
    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 32
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        return stackView
    }()
    
    private let infoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let dismissButton = PrimaryButtonComponent(text: "FAQ")
    
    private let needHelpLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.customRoundedFont(size: 20, weight: .light)
        return label
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
        setupNavigationBar()
        addSubviews()
        setupConstraints()
        setDefaultValues()
    }
    
    private func setupBackground() {
        view.backgroundColor = .systemBackground
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.isHidden = false
        navigationItem.title = "Support"
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    private func addSubviews() {
        addMainSubview()
        setupInfoStackViews()
        setupDismissButton()
    }
    
    private func addMainSubview() {
        view.addSubview(scrollView)
        scrollView.addSubview(mainStackView)
        
        mainStackView.addArrangedSubview(supportImageView)
        mainStackView.addArrangedSubview(infoStackView)
    }
    
    private func setupInfoStackViews() {
        let supportInfo = InfoStackViewComponent(
            title: "Need Some Help?",
            items: [needHelpLabel],
            symbolName: "questionmark.circle"
        )
        infoStackView.addArrangedSubview(supportInfo)
        
    }
    
    private func setDefaultValues() {
        let boldAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.customRoundedFont(size: 16, weight: .bold)
        ]
        let attributedText = NSMutableAttributedString(string: "Thank you for choosing TechHunt! We're here to ensure your experience with our app is smooth and enjoyable. Below, you'll find answers to commonly asked questions. If you don't find what you're looking for, don't hesitate to reach out to us at ", attributes: nil)
        let boldPart = NSAttributedString(string: "TechHunt@support.com", attributes: boldAttributes)
        attributedText.append(boldPart)
        needHelpLabel.attributedText = attributedText
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
            
            supportImageView.heightAnchor.constraint(equalToConstant: 170),
            supportImageView.widthAnchor.constraint(equalToConstant: 150),
            mainStackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            mainStackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }
    
    private func customizeStackViewSpacing() {
        mainStackView.setCustomSpacing(32, after: mainStackView.subviews[0])
        mainStackView.setCustomSpacing(32, after: mainStackView.subviews[1])
    }
    
    private func setupDismissButton() {
        infoStackView.addArrangedSubview(dismissButton)
        
        dismissButton.addAction(UIAction(handler: { [weak self] _ in
            self?.navigationManager.pushRulesVC()
        }), for: .touchUpInside)
    }
}
