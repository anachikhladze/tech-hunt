//
//  CVFormViewController.swift
//  TechHunt
//
//  Created by Anna Sumire on 01.02.24.
//

import UIKit

protocol CVFormViewControllerDelegate: AnyObject {
    func didSaveInfo(fullName: String, school: String, experience1: String, experience2: String, experience3: String,
                     language: String, number: String, email: String, linkedin: String)
}

final class CVFormViewController: UIViewController {
    
    weak var delegate: CVFormViewControllerDelegate?
    
    let fullNameField = UITextField()
    let schoolField = UITextField()
    let experienceField1 = UITextField()
    let experienceField2 = UITextField()
    let experienceField3 = UITextField()
    let languagesField = UITextField()
    let contactNumberField = UITextField()
    let emailField = UITextField()
    let linkedInField = UITextField()
    let saveButton = UIButton(type: .system)
    let stackView = UIStackView()
    
    var fullName: String { return fullNameField.text ?? "" }
    var school: String { return schoolField.text ?? "" }
    var experience1: String { return experienceField1.text ?? "" }
    var experience2: String { return experienceField2.text ?? "" }
    var experience3: String { return experienceField3.text ?? "" }
    var languages: String { return languagesField.text ?? "" }
    var contactNumber: String { return contactNumberField.text ?? "" }
    var email: String { return emailField.text ?? "" }
    var linkedIn: String { return linkedInField.text ?? "" }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviews()
        configureStackView()
        setStackViewConstraints()
        setBackgroundColor()
        setNavigationTitle()
        configureTextFields()
        configureSaveButton()
    }
    
    private func addSubviews() {
        view.addSubview(stackView)
    }
    
    private func configureStackView() {
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setStackViewConstraints() {
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
        ])
    }
    
    private func setBackgroundColor() {
        view.backgroundColor = .systemBackground
    }
    
    private func setNavigationTitle() {
        navigationItem.title = "Create your CV"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
    }
    
    private func configureTextFields() {
        let fields = [fullNameField, schoolField, experienceField1, experienceField2, experienceField3, languagesField, contactNumberField, emailField, linkedInField]
        let placeholders = ["Full Name", "School/University", "Experience 1", "Experience 2", "Experience 3", "Languages", "Contact Number", "Email Address", "LinkedIn Profile"]
        
        for (field, placeholder) in zip(fields, placeholders) {
            field.borderStyle = .roundedRect
            field.placeholder = placeholder
            field.textColor = UIColor.label
            field.backgroundColor = UIColor.systemBackground
            stackView.addArrangedSubview(field)
        }
    }
    
    private func configureSaveButton() {
        saveButton.setTitle("Save Info", for: .normal)
        saveButton.setTitleColor(.white, for: .normal)
        saveButton.titleLabel?.font = UIFont.customRoundedFont(size: 18, weight: .black)
        saveButton.backgroundColor = UIColor.buttonBackground
        saveButton.layer.cornerRadius = 14
        saveButton.heightAnchor.constraint(equalToConstant: 46).isActive = true
        saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        stackView.addArrangedSubview(saveButton)
    }
    
    @objc func saveButtonTapped() {
        delegate?.didSaveInfo(fullName: fullName, school: school, experience1: experience1, experience2: experience2, experience3: experience3, language: languages, number: contactNumber, email: email, linkedin: linkedIn)
    }
}
