//
//  RegistrationView.swift
//  TechHunt
//
//  Created by Anna Sumire on 04.02.24.
//

import SwiftUI

struct RegistrationView: View {
    // MARK: - Properties
    @State private var email = ""
    @State private var fullname = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var showAlert = false
    
    @State private var containsCapitalLetter = false
    @State private var containsNumber = false
    @State private var containsSymbol = false
    @State private var isValidSize = false
    @State private var isValidEmail = false
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: AuthViewModel
    
    // MARK: - Body
    var body: some View {
        NavigationStack {
            VStack(spacing: 10) {
                signUpImage
                signUpText
            }
            inputFields
            conditionsVStack
            signUpButton
            Spacer()
            signInButton
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Success"),
                message: Text("You've registered successfully, you can sign in from the login page"),
                dismissButton: .default(Text("OK"))
                {
                    dismiss()
                }
            )
        }
    }
    
    // MARK: - View Components
    private var signUpImage: some View {
        Image("Engineering")
            .resizable()
            .scaledToFill()
            .frame(maxWidth: 80, maxHeight: 90)
    }
    
    private var signUpText: some View {
        Text("Sign Up")
            .font(.custom("Avenir Next", size: 26))
            .fontWeight(.semibold)
    }
    
    private var inputFields: some View {
        VStack(spacing: 24) {
            InputView(text: $email,
                      title: "Email Address",
                      placeholder: "name@gmail.com")
            .textInputAutocapitalization(.never)
            .onChange(of: email) { newValue in
                validateEmail()
            }
            
            InputView(text: $fullname,
                      title: "Full Name",
                      placeholder: "Enter your name")
            
            InputView(text: $password,
                      title: "Password",
                      placeholder: "Enter your password",
                      isSecureField: true)
            .onChange(of: password) { newValue in
                validatePassword()
            }
            
            confirmPasswordField
        }
        .padding(.horizontal)
        .padding(.top, 2)
    }
    
    private var confirmPasswordField: some View {
        ZStack(alignment: .trailing) {
            InputView(text: $confirmPassword,
                      title: "Confirm Password",
                      placeholder: "Confirm your password",
                      isSecureField: true)
            
            if !password.isEmpty && !confirmPassword.isEmpty {
                if password == confirmPassword {
                    Image(systemName: "checkmark.circle.fill")
                        .imageScale(.large)
                        .fontWeight(.bold)
                        .foregroundStyle(.accent)
                } else {
                    Image(systemName: "xmark.circle.fill")
                        .imageScale(.large)
                        .fontWeight(.bold)
                        .foregroundStyle(Color(.systemRed))
                }
            }
        }
    }
    
    private var conditionsVStack: some View {
        VStack(alignment: .leading) {
            Group {
                PasswordConditionView(condition: isValidEmail, text: "Email contains symbol \"@\"")
                PasswordConditionView(condition: containsCapitalLetter, text: "At least one uppercase letter")
                PasswordConditionView(condition: containsSymbol, text: "At least one special symbol: \"@, #, $, %, &\"")
                PasswordConditionView(condition: isValidSize, text: "At least 8 characters in length")
                PasswordConditionView(condition: containsNumber, text: "At least one digit")
            }
        }
        .padding(.top, 10)
        .font(.custom("Avenir Next", size: 15))
    }
    
    private var signUpButton: some View {
        CustomSignInButton(label: "SIGN UP") {
            try await viewModel.createUser(withEmail: email, password: password, fullname: fullname)
            showAlert = true
        }
        .disabled(!formIsValid)
        .opacity(formIsValid ? 1.0 : 0.5)
    }
    
    private var signInButton: some View {
        Button {
            dismiss()
        } label: {
            HStack(spacing: 2) {
                Text("Have an account?")
                Text("Sign In")
                    .fontWeight(.bold)
            }
            .font(.system(size: 14))
        }
    }
}


// MARK: - extension RegistrationView
extension RegistrationView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty
        && containsSymbol
        && containsNumber
        && containsCapitalLetter
        && !password.isEmpty
        && confirmPassword == password
        && isValidSize
        && !fullname.isEmpty
    }
    
    func validatePassword() {
        containsCapitalLetter = password.range(of: "[A-Z]", options: .regularExpression) != nil
        containsNumber = password.range(of: "[0-9]", options: .regularExpression) != nil
        containsSymbol = password.range(of: "[!@#$%^&*(),.?\":{}|<>]", options: .regularExpression) != nil
        isValidSize = password.count >= 8
    }
    
    func validateEmail() {
        isValidEmail = email.contains("@")
    }
}
