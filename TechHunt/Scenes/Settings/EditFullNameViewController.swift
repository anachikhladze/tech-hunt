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
        textField.configure(placeholder: "Full Name",
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
                print("DEBUG: Text field is empty.")
                return
            }
            Task {
                do {
                    try await self.viewModel.updateFullName(newFullName: newFullName)
                    print("DEBUG: Full name updated successfully.")
                } catch {
                    print("DEBUG: Failed to update full name with error: \(error.localizedDescription)")
                }
            }
            self.dismiss(animated: true, completion: nil)
        }), for: .touchUpInside)
    }
}


