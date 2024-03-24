//
//  UpdateFullNameViewController.swift
//  TechHunt
//
//  Created by Anna Sumire on 24.03.24.
//

import UIKit

final class UpdateFullNameViewController: UIViewController {
    
    // MARK: - Properties
    private let authViewModel = AuthViewModel()
    
    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let customTextField: CustomTextField = {
        let textField = CustomTextField()
        textField.configure(placeholder: "Update your name",
                            keyboardType: .default,
                            icon: UIImage(systemName: "person.fill"),
                            isSecure: false)
        textField.heightAnchor.constraint(equalToConstant: 46).isActive = true
        return textField
    }()
    
    private let saveButton = PrimaryButtonComponent(text: "Save Name")
    
    // MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    // MARK: - Private methods
    private func setup() {
        setupBackground()
        setupNavigationTitle()
        setConstraints()
        setTextFieldDefaultText()
        saveButtonPressed()
    }
    
    private func setupBackground() {
        view.backgroundColor = .systemBackground
    }
    
    private func setupNavigationTitle() {
        navigationItem.title = "Update your name"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setTextFieldDefaultText() {
        Task {
            await authViewModel.fetchUser()
            customTextField.text = authViewModel.currentUser?.fullname
        }
    }
    
    private func setConstraints() {
        view.addSubview(mainStackView)
        mainStackView.addArrangedSubview(customTextField)
        mainStackView.addArrangedSubview(saveButton)
        
        NSLayoutConstraint.activate([
            mainStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            mainStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
        ])
    }
    
    private func saveButtonPressed() {
        saveButton.addAction(UIAction(handler: { [weak self] _ in
            guard let self = self else { return }
            guard let newFullName = self.customTextField.text, !newFullName.isEmpty else {
                return
            }
            Task {
                do {
                    try await self.authViewModel.updateFullName(newFullName: newFullName)
                    self.showSuccessAlert()
                } catch {
                    self.showErrorAlert()
                    print(error.localizedDescription)
                }
            }
        }), for: .touchUpInside)
    }
    
    private func showSuccessAlert() {
        let alert = UIAlertController(title: "Name has changed successfully", message: "Your full name has been successfully updated. You can change it again anytime you want.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    private func showErrorAlert() {
        let alert = UIAlertController(title: "Error has occurred", message: "Error has occurred. Please try changing name again.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
