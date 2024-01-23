//
//  HomeView.swift
//  TechHunt
//
//  Created by Anna Sumire on 23.01.24.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        VStack(spacing: 16) {
            headerView
            discoverJobHStack
            howToUseHStack
            VCard()
            trendingHStack
            Spacer()
        }
    }
    
    var headerView: some View {
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
    
    var discoverJobHStack: some View {
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
    
    var howToUseHStack: some View {
        HStack {
            Text("How to use TechHunt? 🚀")
                .font(.system(size: 20, weight: .black, design: .rounded))
                .padding(.horizontal)
            
            Spacer()
        }
    }
    
    var trendingHStack: some View {
        HStack {
            Text("Trending Job 🔥")
                .font(.system(size: 20, weight: .black, design: .rounded))
                .padding(.horizontal)
            
            Spacer()
        }
    }
}

#Preview {
    HomeView()
}


struct VCard: View {
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(LinearGradient(gradient: Gradient(colors: [Color.purple, Color.buttonBackground]), startPoint: .topTrailing, endPoint: .bottomTrailing))
                .opacity(0.8)
            
            VStack {
                Text("Welcome to TechHunt! Explore top tech jobs, keep up with trends, and craft your CV for free. Apply with a tap, let companies discover you, and refer friends for our New Year’s giveaway. Don’t forget to save your favorite jobs. Enjoy your job hunt!")
                    .font(.system(size: 18, weight: .light, design: .rounded))
                    .padding()
                
                HStack {
                    Button(action: {
                        print("Button tapped!")
                    }) {
                        Text("Read More")
                            .font(.system(size: 16, weight: .black, design: .rounded))
                            .padding()
                            .background(Color.buttonBackground)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    
                    Button(action: {
                        print("Button tapped!")
                    }) {
                        Text("Create CV")
                            .font(.system(size: 16, weight: .black, design: .rounded))
                            .padding()
                            .background(Color.buttonBackground)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: 250)
        .cornerRadius(26)
        .padding(.horizontal)
    }
}


