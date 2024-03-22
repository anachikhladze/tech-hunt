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
    func didUpdateJobs()
}
final class FirebaseDataViewModel: ObservableObject {
    
    // MARK: - Properties
    weak var delegate: JobListViewModelDelegate?
    @Published var allJobs: [Job] = []
    @Published var jobs: [Job] = []
    @Published var appliedJobs: [Job] = []
    
    // MARK: - Initialization
    init() {
        fetchJobs()
    }
    
    func viewWillAppear() {
        fetchJobs()
    }
    
    // MARK: - FirebaseDataViewModel Methods
    func fetchJobs() {
        allJobs.removeAll()
        
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
                    self.allJobs.append(job)
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
                self.allJobs.removeAll()
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
                        self.allJobs.append(job)
                    }
                }
                self.delegate?.didFetchJobs()
            }
        }
    }
    
    func fetchAppliedJobs() async -> [Job] {
        guard let uid = Auth.auth().currentUser?.uid else { return [] }
        guard let snapshot = try? await Firestore.firestore().collection("users").document(uid).getDocument() else { return [] }
        guard let user = try? snapshot.data(as: User.self) else { return [] }
        
        return allJobs.filter { user.appliedJobs.contains($0.id) }
    }
    
    func fetchFavoriteJobs() async -> [Job] {
        guard let uid = Auth.auth().currentUser?.uid else { return [] }
        guard let snapshot = try? await Firestore.firestore().collection("users").document(uid).getDocument() else { return [] }
        guard let user = try? snapshot.data(as: User.self) else { return [] }
        
        return allJobs.filter { user.favoriteJobs.contains($0.id) }
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
    
    func filterJobByCategory(_ category: String) {
        switch category {
        case "Development":
            jobs = allJobs.filter { $0.category == "Development" }
        case "Data Science":
            jobs = allJobs.filter { $0.category == "Data Science" }
        case "Design":
            jobs = allJobs.filter { $0.category == "Design" }
        case "Data Engineering":
            jobs = allJobs.filter { $0.category == "Data Engineering" }
        case "Architecture":
            jobs = allJobs.filter { $0.category == "Architecture" }
        case "Infrastructure":
            jobs = allJobs.filter { $0.category == "Infrastructure" }
        case "Security":
            jobs = allJobs.filter { $0.category == "Security" }
        case "Product Management":
            jobs = allJobs.filter { $0.category == "Product Management" }
        case "All Jobs":
            jobs = allJobs
        default:
            jobs = allJobs
        }
        delegate?.didUpdateJobs()
    }
}
