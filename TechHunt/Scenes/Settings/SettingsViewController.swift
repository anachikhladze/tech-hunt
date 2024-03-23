//
//  SettingsViewController.swift
//  TechHunt
//
//  Created by Anna Sumire on 23.03.24.
//

import UIKit

final class SettingsViewController: UIViewController {
    
    let emailCustomView: CustomSettingsView = {
        let emailCustomView = CustomSettingsView()
        emailCustomView.translatesAutoresizingMaskIntoConstraints = false
        emailCustomView.configure(with: "Email", with: "test@gmail.com", showEditButton: false)
        return emailCustomView
    }()
    
    let fullNameCustomView: CustomSettingsView = {
        let emailCustomView = CustomSettingsView()
        emailCustomView.translatesAutoresizingMaskIntoConstraints = false
        emailCustomView.configure(with: "Full Name", with: "Ana Chikhladze", showEditButton: true)
        return emailCustomView
    }()
    
    let mobileNumberCustomView: CustomSettingsView = {
        let emailCustomView = CustomSettingsView()
        emailCustomView.translatesAutoresizingMaskIntoConstraints = false
        emailCustomView.configure(with: "Mobile Number", with: "+995557773047", showEditButton: false)
        return emailCustomView
    }()
    
    let passwordCustomView: CustomSettingsView = {
        let emailCustomView = CustomSettingsView()
        emailCustomView.translatesAutoresizingMaskIntoConstraints = false
        emailCustomView.configure(with: "Password", with: "********", showEditButton: true)
        return emailCustomView
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setConstraints()
        
        navigationItem.title = "Settings"
        navigationController?.navigationBar.prefersLargeTitles = true
            
    }
    
    private func setConstraints() {
        view.addSubview(stackView)
        stackView.addArrangedSubview(emailCustomView)
        stackView.addArrangedSubview(mobileNumberCustomView)
        stackView.addArrangedSubview(fullNameCustomView)
        stackView.addArrangedSubview(passwordCustomView)
        
        stackView.spacing = 30
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            stackView.bottomAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }

}
