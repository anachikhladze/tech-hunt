//
//  ReferalView.swift
//  TechHunt
//
//  Created by Anna Sumire on 06.02.24.
//

import SwiftUI

struct ReferralView: View {
    
    private let promoCode = "6589646"
    
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
                .customTitleFont()
            
            Text("Love using TechHunt? Spread the word and earn rewards through our referral program! Invite your friends to join the TechHunt community, and you both could win big.")
                .customLightFont()
            
            Text("How it Works:")
                .customBlackFont()
            
            Text("1. Share Your Referral Code.\n2. Friends Sign Up.\n3. Earn Rewards.")
                .customLightFont()
            
            Text("How to Share Your Referral Code:")
                .customBlackFont()
            
            Text("1. Copy Your Code.\n2. Share Anywhere.")
                .customLightFont()
        }
        .referralStyle()
        
    }
    
    private var conditionsVStack: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("Terms and Conditions:")
                .customBlackFont()
            
            Text("- Each successful referral earns you one ticket in our giveaway.\n- Winners randomly selected.\n- Prizes announced periodically.\n- TechHunt reserves the right to modify or terminate the referral program at any time.")
                .customLightFont()
            
            Text("Start Referring Now:")
                .customBlackFont()
            
            Text("Spread the word and let's grow the TechHunt community together!")
                .customLightFont()
        }
        .referralStyle()
        
    }
    
    private var actionButtons: some View {
        HStack(spacing: 0) {
            Text("Referral code: \(promoCode)")
                .padding()
                .textSelection(.enabled)
                .foregroundStyle(.white)
                .customBlackFont()
            
            HStack {
                roundedIconButton(icon: "doc.on.doc") {
                    UIPasteboard.general.string = promoCode
                }
                ShareLink(item: promoCode) {
                    roundedIcon(icon: "square.and.arrow.up")
                }
            }
        }
        .actionButtonStyle()
    }
}

// MARK: - #Preview
#Preview {
    ReferralView()
}
