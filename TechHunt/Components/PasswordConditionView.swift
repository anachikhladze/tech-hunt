//
//  PasswordConditionView.swift
//  TechHunt
//
//  Created by Anna Sumire on 04.02.24.
//

import SwiftUI

struct PasswordConditionView: View {
    
    // MARK: - Properties
    let condition: Bool
    let text: String
    
    // MARK: - Body
    var body: some View {
        HStack {
            Image(systemName: condition ? "checkmark.circle.fill" : "x.circle")
                .foregroundStyle(.accent)
            Text(text)
        }
    }
}

// MARK: - Preview
#Preview {
    PasswordConditionView(condition: false, text: "Test")
}
