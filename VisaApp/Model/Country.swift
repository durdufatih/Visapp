//
//  Country.swift
//  VisaApp
//
//  Created by Abdulalim OZAY on 18.01.2023.
//

import Foundation
import FirebaseFirestoreSwift

struct Country: Identifiable, Codable {
    
    @DocumentID var id: String? // code
    var name: String
    let flag: String
    let flagUrl: String
    
    enum CodingKeys: CodingKey {
        case id
        case name
        case flag
        case flagUrl
    }
}
