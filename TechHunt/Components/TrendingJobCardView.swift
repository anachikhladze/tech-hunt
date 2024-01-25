//
//  TrendingJobCardView.swift
//  TechHunt
//
//  Created by Anna Sumire on 25.01.24.
//

import SwiftUI

struct TrendingJobCardView: View {
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(LinearGradient(gradient: Gradient(colors: [Color.purple, Color.buttonBackground]), startPoint: .topTrailing, endPoint: .bottomTrailing))
                .opacity(0.8)
            
            VStack {
                HStack {
                    Image("Design")
                        .resizable()
                        .frame(maxWidth: 200, maxHeight: 180)
                        .scaledToFit()
                    
                    VStack {
                        Text("iOS Developer")
                        Text("Spotify")
                        
                      CustomButton(buttonText: "Apply Now")
                    }
                    .font(.system(size: 22, weight: .light, design: .rounded))
                    .padding()
                }
                
            }
        }
        .frame(maxWidth: .infinity, maxHeight: 200)
        .cornerRadius(26)
        .padding(.horizontal)
    }
}
