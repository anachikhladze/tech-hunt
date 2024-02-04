//
//  LoginView.swift
//  TechHunt
//
//  Created by Anna Sumire on 04.02.24.
//

import SwiftUI

struct LoginView: View {
    
    // MARK: - Properties
    @State private var email = ""
    @State private var password = ""
    @State private var showingAlert = false
    @State private var alertMessage = ""
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var viewModel: LoginViewModel
//    @EnvironmentObject var flowCoordinator: FlowCoordinator
    
    // MARK: - Body
    var body: some View {
        bankImageView
        mainVStack
        signInButton
        Spacer()
        registrationLink
    }
    
    private var bankImageView: some View {
        Image(colorScheme == .light ? "Design" : "bankDark")
            .resizable()
            .scaledToFill()
            .frame(maxWidth: 110, maxHeight: 120)
            .padding(.top, 32)
    }
    
    private var mainVStack: some View {
        VStack(spacing: 24) {
            Text("Login")
                .font(.custom("Avenir Next", size: 30))
                .fontWeight(.semibold)
            
            InputView(text: $email,
                      title: "Email Address",
                      placeholder: "name@gmail.com")
            .textInputAutocapitalization(.never)
            
            InputView(text: $password,
                      title: "Password",
                      placeholder: "Enter your password",
                      isSecureField: true)
            
            forgotPasswordLink
        }
        .padding(.horizontal)
        .padding(.top, 12)
    }
    
    private var forgotPasswordLink: some View {
        HStack(alignment: .bottom) {
            Spacer()
            Text("Forgot Password?")
                .fontWeight(.bold)
                .font(.footnote)
                .foregroundStyle(.blue)
        }
    }
    
    private var signInButton: some View {
        CustomSignInButton(label: "SIGN IN") {
            do {
                try await viewModel.signIn(withEmail: email, password: password)
            } catch {
                showingAlert = true
            }
        }
        .disabled(!formIsValid)
        .opacity(formIsValid ? 1.0 : 0.5)
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Login Error"), message: Text("The email address or password you entered is incorrect. Please try again."), dismissButton: .default(Text("OK")))
        }
    }
    
    private var registrationLink: some View {
        Button {
//            flowCoordinator.showRegistrationPage()
        } label: {
            HStack(spacing: 2) {
                Text("Don't have an account? ")
                Text("Sign Up")
                    .fontWeight(.bold)
            }
            .font(.system(size: 14))
        }
    }
}

// MARK: - extension LoginView
extension LoginView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count > 7
    }
}

// MARK: - Preview
#Preview {
    LoginView()
}
