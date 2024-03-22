//
//  CustomTextField.swift
//  TechHunt
//
//  Created by Anna Sumire on 22.03.24.
//

import UIKit

final class CustomTextField: UITextField {
    // MARK: - Properties
    private let paddingWidth: CGFloat = 44
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .center
        imageView.tintColor = .customSecondaryColor
        return imageView
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTextField()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupTextField()
    }
    
    // MARK: - Setup
    private func setupTextField() {
        textColor = .customSecondaryColor.withAlphaComponent(0.6)
        font = UIFont.systemFont(ofSize: 16)
        backgroundColor = .clear
        layer.borderColor = UIColor.customSecondaryColor.cgColor
        layer.borderWidth = 1.0
        layer.cornerRadius = 10
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: paddingWidth, height: bounds.height))
        leftView = paddingView
        leftViewMode = .always
        
        addSubview(iconImageView)
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconImageView.widthAnchor.constraint(equalToConstant: 24),
            iconImageView.heightAnchor.constraint(equalToConstant: 24)
        ])
        
        tintColor = .customSecondaryColor
    }
    
    // MARK: - Configure
    func configure(placeholder: String?, keyboardType: UIKeyboardType, icon: UIImage?, isSecure: Bool) {
        attributedPlaceholder = NSAttributedString(
            string: placeholder ?? "",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.customSecondaryColor.withAlphaComponent(0.6)]
        )
        self.keyboardType = keyboardType
        iconImageView.image = icon
        isSecureTextEntry = isSecure
    }
}
