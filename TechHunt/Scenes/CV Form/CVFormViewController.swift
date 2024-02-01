//
//  CVFormViewController.swift
//  TechHunt
//
//  Created by Anna Sumire on 01.02.24.
//

import UIKit

protocol CVFormViewControllerDelegate: AnyObject {
    func didSaveInfo(fullName: String, school: String, experience: String)
}

class CVFormViewController: UIViewController {
    
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
        
        navigationItem.title = "Create your CV"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        
        view.backgroundColor = .white
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        
        let fields = [fullNameField, schoolField, experienceField1, experienceField2, experienceField3, languagesField, contactNumberField, emailField, linkedInField]
        let placeholders = ["Full Name", "School/University", "Experience 1", "Experience 2", "Experience 3", "Languages", "Contact Number", "Email Address", "LinkedIn Profile"]
        
        for (field, placeholder) in zip(fields, placeholders) {
            field.borderStyle = .roundedRect
            field.placeholder = placeholder
            stackView.addArrangedSubview(field)
        }
        
        saveButton.setTitle("Save Info", for: .normal)
        saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        stackView.addArrangedSubview(saveButton)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
        ])
    }
    
    @objc func saveButtonTapped() {
        delegate?.didSaveInfo(fullName: fullName, school: school, experience: experience1)
    }
}
