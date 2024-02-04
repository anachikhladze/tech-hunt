//
//  LoginRootView.swift
//  TechHunt
//
//  Created by Anna Sumire on 04.02.24.
//

import SwiftUI

@available(iOS 17.0, *)
struct LoginRootView: View {
    
    // MARK: - Properties
    @EnvironmentObject var viewModel: LoginViewModel
    @EnvironmentObject var flowCoordinator: FlowCoordinator
    
    // MARK: - Body
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                ProfileView()
                    .environmentObject(flowCoordinator)
            } else {
                LoginView()
            }
        }
    }
}
