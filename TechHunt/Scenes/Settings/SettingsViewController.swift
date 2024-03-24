//
//  SettingsViewController.swift
//  TechHunt
//
//  Created by Anna Sumire on 23.03.24.
//

import UIKit

final class SettingsViewController: UIViewController {
    
    var isDarkMode = false
    private let authViewModel = AuthViewModel()
    
    let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 70
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let emailCustomView: CustomSettingsViewComponent = {
        let emailCustomView = CustomSettingsViewComponent()
        emailCustomView.translatesAutoresizingMaskIntoConstraints = false
        return emailCustomView
    }()
    
    let fullNameCustomView: CustomSettingsViewComponent = {
        let fullNameCustomView = CustomSettingsViewComponent()
        fullNameCustomView.translatesAutoresizingMaskIntoConstraints = false
        return fullNameCustomView
    }()
    
    let mobileNumberCustomView: CustomSettingsViewComponent = {
        let mobileCustomView = CustomSettingsViewComponent()
        mobileCustomView.translatesAutoresizingMaskIntoConstraints = false
        return mobileCustomView
    }()
    
    let passwordCustomView: CustomSettingsViewComponent = {
        let passwordCustomView = CustomSettingsViewComponent()
        passwordCustomView.translatesAutoresizingMaskIntoConstraints = false
        return passwordCustomView
    }()
    
    let personalInfoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 40
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let switchStackView: UIStackView = {
        let label = UILabel()
        label.text = "Dark Mode"
        label.font = .customRoundedFont(size: 18, weight: .medium)
        let switchControl = UISwitch()
        switchControl.addTarget(SettingsViewController.self, action: #selector(switchValueChanged), for: .valueChanged)
        
        let stackView = UIStackView(arrangedSubviews: [label, switchControl])
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let trashButtonStackView: UIStackView = {
        let label = UILabel()
        label.text = "Delete Account"
        label.font = .customRoundedFont(size: 18, weight: .medium)
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "trash"), for: .normal)
        
        let stackView = UIStackView(arrangedSubviews: [label, button])
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let bottomStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 30
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setConstraints()
        
        navigationItem.title = "Settings"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        configureCustomViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        Task {
          await authViewModel.fetchUser()
        }
        
    }
    
    private func setConstraints() {
        view.addSubview(mainStackView)
        mainStackView.addArrangedSubview(personalInfoStackView)
        personalInfoStackView.addArrangedSubview(emailCustomView)
        personalInfoStackView.addArrangedSubview(mobileNumberCustomView)
        personalInfoStackView.addArrangedSubview(fullNameCustomView)
        personalInfoStackView.addArrangedSubview(passwordCustomView)
        mainStackView.addArrangedSubview(bottomStackView)
        bottomStackView.addArrangedSubview(switchStackView)
        bottomStackView.addArrangedSubview(trashButtonStackView)
        
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            mainStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            mainStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            mainStackView.bottomAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
    
    func updateStyle() {
            UIView.animate(withDuration: 0.4, animations: {
               if let window = UIApplication.shared.windows.first {
                   window.overrideUserInterfaceStyle = self.isDarkMode ? .dark : .light
               }
            })
        }
    
    @objc func switchValueChanged(_ sender: UISwitch) {
           isDarkMode = sender.isOn
           updateStyle()
       }
    
    func configureCustomViews() {
        emailCustomView.configure(with: "Email", with: authViewModel.currentUser?.email ?? "zaza@gmail.com", showEditButton: false)
        mobileNumberCustomView.configure(with: "Mobile Number", with: "+995557773047", showEditButton: false)
        fullNameCustomView.configure(with: "Full Name", with: authViewModel.currentUser?.fullname ?? "Test Test", showEditButton: true) {
            self.navigateToEditFullName()
        }
        passwordCustomView.configure(with: "Password", with: "********", showEditButton: true)
    }
    
    private func navigateToEditFullName() {
        let editFullNameVC = EditFullNameViewController()
        navigationController?.pushViewController(editFullNameVC, animated: true)
    }
}
