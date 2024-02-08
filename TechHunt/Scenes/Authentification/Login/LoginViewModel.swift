//
//  LoginViewModel.swift
//  TechHunt
//
//  Created by Anna Sumire on 04.02.24.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

// MARK: - AuthenticationFormProtocol
protocol AuthenticationFormProtocol {
    var formIsValid: Bool { get }
}

// MARK: - LoginViewModel
@available(iOS 17.0, *)
final class LoginViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    @Published var jobs: [Job] = []
    
    // MARK: - Initialization
    init() {
        self.userSession = Auth.auth().currentUser
        Task {
            await fetchUser()
        }
    }
    
    // MARK: - Methods
    func signIn(withEmail email: String, password: String, completion: @escaping (Bool) -> Void) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            await MainActor.run {
                self.userSession = result.user
            }
            await fetchUser()
            completion(true)
        } catch {
            print("DEBUG: Failed to log in with error: \(error.localizedDescription)")
            completion(false)
            throw error
        }
    }

    
    func createUser(withEmail email: String, password: String, fullname: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            let user = User(id: result.user.uid, fullname: fullname, email: email)
            let encodedUser = try Firestore.Encoder().encode(user)
            try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
            await fetchUser()
        } catch {
            print("DEBUG: Failed to create user with error: \(error.localizedDescription)")
        }
    }
    
    func signOut(completion: @escaping (Bool) -> Void) {
        do {
            try Auth.auth().signOut()
            self.userSession  = nil
            self.currentUser = nil
            completion(true)
        } catch {
            print ("DEBUG: Failed to sign out with error \(error.localizedDescription)")
            completion(false)
        }
    }

    func fetchUser() async {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let snapshot = try? await Firestore.firestore().collection("users").document(uid).getDocument() else { return }
        await MainActor.run {
            self.currentUser = try? snapshot.data(as: User.self)
        }
    }
}
