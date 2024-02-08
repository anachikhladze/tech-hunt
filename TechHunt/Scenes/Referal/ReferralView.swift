//
//  ReferalView.swift
//  TechHunt
//
//  Created by Anna Sumire on 06.02.24.
//

import SwiftUI

struct ReferralView: View {
    
    private let code = "123cygeuyvgeryj4"

    // MARK: - Body
    var body: some View {
        referralImage
        VStack {
            detailsVStack
            actionButtons
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 10)
        .background(LinearGradient(gradient: Gradient(colors: [Color.purple, Color.buttonBackground]), startPoint: .topTrailing, endPoint: .bottomTrailing))
        .opacity(0.8)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        
        Spacer()
    }
    
    // MARK: - Computed Properties
    private var referralImage: some View {
        Image("refer")
            .resizable()
            .scaledToFit()
            .padding(.horizontal)
    }
    
    private var detailsVStack: some View {
        VStack(alignment: .leading, spacing: 3) {
            Text("Refer a Friend")
                .font(.system(size: 26, weight: .black, design: .rounded))
                .padding(.bottom, 10)
                .foregroundStyle(.black)
            
            Text("Know someone perfect for a job? Refer them through the app and you could be part of our New Year’s Eve giveaway. Sharing is caring (and rewarding)!")
                .font(.system(size: 20, weight: .light, design: .rounded))
                .padding(.bottom, 10)
                .foregroundStyle(.black)
        }
    }
    
    private var actionButtons: some View {
        VStack(spacing: 10) {
            Text("Code: \(code)")
                .font(.system(size: 20, weight: .light, design: .rounded))
                .padding(.bottom, 10)
                .foregroundStyle(.black)
                .textSelection(.enabled)
            
            HStack {
                roundedIconButton(icon: "doc.on.doc") {
                    UIPasteboard.general.string = code
                }
                ShareLink(item: code) {
                    roundedIcon(icon: "square.and.arrow.up")
                }
            }
        }
    }
    
}

#Preview {
    ReferralView()
}


