//
//  InputView.swift
//  TechHunt
//
//  Created by Anna Sumire on 04.02.24.
//

import SwiftUI
 
struct InputView: View {
    
    // MARK: - Properties
    @Binding var text: String
    let title: String
    let placeholder: String
    var isSecureField = false
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .foregroundColor(.gray)
                .fontWeight(.semibold)
                .font(.footnote)
            
            if isSecureField {
                SecureField("", text: $text, prompt: Text(placeholder)
                    .foregroundColor(.gray))
                    .font(.system(size: 14))
            } else {
                TextField("", text: $text, prompt: Text(placeholder)
                    .foregroundColor(.gray)
                )
                    .font(.system(size: 14))
            }
            Divider()
        }
    }
}
 
// MARK: - Preview
#Preview {
    InputView(text: .constant(""), title: "Email Address", placeholder: "name@example.com")
}

