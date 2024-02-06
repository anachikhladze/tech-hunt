//
//  TrendingJobCardView.swift
//  TechHunt
//
//  Created by Anna Sumire on 25.01.24.
//

import SwiftUI

@available(iOS 17.0, *)
struct TrendingJobCardView: View {
    
    @EnvironmentObject var navigationManager: NavigationManager
    @StateObject var viewModel = JobListViewModel()
    
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(LinearGradient(gradient: Gradient(colors: [Color.purple, Color.buttonBackground]), startPoint: .topTrailing, endPoint: .bottomTrailing))
                .opacity(0.8)
            
            VStack {
                HStack {
                    Image("Design")
                        .resizable()
                        .frame(maxWidth: 200, maxHeight: 180)
                        .scaledToFit()
                    
                    VStack {
                        Text("Senior Data Scientist")
                        Text("Visionary Insights")
                        
                        CustomButton(buttonText: "Apply Now") {
                            if let firstJob = viewModel.jobs.first {
                                navigationManager.navigateToJobDetailsVC(job: firstJob)
                            }
                        }
                    }
                    .font(.system(size: 16, weight: .light, design: .rounded))
                    .padding()
                }
                
            }
        }
        .frame(maxWidth: .infinity, maxHeight: 200)
        .cornerRadius(26)
        .padding(.horizontal)
    }
}
