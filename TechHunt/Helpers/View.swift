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
}

