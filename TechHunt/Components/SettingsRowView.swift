//
//  SettingsRowView.swift
//  TechHunt
//
//  Created by Anna Sumire on 27.01.24.
//

import SwiftUI

struct SettingsRowView: View {
    
    // MARK: - Properties
    let imageName: String
    let title: String
    let tintColor: Color
    
    // MARK: - Body
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: imageName)
                .imageScale(.small)
                .font(.title)
                .frame(width: 25, alignment: .leading)
                .foregroundStyle(tintColor)
            
            Text(title)
                .font(.subheadline)
                .foregroundStyle(.primary)
        }
    }
}

// MARK: - Preview
struct SettingsRowView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsRowView(imageName: "gear", title: "Version", tintColor: Color(.systemGray))
    }
}

