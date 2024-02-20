//
//  ProfileView.swift
//  TechHunt
//
//  Created by Anna Sumire on 27.01.24.
//

import SwiftUI
import PhotosUI

struct ProfileView: View {
    
    // MARK: - Properties
    @State private var avatarImage: UIImage?
    @State private var photosPickerItem: PhotosPickerItem?
    @EnvironmentObject var authViewModel: AuthViewModel
    @EnvironmentObject var navigationManager: NavigationManager
    
    // MARK: - Body
    var body: some View {
        List {
            userInfoSection
            generalSection
            accountSection
        }
        .listStyle(.plain)
        .navigationTitle("Profile")
    }
    
    // MARK: - View Components
    private var userInfoSection: some View {
        Section() {
            HStack {
                PhotosPicker(selection: $photosPickerItem, matching: .images) {
                    Image(uiImage: avatarImage ?? UIImage(resource: .femaleavatar))
                        .resizable()
                        .aspectRatio(contentMode:.fill)
                        .frame(width: 100, height: 100) .clipShape (.circle)
                }
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(authViewModel.currentUser?.fullname ?? "")
                        .font (.subheadline)
                        .fontWeight (.semibold)
                        .padding(.top, 4)
                    Text(authViewModel.currentUser?.email ?? "")
                        .font(.footnote)
                        .accentColor(.gray)
                }
            }
            .onChange(of: photosPickerItem) { _, _ in
                Task {
                    if let photosPickerItem,
                       let data = try? await photosPickerItem.loadTransferable(type: Data.self) {
                        if let image = UIImage(data: data) {
                            avatarImage = image
                        }
                    }
                    photosPickerItem = nil
                }
            }
        }
    }
    
    private var generalSection: some View {
        Section("General") {
            HStack(spacing: 12) {
                Image(systemName: "gear")
                    .imageScale(.small)
                    .font(.title)
                    .foregroundStyle(Color.sectionAccent)
                
                Text("Version")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                
                Spacer()
                Text("1.1")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                
            }
        }
    }
    
    private var accountSection: some View {
        Section("Categories") {
            Button {
                navigationManager.navigateToExperienceVC()
            } label : {
                SettingsRowView(imageName: "person",
                                title: "My Experience",
                                tintColor: Color.sectionAccent)
            }
            
            Button {
                navigationManager.pushAppliedJobsVC()
            } label: {
                SettingsRowView(imageName: "arrow.up.doc",
                                title: "Applied Jobs",
                                tintColor: Color.sectionAccent)
            }
            
            Button {
                navigationManager.pushFavoriteJobsVC()
            } label: {
                SettingsRowView(imageName: "heart",
                                title: "Favorite Jobs",
                                tintColor: Color.sectionAccent)
            }
            
            Button {
                navigationManager.navigateToReferralPage()
            } label: {
                SettingsRowView(imageName: "person.badge.plus",
                                title: "Refer a friend",
                                tintColor: Color.sectionAccent)
            }
            
            Button {
                navigationManager.pushSupportVC()
            } label: {
                SettingsRowView(imageName: "questionmark.circle",
                                title: "Support",
                                tintColor: Color.sectionAccent)
            }
            
            Button {
                navigationManager.pushRulesVC()
            } label: {
                SettingsRowView(imageName: "doc.text",
                                title: "How to use?",
                                tintColor: Color.sectionAccent)
            }
            
            Button {
                authViewModel.signOut { success in
                    if success {
                        navigationManager.showRootView()
                    } else {
                        print("Error")
                    }
                }
            } label: {
                SettingsRowView(imageName: "power",
                                title: "Sign Out",
                                tintColor: Color.sectionAccent)
            }
        }
        .accentColor(Color.sectionAccent)
    }
}
