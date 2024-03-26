//
//  SettingsViewController.swift
//  TechHunt
//
//  Created by Anna Sumire on 23.03.24.
//

import UIKit

final class SettingsViewController: UIViewController {
    
    // MARK: - Properties
    let navigationManager: NavigationManager
    private let authViewModel = AuthViewModel()
    private var isDarkMode = false
    
    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 70
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let emailCustomView: CustomSettingsViewComponent = {
        let emailCustomView = CustomSettingsViewComponent()
        emailCustomView.translatesAutoresizingMaskIntoConstraints = false
        return emailCustomView
    }()
    
    private let fullNameCustomView: CustomSettingsViewComponent = {
        let fullNameCustomView = CustomSettingsViewComponent()
        fullNameCustomView.translatesAutoresizingMaskIntoConstraints = false
        return fullNameCustomView
    }()
    
    private let mobileNumberCustomView: CustomSettingsViewComponent = {
        let mobileCustomView = CustomSettingsViewComponent()
        mobileCustomView.translatesAutoresizingMaskIntoConstraints = false
        return mobileCustomView
    }()
    
    private let passwordCustomView: CustomSettingsViewComponent = {
        let passwordCustomView = CustomSettingsViewComponent()
        passwordCustomView.translatesAutoresizingMaskIntoConstraints = false
        return passwordCustomView
    }()
    
    private let personalInfoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 40
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var switchStackView: UIStackView = {
        let label = UILabel()
        label.text = "Dark Mode"
        label.font = .customRoundedFont(size: 18, weight: .medium)
        let switchControl = UISwitch()
        switchControl.addTarget(self, action: #selector(switchValueChanged), for: .valueChanged)
        
        let stackView = UIStackView(arrangedSubviews: [label, switchControl])
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var trashButtonStackView: UIStackView = {
        let label = UILabel()
        label.text = "Delete Account"
        label.font = .customRoundedFont(size: 18, weight: .medium)
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "trash"), for: .normal)
        button.addTarget(self, action: #selector(showDeletionAlert), for: .touchUpInside)
        
        let stackView = UIStackView(arrangedSubviews: [label, button])
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let bottomStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 30
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        Task {
            await authViewModel.fetchUser()
            configureCustomViews()
        }
    }
    
    // MARK: - Private Methods
    private func setup() {
        setupBackground()
        setupNavigationTitle()
        setConstraints()
        configureCustomViews()
    }
    private func setupBackground() {
        view.backgroundColor = .systemBackground
    }
    
    private func setupNavigationTitle() {
        navigationItem.title = "Settings"
        navigationController?.navigationBar.prefersLargeTitles = true
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
    
    private func configureCustomViews() {
        emailCustomView.configure(with: "Email", with: authViewModel.currentUser?.email ?? "zaza@gmail.com", showEditButton: false)
        mobileNumberCustomView.configure(with: "Mobile Number", with: "+995557773047", showEditButton: false)
        fullNameCustomView.configure(with: "Full Name", with: authViewModel.currentUser?.fullname ?? "Test Test", showEditButton: true) {
            self.navigationManager.navigateToEditFullName()
        }
        passwordCustomView.configure(with: "Password", with: "************", showEditButton: true) {
            self.navigationManager.navigateToUpdatePasswordVC()
        }
    }
    
    @objc private func showDeletionAlert() {
        let alertController = UIAlertController(title: "Delete Account", message: "Are you sure you want to delete your account? This action cannot be undone.", preferredStyle: .alert)
        
        let deleteAction = UIAlertAction(title: "Delete", style: .destructive) { _ in
            self.authViewModel.deleteAccount { success in
                if success {
                    self.navigationManager.showRootView()
                } else {
                    print("Error")
                }
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        alertController.addAction(deleteAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true)
    }
    
    @objc private func switchValueChanged(_ sender: UISwitch) {
        isDarkMode = sender.isOn
        updateTheme()
    }
    
    private func updateTheme() {
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            if let window = windowScene.windows.first {
                window.overrideUserInterfaceStyle = self.isDarkMode ? .dark : .light
            }
        }
    }
}
