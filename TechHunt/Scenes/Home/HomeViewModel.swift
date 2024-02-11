//
//  HomeViewModel.swift
//  TechHunt
//
//  Created by Anna Sumire on 11.02.24.
//

import Foundation
import Firebase

final class HomeViewModel: ObservableObject {
    
    // MARK: - Properties
    @Published var jobs: [Job] = []
    
    // MARK: - Initialization
    init() {
        fetchJobs()
    }
    
    // MARK: - HomeViewModel Methods
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
            }
        }
    }
}
