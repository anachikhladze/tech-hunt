//
//  MainButtonComponent.swift
//  TechHunt
//
//  Created by Anna Sumire on 20.03.24.
//

import UIKit

final class PrimaryButtonComponent: UIButton {
    // MARK: - Init
    init(text: String) {
        super.init(frame: .zero)
        
        setTitle(text, for: .normal)
        titleLabel?.font = .customRoundedFont(size: 18, weight: .black)
        setTitleColor(.white, for: .normal)
        backgroundColor = .accent
        heightAnchor.constraint(equalToConstant: 46).isActive = true
        layer.cornerRadius = 24
        clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
