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
final class LoginViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    // MARK: - Initialization
    init() {
        self.userSession = Auth.auth().currentUser
        Task {
            await fetchUser()
        }
    }
    
    // MARK: - Methods
    func signIn(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            await MainActor.run {
                self.userSession = result.user
            }
            await fetchUser()
        } catch {
            print("DEBUG: Failed to log in with error: \(error.localizedDescription)")
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
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            self.userSession  = nil
            self.currentUser = nil
        } catch {
            print ("DEBUG: Failed to sign out with error \(error.localizedDescription)")
        }
    }
    
    func fetchUser() async {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let snapshot = try? await Firestore.firestore().collection("users").document(uid).getDocument() else { return }
        await MainActor.run {
            self.currentUser = try? snapshot.data(as: User.self)
        }
    }
    
    // Add this method to your LoginViewModel
    func applyForJob(jobId: String) async {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let userRef = Firestore.firestore().collection("users").document(uid)
        
        // Fetch the current user document
        guard let snapshot = try? await userRef.getDocument() else { return }
        var user = try? snapshot.data(as: User.self)
        
        // Add the job ID to the appliedJobs array
        user?.appliedJobs.append(jobId)
        
        // Update the user document
        if let user = user,
           let encodedUser = try? Firestore.Encoder().encode(user) {
            try? await userRef.setData(encodedUser)
        }
    }
    
    func fetchAppliedJobs() async -> [Job] {
        guard let uid = Auth.auth().currentUser?.uid else { return [] }
        guard let snapshot = try? await Firestore.firestore().collection("users").document(uid).getDocument() else { return [] }
        guard let user = try? snapshot.data(as: User.self) else { return [] }
        
        // Fetch each job document
        var jobs: [Job] = []
        for jobId in user.appliedJobs {
            if let jobSnapshot = try? await Firestore.firestore().collection("jobs").document(jobId).getDocument(),
               let job = try? jobSnapshot.data(as: Job.self) {
                jobs.append(job)
            }
        }
        return jobs
    }
    
    func hasAppliedForJob(jobId: String) async -> Bool {
        guard let uid = Auth.auth().currentUser?.uid else { return false }
        guard let snapshot = try? await Firestore.firestore().collection("users").document(uid).getDocument() else { return false }
        guard let user = try? snapshot.data(as: User.self) else { return false }
        
        return user.appliedJobs.contains(jobId)
    }

}
