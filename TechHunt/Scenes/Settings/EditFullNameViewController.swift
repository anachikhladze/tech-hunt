//
//  EditFullNameViewController.swift
//  TechHunt
//
//  Created by Anna Sumire on 24.03.24.
//

import UIKit

final class EditFullNameViewController: UIViewController {
    
    private let viewModel = AuthViewModel()
    
    let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let customTextField: CustomTextField = {
        let textField = CustomTextField()
        textField.configure(placeholder: "Update your name",
                            keyboardType: .default,
                            icon: UIImage(systemName: "person.fill"),
                            isSecure: false)
        textField.heightAnchor.constraint(equalToConstant: 46).isActive = true
        return textField
    }()
    
    let saveButton = MainButtonComponent(text: "Save Name")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setConstraints()
        saveButtonAction()
        
        Task {
          await viewModel.fetchUser()
            customTextField.text = viewModel.currentUser?.fullname
        }
        
        navigationItem.title = "Update your name"
        navigationController?.navigationBar.prefersLargeTitles = true
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
    
    private func saveButtonAction() {
        saveButton.addAction(UIAction(handler: { [weak self] _ in
            guard let self = self else { return }
            guard let newFullName = self.customTextField.text, !newFullName.isEmpty else {
                return
            }
            Task {
                do {
                    try await self.viewModel.updateFullName(newFullName: newFullName)
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
