//
//  UICollectionView+Identifier.swift
//  TechHunt
//
//  Created by Anna Sumire on 29.01.24.
//

import Foundation
import UIKit

extension UICollectionViewCell {
    
    static var cellId: String {
        String(describing: self)
    }
}
