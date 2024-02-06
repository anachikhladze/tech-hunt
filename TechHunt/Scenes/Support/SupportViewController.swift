//
//  SupportViewController.swift
//  TechHunt
//
//  Created by Anna Sumire on 06.02.24.
//

import UIKit

final class SupportViewController: UIViewController {
    
    let supportImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "customer-service")
        return imageView
    }()
    
    let supportLabel: UILabel = {
        let label = UILabel()
        label.text = "Need Some Help?"
        label.font = UIFont.customRoundedFont(size: 28, weight: .black)
        label.textAlignment = .center
        return label
    }()
    
    let button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("FAQ", for: .normal)
        return button
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
//        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.spacing = 5
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        setupConstraints()
        setBackgroundcolor()
        
    }
    
    private func setBackgroundcolor() {
        view.backgroundColor = .systemBackground
    }
    
    private func addSubviews() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        stackView.addArrangedSubview(supportImageView)
        stackView.addArrangedSubview(supportLabel)
        stackView.addArrangedSubview(button)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            supportImageView.heightAnchor.constraint(equalToConstant: 150),
            supportImageView.widthAnchor.constraint(equalToConstant: 150)
        ])
        
    }
    
    @objc func buttonTapped() {
        print("Button was tapped!")
    }
}

