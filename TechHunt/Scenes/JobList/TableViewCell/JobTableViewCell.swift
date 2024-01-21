//
//  JobTableViewCell.swift
//  TechHunt
//
//  Created by Anna Sumire on 20.01.24.
//

import UIKit

final class JobTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 4
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = .init(top: 8, left: 16, bottom: 8, right: 16)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let infoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 2
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = .init(top: 8, left: 16, bottom: 8, right: 16)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    
    private let jobImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Helvetica-bold", size: 16)
        label.textColor = .black
        return label
    }()
    
    private let companyLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Helvetica-bold", size: 14)
        label.textColor = .secondaryLabel
        return label
    }()
    
    private let typeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Helvetica-bold", size: 14)
        label.textColor = .secondaryLabel
        return label
    }()
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        addSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - PrepareForReuse
    override func prepareForReuse() {
        super.prepareForReuse()
        
        jobImageView.image = nil
        titleLabel.text = nil
        companyLabel.text = nil
        typeLabel.text = nil
    }
    
    // MARK: - Configure
    func configure(with job: Job) {
        // image, description...
        titleLabel.text = job.title
        companyLabel.text = job.company
        typeLabel.text = job.type
        //        if job.category == "Development" {
        //            jobImageView.image = UIImage(named: "vacancy")
        //        }
        jobImageView.image = UIImage(named: "vacancy")
    }
    
    // MARK: - Private Methods
    
    private func addSubviews() {
        addSubview(mainStackView)
        mainStackView.addArrangedSubview(jobImageView)
        mainStackView.addArrangedSubview(infoStackView)
        infoStackView.addArrangedSubview(titleLabel)
        infoStackView.addArrangedSubview(companyLabel)
        infoStackView.addArrangedSubview(typeLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: self.topAnchor),
            mainStackView.leftAnchor.constraint(equalTo: self.leftAnchor),
            mainStackView.rightAnchor.constraint(equalTo: self.rightAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            jobImageView.widthAnchor.constraint(equalToConstant: 80),
            jobImageView.heightAnchor.constraint(equalToConstant: 80),
            
            infoStackView.topAnchor.constraint(equalTo: mainStackView.topAnchor),
            infoStackView.leftAnchor.constraint(equalTo: jobImageView.rightAnchor, constant: 0),
            infoStackView.rightAnchor.constraint(equalTo: mainStackView.rightAnchor),
            infoStackView.bottomAnchor.constraint(equalTo: mainStackView.bottomAnchor)
        ])
    }
}
