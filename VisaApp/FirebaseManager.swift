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
}

protocol FirebaseManagerProtocol {
    func fetchCountries(completion: @escaping (_ countries: [Country]?, _ error: Error?) -> Void)
}

class FirebaseManager: FirebaseManagerProtocol {
    
    static let shared = FirebaseManager()
    private let firestore = Firestore.firestore()
    private var countriesListener: ListenerRegistration?
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
}
