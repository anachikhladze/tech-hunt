//
//  FormModel.swift
//  TechHunt
//
//  Created by Anna Sumire on 29.01.24.
//

import Foundation
import UIKit

protocol FormItem {
    var id: UUID { get }
}

protocol FormSectionItem {
    var id: UUID { get }
    var items: [FormComponent] { get }
    init(items: [FormComponent])
}


// MARK: - Section Component
final class FormSectionComponent: FormSectionItem, Hashable {
    
    var id: UUID = UUID()
    var items: [FormComponent]
    
    init(items: [FormComponent]) {
        self.items = items
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: FormSectionComponent, rhs: FormSectionComponent) -> Bool {
        lhs.id == rhs.id
    }
    
}

// MARK: - Form Component
class FormComponent: FormItem, Hashable {
    
    var id: UUID = UUID()
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: FormComponent, rhs: FormComponent) -> Bool {
        lhs.id == rhs.id
    }
}

// MARK: - Text Component
final class TextFormComponent: FormComponent {
    
    let placeholder: String
    let keyboardType: UIKeyboardType
    
    init(placeholder: String,
         keyboardType: UIKeyboardType = .default) {
        self.placeholder = placeholder
        self.keyboardType = keyboardType
    }
}

// MARK: - Button Component
final class ButtonFormComponent: FormComponent {
    
    let title: String
    
    init(title: String) {
        self.title = title
    }
}
