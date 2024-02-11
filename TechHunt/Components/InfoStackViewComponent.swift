//
//  ExperienceInfoStackView.swift
//  TechHunt
//
//  Created by Anna Sumire on 31.01.24.
//

import UIKit

final class InfoStackViewComponent: UIStackView {
    
    private let gradientLayer = CAGradientLayer()
    
    init(title: String, items: [UILabel], symbolName: String) {
        super.init(frame: .zero)
        
        axis = .vertical
        spacing = 8
        isLayoutMarginsRelativeArrangement = true
        layoutMargins = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        layer.cornerRadius = 8
        
        gradientLayer.colors = [UIColor.purple.cgColor, UIColor.accent.cgColor]
        gradientLayer.startPoint = CGPoint(x: 1, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0, y: 1)
        gradientLayer.opacity = 0.7
        gradientLayer.cornerRadius = 14
        layer.insertSublayer(gradientLayer, at: 0)
        
        setup(title: title, items: items, symbolName: symbolName)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }
    
    private func setup(title: String, items: [UILabel], symbolName: String) {
        let titleLabel = UILabel()
        let symbolConfig = UIImage.SymbolConfiguration(pointSize: 20, weight: .medium)
        let image = UIImage(systemName: symbolName, withConfiguration: symbolConfig)
        let attachment = NSTextAttachment()
        attachment.image = image
        let attributedString = NSMutableAttributedString(attachment: attachment)
        attributedString.append(NSAttributedString(string: " \(title)"))
        titleLabel.attributedText = attributedString
        titleLabel.textColor = .black
        titleLabel.font = UIFont.customRoundedFont(size: 18, weight: .medium)
        titleLabel.textAlignment = .left
        addArrangedSubview(titleLabel)
        
        for item in items {
            var itemLabel = UILabel()
            itemLabel = item
            itemLabel.numberOfLines = 0
            itemLabel.textColor = .black
            itemLabel.textAlignment = .left
            itemLabel.font = UIFont.customRoundedFont(size: 16, weight: .light)
            addArrangedSubview(itemLabel)
        }
    }
}
