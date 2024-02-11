//
//  View.swift
//  TechHunt
//
//  Created by Anna Sumire on 06.02.24.
//

import SwiftUI

extension View {
    
    func roundedIconButton(icon: String, action: @escaping () -> Void, size: CGFloat = 10) -> some View {
        Button(action: action) {
            Image(systemName: icon)
                .foregroundColor(.white)
                .padding(size)
                .background(Circle().fill(Color.gray.opacity(0.3)))
        }
    }
    
    func roundedIcon(icon: String, size: CGFloat = 10) -> some View {
        Image(systemName: icon)
            .foregroundColor(.white)
            .padding(size)
            .background(Circle().fill(Color.gray.opacity(0.3)))
    }
    
    func customLightFont() -> some View {
        self.font(.system(size: 17, weight: .light, design: .rounded))
    }
    
    func customBlackFont() -> some View {
        self.font(.system(size: 17, weight: .black, design: .rounded))
    }
    
    func customTitleFont() -> some View {
        self.font(.system(size: 28, weight: .black, design: .rounded))
    }
    
    func referralStyle() -> some View {
        self
            .padding()
            .fixedSize(horizontal: false, vertical: true)
            .background(LinearGradient(gradient: Gradient(colors: [Color.purple, Color.accent]), startPoint: .topTrailing, endPoint: .bottomTrailing))
            .opacity(0.8)
            .clipShape(RoundedRectangle(cornerRadius: 16))
    }
    
    func actionButtonStyle() -> some View {
        self
            .frame(maxWidth: 400)
            .padding(.horizontal)
            .opacity(0.8)
            .background(Color.accent)
            .clipShape(RoundedRectangle(cornerRadius: 16))
    }
    
    func buttonFont() -> some View {
        self.font(.system(size: 17, weight: .black, design: .rounded))
    }
}

