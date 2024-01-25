//
//  HomeView.swift
//  TechHunt
//
//  Created by Anna Sumire on 23.01.24.
//

import SwiftUI

struct HomeView: View {
    
    // MARK: - Body
    var body: some View {
        VStack(spacing: 12) {
            headerView
            discoverJobHStack
            howToUseHStack
            JobCardView()
            trendingHStack
            TrendingJobCardView()
            Spacer()
        }
    }
    
    // MARK: - Properties
    private var headerView: some View {
        HStack {
            Text("Welcome, Anna Sumire!")
                .font(.headline)
            
            Spacer()
            
            Image("femaleavatar")
                .resizable()
                .scaledToFill()
                .frame(maxWidth: 50, maxHeight: 30)
        }
        .padding(.horizontal)
    }
    
    private var discoverJobHStack: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Discover")
                Text("The Perfect Job")
            }
            .font(.system(size: 32, weight: .black, design: .rounded))
            .padding()
            
            Spacer()
        }
    }
    
    private var howToUseHStack: some View {
        HStack {
            Text("How to use TechHunt? 🚀")
                .font(.system(size: 20, weight: .black, design: .rounded))
                .padding(.horizontal)
            
            Spacer()
        }
    }
    
    private var trendingHStack: some View {
        HStack {
            Text("Trending Job 🔥")
                .font(.system(size: 20, weight: .black, design: .rounded))
                .padding(.horizontal)
            
            Spacer()
        }
    }
}

// MARK: - Preview
#Preview {
    HomeView()
}
