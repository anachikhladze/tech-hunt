//
//  FormCompositionalLayout.swift
//  TechHunt
//
//  Created by Anna Sumire on 29.01.24.
//

import UIKit

final class FormCompositionalLayout {
    
    var layout: UICollectionViewCompositionalLayout {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .estimated(44))
        
        let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
        layoutItem.edgeSpacing = NSCollectionLayoutEdgeSpacing(leading: nil,
                                                               top: .fixed(16),
                                                               trailing: nil,
                                                               bottom: .fixed(16))
        // Group
        let layoutGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                     heightDimension: .estimated(44))
        let layoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: layoutGroupSize,
                                                           subitems: [layoutItem])
        layoutGroup.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16)
        
        // Section
        let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
        layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 150, leading: 0, bottom: 0, trailing: 0)
        
        let compLayout = UICollectionViewCompositionalLayout(section: layoutSection)
        return compLayout
    }
}


