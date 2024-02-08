//
//  HomeView.swift
//  TechHunt
//
//  Created by Anna Sumire on 23.01.24.
//

import SwiftUI

@available(iOS 17.0, *)
struct HomeView: View {
    
    @EnvironmentObject var navigationManager: NavigationManager
    @EnvironmentObject var viewModel: LoginViewModel
    
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
        .environmentObject(navigationManager)
    }
    
    // MARK: - Properties
    private var headerView: some View {
        HStack {
            Text("Welcome \(viewModel.currentUser?.fullname ?? "")!")
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
                .padding(.top, 10)
            
            Spacer()
        }
    }
}

// MARK: - Preview
//#Preview {
//    HomeView()
//}
