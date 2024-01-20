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
    let description: String
    
    static let dummyData: [Job] = [
         Job(jobId: "J123456", title: "Software Engineer", description: "Develop and maintain software applications."),
         Job(jobId: "J789012", title: "Data Scientist", description: "Analyze and interpret complex data sets."),
         Job(jobId: "J345678", title: "Marketing Specialist", description: "Create and implement marketing strategies."),
         Job(jobId: "J901234", title: "Customer Support Representative", description: "Assist customers with product-related inquiries."),
         Job(jobId: "J567890", title: "Graphic Designer", description: "Design visually appealing graphics for various projects.")
     ]
}
