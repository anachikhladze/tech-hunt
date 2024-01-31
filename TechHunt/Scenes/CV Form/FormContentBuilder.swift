//
//  FormContentBuilder.swift
//  TechHunt
//
//  Created by Anna Sumire on 29.01.24.
//

import Foundation

final class FormContentBuilder {
    
    var content: [FormSectionComponent] {
        return [
            
            FormSectionComponent (items: [
                TextFormComponent (placeholder: "Full Name"),
                TextFormComponent (placeholder: "Experience 1"),
                TextFormComponent (placeholder: "Experience 2"),
                TextFormComponent (placeholder: "Experience 3"),
                TextFormComponent (placeholder: "Languages"),
                TextFormComponent (placeholder: "Test"),
                TextFormComponent (placeholder: "Email", keyboardType: .emailAddress),
                TextFormComponent (placeholder: "LinkedIn Profile"),
                ButtonFormComponent (title: "Save")
            ])
        ]
    }
}
