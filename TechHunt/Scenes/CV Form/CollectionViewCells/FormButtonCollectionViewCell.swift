//
//  FormButtonCollectionViewCell.swift
//  TechHunt
//
//  Created by Anna Sumire on 29.01.24.
//

import UIKit

final class FormButtonCollectionViewCell: UICollectionViewCell {
    
    private lazy var actionButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .buttonBackground
        button.layer.cornerRadius = 6
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        return button
    }()
    
    func bind(_ item: FormComponent) {
        
        guard let item = item as? ButtonFormComponent else { return }
        setup(item: item)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        removeViews()
    }
}

private extension FormButtonCollectionViewCell {
    
    func setup(item: ButtonFormComponent) {
        actionButton.setTitle(item.title, for: .normal)
        
        contentView.addSubview(actionButton)
        
        NSLayoutConstraint.activate([
            actionButton.heightAnchor.constraint(equalToConstant: 44),
            actionButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            actionButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            actionButton.topAnchor.constraint(equalTo: contentView.topAnchor),
            actionButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
