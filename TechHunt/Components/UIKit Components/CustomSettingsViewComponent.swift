//
//  CustomSettingsViewComponent.swift
//  TechHunt
//
//  Created by Anna Sumire on 23.03.24.
//

import UIKit

final class CustomSettingsViewComponent: UIView {
    
    // MARK: - Properties
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Title"
        label.font = .customRoundedFont(size: 18, weight: .bold)
        return label
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .customRoundedFont(size: 18, weight: .light)
        return label
    }()
    
    private let lineView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray
        view.alpha = 0.3
        return view
    }()
    
    private var editButton: UIButton? = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "square.and.pencil"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let stackView = UIStackView(arrangedSubviews: [titleLabel, nameLabel])
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)
        
        addSubview(lineView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            lineView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            lineView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            lineView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 24),
            lineView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configure
    func configure(with title: String, with name: String, showEditButton: Bool, buttonAction: (() -> Void)? = nil) {
        self.titleLabel.text = title
        self.nameLabel.text = name
        
        if showEditButton {
            guard let editButton = self.editButton else { return }
            addSubview(editButton)
            
            editButton.removeTarget(nil, action: nil, for: .allEvents)
            
            if let action = buttonAction {
                editButton.addTarget(for: .touchUpInside, action: action)
            }
            
            NSLayoutConstraint.activate([
                editButton.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor, constant: -8),
                editButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            ])
        } else {
            editButton?.removeFromSuperview()
            editButton = nil
        }
    }
}
