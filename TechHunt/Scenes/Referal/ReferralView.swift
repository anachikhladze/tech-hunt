//
//  ReferalView.swift
//  TechHunt
//
//  Created by Anna Sumire on 06.02.24.
//

import SwiftUI

struct ReferralView: View {
    
    private let code = "6589646"
    
    // MARK: - Body
    var body: some View {
        ScrollView {
            VStack(spacing: 8) {
                referralImage
                detailsVStack
                conditionsVStack
                actionButtons
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            
            Spacer()
        }
    }
    
    // MARK: - Computed Properties
    private var referralImage: some View {
        Image("refer")
            .resizable()
            .scaledToFit()
            .frame(maxWidth: 400)
    }
    
    private var detailsVStack: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("Refer a Friend and Win!")
                .font(.system(size: 28, weight: .black, design: .rounded))
            
            Text("Love using TechHunt? Spread the word and earn rewards through our referral program! Invite your friends to join the TechHunt community, and you both could win big.")
                .font(.system(size: 17, weight: .light, design: .rounded))
            
            Text("How it Works:")
                .font(.system(size: 17, weight: .black, design: .rounded))
            
            Text("1. Share Your Referral Code.\n2. Friends Sign Up.\n3. Earn Rewards.")
                .font(.system(size: 17, weight: .light, design: .rounded))
            
            Text("How to Share Your Referral Code:")
                .font(.system(size: 17, weight: .black, design: .rounded))
            
            Text("1. Copy Your Code.\n2. Share Anywhere.")
                .font(.system(size: 17, weight: .light, design: .rounded))
        }
        .frame(maxWidth: 400)
        .padding()
        .fixedSize(horizontal: false, vertical: true)
        .background(LinearGradient(gradient: Gradient(colors: [Color.purple, Color.buttonBackground]), startPoint: .topTrailing, endPoint: .bottomTrailing))
        .opacity(0.8)
        .clipShape(RoundedRectangle(cornerRadius: 16))

    }
    
    private var conditionsVStack: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("Terms and Conditions:")
                .font(.system(size: 17, weight: .black, design: .rounded))
            
            Text("- Each successful referral earns you one ticket in our giveaway.\n- Winners randomly selected.\n- Prizes announced periodically.\n- TechHunt reserves the right to modify or terminate the referral program at any time.")
                .font(.system(size: 17, weight: .light, design: .rounded))
            
            Text("Start Referring Now:")
                .font(.system(size: 17, weight: .black, design: .rounded))
            
            Text("Spread the word and let's grow the TechHunt community together!")
                .font(.system(size: 17, weight: .light, design: .rounded))
        }
        .padding()
        .fixedSize(horizontal: false, vertical: true)
        .background(LinearGradient(gradient: Gradient(colors: [Color.purple, Color.buttonBackground]), startPoint: .topTrailing, endPoint: .bottomTrailing))
        .opacity(0.8)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .frame(maxWidth: 400)
        
    }
    
    
    private var actionButtons: some View {
        HStack(spacing: 0) {
            Text("Referral code: \(code)")
                .padding()
                .font(.system(size: 17, weight: .black, design: .rounded))
                .textSelection(.enabled)
                .foregroundStyle(.white)
            
            HStack {
                roundedIconButton(icon: "doc.on.doc") {
                    UIPasteboard.general.string = code
                }
                ShareLink(item: code) {
                    roundedIcon(icon: "square.and.arrow.up")
                }
            }
        }
        .frame(maxWidth: 400)
        .padding(.horizontal)
        .opacity(0.8)
        .background(Color.buttonBackground)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
    
}

#Preview {
    ReferralView()
}
