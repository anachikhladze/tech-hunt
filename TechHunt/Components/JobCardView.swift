//
//  JobCardView.swift
//  TechHunt
//
//  Created by Anna Sumire on 25.01.24.
//

import SwiftUI

struct JobCardView: View {
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(LinearGradient(gradient: Gradient(colors: [Color.purple, Color.buttonBackground]), startPoint: .topTrailing, endPoint: .bottomTrailing))
                .opacity(0.8)
            
            VStack(spacing: 0) {
                Text("Welcome to TechHunt! Explore top tech jobs, keep up with trends, and craft your CV for free. Apply with a tap, let companies discover you, and refer friends for our New Year’s giveaway. Don’t forget to save your favorite jobs. Enjoy your job hunt!")
                    .font(.system(size: 18, weight: .light, design: .rounded))
                    .padding()
                
                HStack {
                  CustomButton(buttonText: "Read More")
                    CustomButton(buttonText: "Create CV")
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: 230)
        .cornerRadius(26)
        .padding(.horizontal)
    }
}
