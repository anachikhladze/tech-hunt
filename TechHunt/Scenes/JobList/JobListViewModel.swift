//
//  JobListViewModel.swift
//  TechHunt
//
//  Created by Anna Sumire on 20.01.24.
//

import Foundation
import Firebase

protocol JobListViewModelDelegate: AnyObject {
    func didFetchJobs()
}

final class JobListViewModel {
    weak var delegate: JobListViewModelDelegate?
    var jobs: [Job] = []
    
    init() {
        fetchJobs()
    }
    
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
                    
                    let job = Job(jobId: id, title: title)
                    self.jobs.append(job)
                }
                self.delegate?.didFetchJobs()
            }
        }
    }
}
