//
//  ExperienceInfoStackView.swift
//  TechHunt
//
//  Created by Anna Sumire on 31.01.24.
//

import UIKit

final class ExperienceInfoStackView: UIStackView {
    
    init(title: String, items: [String], symbolName: String) {
        super.init(frame: .zero)
        
        axis = .vertical
        backgroundColor = .systemBlue
        spacing = 8
        isLayoutMarginsRelativeArrangement = true
        layoutMargins = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        layer.cornerRadius = 8
        
        setup(title: title, items: items, symbolName: symbolName)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup(title: String, items: [String], symbolName: String) {
        let titleLabel = UILabel()
        let symbolConfig = UIImage.SymbolConfiguration(pointSize: 20, weight: .medium)
        let image = UIImage(systemName: symbolName, withConfiguration: symbolConfig)
        let attachment = NSTextAttachment()
        attachment.image = image
        let attributedString = NSMutableAttributedString(attachment: attachment)
        attributedString.append(NSAttributedString(string: " \(title)"))
        titleLabel.attributedText = attributedString
        titleLabel.textColor = .black
        titleLabel.font = UIFont(name: "Helvetica-Bold", size: 18)
        titleLabel.textAlignment = .left
        addArrangedSubview(titleLabel)
        
        for item in items {
            let itemLabel = UILabel()
            itemLabel.text = item
            itemLabel.numberOfLines = 0
            itemLabel.textColor = .black
            itemLabel.textAlignment = .left
            itemLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
            addArrangedSubview(itemLabel)
        }
    }
}
