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
    
    func fetchCountryList() {
        
        guard countries.isEmpty else {
            return
        }
        
        FirebaseManager.shared.fetchCountries { [weak self] countries, error in
            self?.countries = countries ?? []
        }
    }
}
