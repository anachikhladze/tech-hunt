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
final class AuthViewModel: ObservableObject {
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
            print(error.localizedDescription)
        }
    }
    
    func signOut(completion: @escaping (Bool) -> Void) {
        do {
            try Auth.auth().signOut()
            self.userSession  = nil
            self.currentUser = nil
            completion(true)
        } catch {
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
    
    func deleteAccount(completion: @escaping (Bool) -> Void) {
        guard let user = Auth.auth().currentUser else { return }
        
        user.delete { error in
            if let error = error {
                completion(false)
            } else {
                self.userSession = nil
                self.currentUser = nil
                completion(true)
            }
        }
    }
    
    func updateFullName(newFullName: String) async throws {
        guard let userId = self.currentUser?.id else {
            return
        }
        
        do {
            let userRef = Firestore.firestore().collection("users").document(userId)
            try await userRef.updateData(["fullname": newFullName])
            await MainActor.run {
                self.currentUser?.fullname = newFullName
            }
            await fetchUser()
        } catch {
            throw error
        }
    }
    
    func updatePassword(newPassword: String, completion: @escaping (Bool) -> Void) {
        Auth.auth().currentUser?.updatePassword(to: newPassword) { error in
            if let error = error {
                completion(false)
            } else {
                completion(true)
            }
        }
    }
}
