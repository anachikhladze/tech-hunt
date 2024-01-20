//
//  Job.swift
//  TechHunt
//
//  Created by Anna Sumire on 20.01.24.
//

import UIKit

struct Job {
    let jobId: String
    let title: String
    
    static let dummyData: [Job] = [
         Job(jobId: "J123456", title: "Software Engineer"),
         Job(jobId: "J789012", title: "Data Scientist"),
         Job(jobId: "J345678", title: "Marketing Specialist"),
         Job(jobId: "J901234", title: "Customer Support Representative"),
         Job(jobId: "J567890", title: "Graphic Designer")
     ]
}
