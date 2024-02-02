//
//  CustomButton.swift
//  TechHunt
//
//  Created by Anna Sumire on 25.01.24.
//

import SwiftUI

struct CustomButton: View {
    var buttonText: String
    var action: () -> Void

    var body: some View {
        Button(action: {
            action()
        }) {
            Text(buttonText)
                .font(.system(size: 16, weight: .black, design: .rounded))
                .padding()
                .frame(maxHeight: 48)
                .background(Color.buttonBackground)
                .foregroundColor(.white)
                .cornerRadius(8)
        }
    }
}

//#Preview {
//    CustomButton(buttonText: "Test")
//}
