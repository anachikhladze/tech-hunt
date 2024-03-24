//
//  User.swift
//  TechHunt
//
//  Created by Anna Sumire on 04.02.24.
//

import Foundation

struct User: Identifiable, Codable {
    let id: String
    var fullname: String
    let email: String
    var appliedJobs: [String] = []
    var favoriteJobs: [String] = []
    var profilePicture: String = ""
}
