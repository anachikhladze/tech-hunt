//
//  FormTextCollectionViewCell.swift
//  TechHunt
//
//  Created by Anna Sumire on 29.01.24.
//

import UIKit

final class FormTextCollectionViewCell: UICollectionViewCell {
    
    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = 8
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.systemGray5.cgColor
        return textField
    }()
    
    func bind(_ item: FormComponent) {
        
        guard let item = item as? TextFormComponent else { return }
        setup(item: item)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        removeViews()
    }
}

private extension FormTextCollectionViewCell {
    func setup(item: TextFormComponent) {
        textField.placeholder = "\(item.placeholder)"
        textField.keyboardType = item.keyboardType
        
        contentView.addSubview(textField)
        
        NSLayoutConstraint.activate([
            textField.heightAnchor.constraint(equalToConstant: 44),
            textField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            textField.topAnchor.constraint(equalTo: contentView.topAnchor),
            textField.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
