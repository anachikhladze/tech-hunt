//
//  JobListViewModel.swift
//  TechHunt
//
//  Created by Anna Sumire on 20.01.24.
//

import UIKit
import Firebase

// MARK: - JobListViewModelDelegate
protocol JobListViewModelDelegate: AnyObject {
    func didFetchJobs()
}

final class JobListViewModel: ObservableObject {
    
    // MARK: - Properties
    weak var delegate: JobListViewModelDelegate?
    @Published var jobs: [Job] = []
    @Published var appliedJobs: [Job] = []
    
    // MARK: - Initialization
    init() {
        fetchJobs()
    }
    
    func viewWillAppear() {
        fetchJobs()
    }
    
    // MARK: - JobListViewModel Methods
   func fetchJobs() {
        jobs.removeAll()
        
        let db = Firestore.firestore()
        let ref = db.collection("Jobs")
        ref.getDocuments { snapshot, error in
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            
            if let snapshot = snapshot {
                for document in snapshot.documents {
                    let data = document.data()
                    
                    let id = data["id"] as? String ?? ""
                    let title = data["title"] as? String ?? ""
                    let company = data["company"] as? String ?? ""
                    let description = data["description"] as? String ?? ""
                    let type = data["type"] as? String ?? ""
                    let category = data["category"] as? String ?? ""
                    
                    let job = Job(id: id, title: title, company: company, description: description, type: type, category: category)
                    self.jobs.append(job)
                }
                self.delegate?.didFetchJobs()
            }
        }
    }
    
    func fetchJob(withSearchText: String) {
        let db = Firestore.firestore()
        let ref = db.collection("Jobs")
        ref.getDocuments { snapshot, error in
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            
            if let snapshot = snapshot {
                self.jobs.removeAll()
                for document in snapshot.documents {
                    let data = document.data()
                    
                    let id = data["id"] as? String ?? ""
                    let title = data["title"] as? String ?? ""
                    let company = data["company"] as? String ?? ""
                    let description = data["description"] as? String ?? ""
                    let type = data["type"] as? String ?? ""
                    let category = data["category"] as? String ?? ""
                    
                    if title.lowercased().contains(withSearchText.lowercased()) {
                        let job = Job(id: id, title: title, company: company, description: description, type: type, category: category)
                        self.jobs.append(job)
                    }
                }
                self.delegate?.didFetchJobs()
            }
        }
    }
    
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
    
    func fetchAppliedJobs() async -> [Job] {
        guard let uid = Auth.auth().currentUser?.uid else { return [] }
        guard let snapshot = try? await Firestore.firestore().collection("users").document(uid).getDocument() else { return [] }
        guard let user = try? snapshot.data(as: User.self) else { return [] }
        
        return jobs.filter { user.appliedJobs.contains($0.id) }
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
