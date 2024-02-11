//
//  JobDetailsViewModel.swift
//  TechHunt
//
//  Created by Anna Sumire on 11.02.24.
//

import Foundation
import Firebase

final class JobDetailsViewModel {
    
    func applyForJob(jobId: String) async {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let userRef = Firestore.firestore().collection("users").document(uid)
        
        guard let snapshot = try? await userRef.getDocument() else { return }
        var user = try? snapshot.data(as: User.self)
        
        user?.appliedJobs.append(jobId)
        
        if let user = user,
           let encodedUser = try? Firestore.Encoder().encode(user) {
            try? await userRef.setData(encodedUser)
        }
    }
    
    func hasAppliedForJob(jobId: String) async -> Bool {
        guard let uid = Auth.auth().currentUser?.uid else { return false }
        guard let snapshot = try? await Firestore.firestore().collection("users").document(uid).getDocument() else { return false }
        guard let user = try? snapshot.data(as: User.self) else { return false }
        
        return user.appliedJobs.contains(jobId)
    }
    
    func imageForCategory(_ category: String) -> UIImage? {
        switch category {
        case "Security":
            return UIImage(named: "Security")
        case "Infrastructure":
            return UIImage(named: "Infrastructure")
        case "Architecture":
            return UIImage(named: "Architecture")
        case "Data Engineering":
            return UIImage(named: "Engineering")
        case "Design":
            return UIImage(named: "Design")
        case "Data Science":
            return UIImage(named: "DataScience")
        case "Development":
            return UIImage(named: "Development")
        case "Product Management":
            return UIImage(named: "PM")
        default:
            print("Invalid department")
            return nil
        }
    }
}
