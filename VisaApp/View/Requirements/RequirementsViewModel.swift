//
//  RequirementViewModel.swift
//  VisaApp
//
//  Created by Mehmet Fatih Durdu on 17.04.2023.
//

import Foundation

protocol RequirementsViewModelProtocol: ObservableObject {
    
    var countryRequirement: [Requirement] { get set }
    
    func getRequirements(from:String,to:String)
    
}

class RequirementsViewModel:RequirementsViewModelProtocol{
    
    @Published var countryRequirement: [Requirement] = []
    
    func getRequirements(from: String, to: String) {
        countryRequirement = []
        guard countryRequirement.isEmpty else {
            return
        }
        
        FirebaseManager.shared.fetchRequirements(from: from, to: to, completion: { requirements, error in
            self.countryRequirement = requirements ?? []
        })
        
    }
    
}
