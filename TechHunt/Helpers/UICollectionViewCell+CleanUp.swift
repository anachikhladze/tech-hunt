//
//  UICollectionViewCell+CleanUp.swift
//  TechHunt
//
//  Created by Anna Sumire on 29.01.24.
//

import UIKit

extension UICollectionViewCell {
    
    func removeViews() {
        contentView.subviews.forEach { $0.removeFromSuperview() }
    }
}
