//
//  CustomSignInButton.swift
//  TechHunt
//
//  Created by Anna Sumire on 04.02.24.
//

import SwiftUI

struct CustomSignInButton: View {
    
    // MARK: - Properties
    var label: String
    var action: () async throws -> Void
    
    // MARK: - Body
    var body: some View {
        Button {
            Task {
                try await action()
            }
        } label: {
            HStack {
                Text(label)
                    .fontWeight(.semibold)
                Image(systemName: "arrow.right")
            }
            .foregroundStyle(.white)
            .frame(width: UIScreen.main.bounds.width - 32, height: 48)
        }
        .background(Color.buttonBackground)
        .cornerRadius(10)
        .padding(.top, 24)
    }
}
