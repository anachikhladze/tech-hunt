//
//  User.swift
//  TechHunt
//
//  Created by Anna Sumire on 04.02.24.
//

import Foundation

struct User {
    let uid: String
    let fullName: String
    let email: String
    var cv: String?
    var jobsApplied: [Job]
    var favoriteJobs: [Job]
    var profilePicture: String?
}
