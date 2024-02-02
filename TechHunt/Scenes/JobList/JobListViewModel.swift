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
