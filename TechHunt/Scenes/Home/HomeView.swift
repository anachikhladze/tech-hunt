//
//  HomeView.swift
//  TechHunt
//
//  Created by Anna Sumire on 23.01.24.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        VStack(spacing: 20) {
            headerView
            discoverJobHStack
            howToUseHStack
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
            Text("How to use TechHunt?")
                .font(.system(size: 20, weight: .black, design: .rounded))
                .padding()
            
            Spacer()
        }
    }
}

#Preview {
    HomeView()
}
