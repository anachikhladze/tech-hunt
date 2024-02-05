//
//  LoginRootView.swift
//  TechHunt
//
//  Created by Anna Sumire on 04.02.24.
//

import SwiftUI

@available(iOS 17.0, *)

struct LoginRootView: View {
    @EnvironmentObject var viewModel: LoginViewModel
    @EnvironmentObject var navigationManager: NavigationManager

    var body: some View {
        Group {
            if viewModel.userSession != nil {
                TabBarController()
                    .environmentObject(navigationManager)
            } else {
                LoginView()
            }
        }
    }
}
