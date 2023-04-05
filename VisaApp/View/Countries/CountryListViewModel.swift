//
//  CountryListViewModel.swift
//  VisaApp
//
//  Created by Abdulalim OZAY on 22.01.2023.
//

import Foundation

protocol CountryListViewModelProtocol: ObservableObject {
    
    var countries: [Country] { get set }
    
    func fetchCountryList()
}

class CountryListViewModel: ObservableObject, CountryListViewModelProtocol {
    
    @Published var countries: [Country] = []
    @Published var fromData: String = ""
    @Published var toData: String = ""
    
    func fetchCountryList() {
        
        guard countries.isEmpty else {
            return
        }
        
        FirebaseManager.shared.fetchCountries { [weak self] countries, error in
            self?.countries = countries ?? []
        }
    }
}
