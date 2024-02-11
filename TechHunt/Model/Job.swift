//
//  Job.swift
//  TechHunt
//
//  Created by Anna Sumire on 20.01.24.
//

import Foundation

struct Job: Codable, Identifiable {
    var id: String
    var title: String
    var company: String
    var description: String
    var type: String
    var category: String
}
