//
//  Requirement.swift
//  VisaApp
//
//  Created by Mehmet Fatih Durdu on 17.04.2023.
//

import Foundation
import FirebaseFirestoreSwift

struct RequirementModel:Codable {
    let data:[Requirement]
    
    enum CodingKeys:CodingKey{
        case data
    }
}

struct Requirement:Codable {
    
    let name: String
    let detail: String
    
    enum CodingKeys: CodingKey {
        //case id
        case name
        case detail
    }
}
