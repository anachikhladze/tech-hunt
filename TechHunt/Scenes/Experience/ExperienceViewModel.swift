//
//  ExperienceViewModel.swift
//  TechHunt
//
//  Created by Anna Sumire on 11.02.24.
//

import Foundation

final class ExperienceViewModel {
    
    // MARK: - Properties
    var fullName: String?
    var email: String?
    var number: String?
    var linkedin: String?
    var education: String?
    var experience1: String?
    var experience2: String?
    var experience3: String?
    var languages: String?
    
    // MARK: - Initialization
    init() {
        loadDefaultValues()
    }
    
    // MARK: - Public Methods
    func loadDefaultValues() {
        fullName = "Anna Sumire"
        email = "anachikhladze99@gmail.com"
        number = "557773047"
        linkedin = "https://www.linkedin.com"
        education = "Free University of Tbilisi"
        experience1 = "Software Engineer at Tech Innovators Inc. (2018-2020)"
        experience2 = "Front-end Developer at Web Solutions Co. (2019-2022)"
        experience3 = "Data Analyst at Data Insights Corp. (2020-2021)"
        languages = "Georgian, English, Russian, French"
    }
    
    func updateInfo(fullName: String?, email: String?, number: String?, linkedin: String?, education: String?, experience1: String?, experience2: String?, experience3: String?, languages: String?) {
        self.fullName = fullName
        self.email = email
        self.number = number
        self.linkedin = linkedin
        self.education = education
        self.experience1 = experience1
        self.experience2 = experience2
        self.experience3 = experience3
        self.languages = languages
    }
}
