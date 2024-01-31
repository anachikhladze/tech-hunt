//
//  FormViewController.swift
//  TechHunt
//
//  Created by Anna Sumire on 29.01.24.
//

import UIKit

class FormViewController: UIViewController {
    
    private lazy var formContentBuilder = FormContentBuilder()
    private lazy var FormCompLayout = FormCompositionalLayout()
    private lazy var dataSource = makeDataSource()
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: FormCompLayout.layout)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        //        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: UICollectionViewCell.cellId)
        //        collectionView.register(FormButtonCollectionViewCell.self, forCellWithReuseIdentifier: UICollectionViewCell.cellId)
        //        collectionView.register(FormTextCollectionViewCell.self, forCellWithReuseIdentifier: UICollectionViewCell.cellId)
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "DefaultCell")
        collectionView.register(FormButtonCollectionViewCell.self, forCellWithReuseIdentifier: "ButtonCell")
        collectionView.register(FormTextCollectionViewCell.self, forCellWithReuseIdentifier: "TextCell")
        
        return collectionView
    }()
    
    
    override func loadView() {
        super.loadView()
        setup()
        updateDataSource()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

private extension FormViewController {
    
    func setup() {
        view.backgroundColor = .white
        
        collectionView.dataSource = dataSource
        
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    func makeDataSource() -> UICollectionViewDiffableDataSource<FormSectionComponent, FormComponent> {
        return UICollectionViewDiffableDataSource(collectionView: collectionView) { collectionView, indexPath, item in
            
            switch item {
            case is TextFormComponent:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TextCell", for: indexPath) as! FormTextCollectionViewCell
                cell.bind(item)
                return cell
                
            case is ButtonFormComponent:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ButtonCell", for: indexPath) as! FormButtonCollectionViewCell
                cell.bind(item)
                return cell
                
            default:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DefaultCell", for: indexPath)
                return cell
            }
        }
    }

    func updateDataSource (animated: Bool = false) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            
            var snapshot = NSDiffableDataSourceSnapshot<FormSectionComponent, FormComponent>()
            
            let formSections = self.formContentBuilder.content
            snapshot.appendSections(formSections)
            formSections.forEach { snapshot.appendItems($0.items, toSection: $0) }
            
            self.dataSource.apply(snapshot, animatingDifferences: animated)
        }
    }
}
