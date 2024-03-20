//
//  UIFont+CustomRoundedFont.swift
//  TechHunt
//
//  Created by Anna Sumire on 31.01.24.
//

import Foundation

import UIKit

extension UIFont {
    static func customRoundedFont(size: CGFloat, weight: UIFont.Weight) -> UIFont {
        if let descriptor = UIFont.systemFont(ofSize: size, weight: weight).fontDescriptor.withDesign(.rounded) {
            return UIFont(descriptor: descriptor, size: size)
        } else {
            return UIFont.systemFont(ofSize: size, weight: weight)
        }
    }
}
