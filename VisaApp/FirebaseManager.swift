//
//  FirebaseManager.swift
//  VisaApp
//
//  Created by Abdulalim OZAY on 18.01.2023.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseDatabase

enum FirebaseColumns: String {
    case countries = "countries"
    case requirements = "requirements"
}

protocol FirebaseManagerProtocol {
    func fetchCountries(completion: @escaping (_ countries: [Country]?, _ error: Error?) -> Void)
    
    func fetchRequirements(from:String,to:String,completion: @escaping (_ requirementModel: [Requirement]?, _ error: Error?) -> Void)
}

class FirebaseManager: FirebaseManagerProtocol {
    
    
    
    static let shared = FirebaseManager()
    private let firestore = Firestore.firestore()
    private var countriesListener: ListenerRegistration?
    private var requirementListener: ListenerRegistration?
    private init() { }
    
    func fetchCountries(completion: @escaping ([Country]?, Error?) -> Void) {
        
        countriesListener = firestore.collection(FirebaseColumns.countries.rawValue).addSnapshotListener { [weak self] query, error in
            
            if let error {
                print("Error: \(error.localizedDescription)")
                completion(nil, error)
                self?.countriesListener?.remove()
                return
            }
            
            let countries = query?.documents.compactMap({ try? $0.data(as: Country.self) })
            completion(countries, nil)
            self?.countriesListener?.remove()
        }
    }
    func fetchRequirements(from:String, to:String, completion: @escaping ([Requirement]?, Error?) -> Void) {
        requirementListener = firestore.collection(FirebaseColumns.requirements.rawValue).addSnapshotListener{ [weak self] query, error in
            
            if let error {
                print("Error: \(error.localizedDescription)")
                completion(nil, error)
                self?.requirementListener?.remove()
                return
            }
        
            do{
                let resultData =  try query?.documents.filter { $0.documentID == "\(from)_TO_\(to)"}
                    .first?
                    .data(as: RequirementModel.self).data
                
                completion(resultData,nil)
                
                self?.requirementListener?.remove()
            }catch(let error){
                print(error.localizedDescription)
            }
        }
    }
}
