//
//  UpdatePasswordViewController.swift
//  TechHunt
//
//  Created by Anna Sumire on 24.03.24.
//

import UIKit

final class UpdatePasswordViewController: UIViewController {
    
    // MARK: - Properties
    private let viewModel = AuthViewModel()
    
    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let passwordTextField: CustomTextField = {
        let textField = CustomTextField()
        textField.configure(placeholder: "Type new password",
                            keyboardType: .default,
                            icon: UIImage(systemName: "lock.fill"),
                            isSecure: true)
        textField.heightAnchor.constraint(equalToConstant: 46).isActive = true
        return textField
    }()
    
    private let confirmPasswordTextField: CustomTextField = {
        let textField = CustomTextField()
        textField.configure(placeholder: "Confirm new password",
                            keyboardType: .default,
                            icon: UIImage(systemName: "lock.fill"),
                            isSecure: true)
        textField.heightAnchor.constraint(equalToConstant: 46).isActive = true
        return textField
    }()
    
    let saveButton = PrimaryButtonComponent(text: "Save Password")
    
    // MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    // MARK: - Private methods
    private func setup() {
        setupBackground()
        setNavigationTitle()
        setConstraints()
        saveButtonPressed()
    }
    
    private func setupBackground() {
        view.backgroundColor = .systemBackground
    }
    
    private func setNavigationTitle() {
        navigationItem.title = "Update your password"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setConstraints() {
        view.addSubview(mainStackView)
        mainStackView.addArrangedSubview(passwordTextField)
        mainStackView.addArrangedSubview(confirmPasswordTextField)
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
            
            let newPassword = self.passwordTextField.text
            let confirmPassword = self.confirmPasswordTextField.text
            
            if newPassword?.count ?? 0 < 8 {
                self.showLengthAlert()
            } else if newPassword == confirmPassword {
                self.viewModel.updatePassword(newPassword: newPassword ?? "Test12345") { success in
                    if success {
                        self.showSuccessAlert()
                    } else {
                        self.showErrorAlert()
                    }
                }
            } else {
                self.showMismatchAlert()
            }
        }), for: .touchUpInside)
    }
    
    
    private func showSuccessAlert() {
        let alert = UIAlertController(title: "Password Updated Successfully", message: "Congratulations! Your password has been successfully updated. You can now use your new password to access your account.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    private func showErrorAlert() {
        let alert = UIAlertController(title: "Failed to Update Password", message: "We're sorry, but we encountered an error while trying to update your password. Please try again later or contact support for assistance.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    private func showMismatchAlert() {
        let alert = UIAlertController(title: "Passwords Do Not Match", message: "Oops! It seems the passwords you entered do not match. Please double-check your entries and try again. Remember that passwords are case-sensitive.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    private func showLengthAlert() {
        let alert = UIAlertController(title: "Password Too Short", message: "Your password must be at least 8 characters long. Please try again.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
