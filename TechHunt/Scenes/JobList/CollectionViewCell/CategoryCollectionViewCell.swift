//
//  CategoryCollectionViewCell.swift
//  TechHunt
//
//  Created by Anna Sumire on 20.03.24.
//

import UIKit

final class CategoryCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    static let identifier = "categoryCell"
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .center
        label.font = .customRoundedFont(size: 16, weight: .medium)
        return label
    }()
    
    override var isSelected: Bool {
        didSet {
            contentView.backgroundColor = isSelected ? .accent : .systemGray5
        }
    }
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(titleLabel)
        contentView.backgroundColor = .systemGray5
        contentView.layer.cornerRadius = 26
        contentView.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        titleLabel.frame = contentView.bounds.insetBy(dx: 10, dy: 5)
    }
    
    // MARK: - Configure
    func configure(with title: String) {
        titleLabel.text = title
    }
}
