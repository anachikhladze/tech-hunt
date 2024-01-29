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
                TextFormComponent (placeholder: "First Name"),
                TextFormComponent (placeholder: "Last Name"),
                TextFormComponent (placeholder: "Email", keyboardType: .emailAddress),
                ButtonComponent (title: "Confirm")
            ])
        ]
    }
}
