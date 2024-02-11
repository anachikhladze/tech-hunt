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
    @EnvironmentObject var authViewModel: AuthViewModel
    @StateObject var homeViewModel = HomeViewModel()
    
    // MARK: - Body
    var body: some View {
        VStack(spacing: 12) {
            headerView
            discoverJobHStack
            howToUseHStack
            jobCardView
            trendingHStack
            trendingJobCardView
            Spacer()
        }
        .environmentObject(navigationManager)
    }
    
    // MARK: - Properties
    private var headerView: some View {
        HStack {
            Text("Welcome \(authViewModel.currentUser?.fullname ?? "")!")
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
    
    private var jobCardBackground: some View {
        Rectangle()
            .fill(LinearGradient(gradient: Gradient(colors: [Color.purple, Color.buttonBackground]), startPoint: .topTrailing, endPoint: .bottomTrailing))
            .opacity(0.8)
    }
    
    private var jobCardText: some View {
        Text("Welcome to TechHunt! Explore top tech jobs, keep up with trends, and craft your CV for free. Apply with a tap, let companies discover you, and refer friends for our New Year’s giveaway. Don’t forget to save your favorite jobs. Enjoy your job hunt!")
            .font(.system(size: 17, weight: .light, design: .rounded))
            .padding(.bottom, 14)
            .padding(.horizontal)
    }
    
    private var jobCardButtons: some View {
        HStack {
            CustomButton(buttonText: "Read More") {
                navigationManager.navigateToRulesVC()
            }
            CustomButton(buttonText: "Create CV") {
                navigationManager.presentReferralPage()
            }
        }
    }
    
    private var jobCardView: some View {
        ZStack {
            jobCardBackground
            VStack(spacing: 0) {
                jobCardText
                jobCardButtons
            }
        }
        .frame(maxWidth: .infinity, maxHeight: 220)
        .cornerRadius(26)
        .padding(.horizontal)
    }
    
    private var trendingJobCardBackground: some View {
        Rectangle()
            .fill(LinearGradient(gradient: Gradient(colors: [Color.purple, Color.buttonBackground]), startPoint: .topTrailing, endPoint: .bottomTrailing))
            .opacity(0.8)
    }
    
    private var trendingJobCardImage: some View {
        Image("Design")
            .resizable()
            .frame(maxWidth: 200, maxHeight: 180)
            .scaledToFit()
    }
    
    private var trendingJobCardText: some View {
        VStack {
            Text("Senior Data Scientist")
            Text("Visionary Insights")
        }
        .font(.system(size: 16, weight: .light, design: .rounded))
        .padding()
    }
    
    private var trendingJobCardButton: some View {
        CustomButton(buttonText: "Apply Now") {
            if let firstJob = homeViewModel.jobs.first {
                navigationManager.navigateToJobDetailsVC(job: firstJob)
            }
        }
    }
    
    private var trendingJobCardView: some View {
        ZStack {
            trendingJobCardBackground
            VStack {
                HStack {
                    trendingJobCardImage
                    VStack {
                        trendingJobCardText
                        trendingJobCardButton
                    }
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: 200)
        .cornerRadius(26)
        .padding(.horizontal)
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
