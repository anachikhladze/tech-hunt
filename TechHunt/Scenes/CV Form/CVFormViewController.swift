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
    
    // MARK: - Properties
    weak var delegate: CVFormViewControllerDelegate?
    
    let fullNameField = CustomTextField()
    let schoolField = CustomTextField()
    let experienceField1 = CustomTextField()
    let experienceField2 = CustomTextField()
    let experienceField3 = CustomTextField()
    let languagesField = CustomTextField()
    let contactNumberField = CustomTextField()
    let emailField = CustomTextField()
    let linkedInField = CustomTextField()
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
    
    var currentFullName: String?
    var currentSchool: String?
    var currentExperience1: String?
    var currentExperience2: String?
    var currentExperience3: String?
    var currentLanguages: String?
    var currentContactNumber: String?
    var currentEmail: String?
    var currentLinkedIn: String?
    
    // MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviews()
        configureStackView()
        setStackViewConstraints()
        setBackgroundColor()
        setNavigationTitle()
        configureTextFields()
        configureSaveButton()
        setLabelsWithCurrentInfo()
    }
    
    // MARK: - Private Methods
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
        
        fullNameField.configure(placeholder: "Full Name", keyboardType: .default, icon: UIImage(systemName: "person.fill"), isSecure: false)
        schoolField.configure(placeholder: "School/University", keyboardType: .default, icon: UIImage(systemName: "graduationcap.fill"), isSecure: false)
        experienceField1.configure(placeholder: "Full Name", keyboardType: .default, icon: UIImage(systemName: "briefcase.fill"), isSecure: false)
        experienceField2.configure(placeholder: "Experience 1", keyboardType: .default, icon: UIImage(systemName: "briefcase.fill"), isSecure: false)
        experienceField3.configure(placeholder: "Experience 2", keyboardType: .default, icon: UIImage(systemName: "briefcase.fill"), isSecure: false)
        languagesField.configure(placeholder: "Experience 3", keyboardType: .default, icon: UIImage(systemName: "globe"), isSecure: false)
        contactNumberField.configure(placeholder: "Languages", keyboardType: .default, icon: UIImage(systemName: "phone.fill"), isSecure: false)
        emailField.configure(placeholder: "Email Address", keyboardType: .default, icon: UIImage(systemName: "envelope.fill"), isSecure: false)
        linkedInField.configure(placeholder: "LinkedIn Profile", keyboardType: .default, icon: UIImage(systemName: "rectangle.stack.fill.badge.person.crop"), isSecure: false)
        
        for field in fields {
            stackView.addArrangedSubview(field)
        }
    }
    
    private func configureSaveButton() {
        saveButton.setTitle("Save Info", for: .normal)
        saveButton.setTitleColor(.white, for: .normal)
        saveButton.titleLabel?.font = UIFont.customRoundedFont(size: 18, weight: .black)
        saveButton.backgroundColor = UIColor.accent
        saveButton.layer.cornerRadius = 14
        saveButton.heightAnchor.constraint(equalToConstant: 46).isActive = true
        saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        stackView.addArrangedSubview(saveButton)
    }
    
    private func setLabelsWithCurrentInfo() {
        fullNameField.text = currentFullName
        schoolField.text = currentSchool
        experienceField1.text = currentExperience1
        experienceField2.text = currentExperience2
        experienceField3.text = currentExperience3
        languagesField.text = currentLanguages
        contactNumberField.text = currentContactNumber
        emailField.text = currentEmail
        linkedInField.text = currentLinkedIn
    }
    
    @objc func saveButtonTapped() {
        delegate?.didSaveInfo(fullName: fullName, school: school, experience1: experience1, experience2: experience2, experience3: experience3, language: languages, number: contactNumber, email: email, linkedin: linkedIn)
        
        self.dismiss(animated: true, completion: nil)
    }
}
