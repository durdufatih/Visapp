//
//  CountryListViewModel.swift
//  VisaApp
//
//  Created by Abdulalim OZAY on 22.01.2023.
//

import Foundation
import Combine

protocol CountryListViewModelProtocol: ObservableObject {
    
    var countries: [Country] { get set }
    
    var fromData :Country {get set}
    
    var toData :Country {get set}
    
    func fetchCountryList()
    
    func setCountryData(country:Country,fromCheck:Bool)
    
    func checkDestinations()->Bool
    
    func getSelectableList(fromCheck:Bool)->[Country]
}

class CountryListViewModel: CountryListViewModelProtocol {
    
    
    
    @Published var countries: [Country] = []
    @Published var fromData: Country = Country.init(name: "", code:"")
    @Published var toData: Country = Country.init(name: "", code:"")
    
    
    func getSelectableList(fromCheck:Bool) -> [Country] {
        if fromCheck {
            return countries.filter({$0.name != self.toData.name})
        }
        else{
            return countries.filter({$0.code == "GB"})
        }
    }
    
    func fetchCountryList() {
        
        guard countries.isEmpty else {
            return
        }
        
        FirebaseManager.shared.fetchCountries { [weak self] countries, error in
            self?.countries = countries ?? []
        }
    }
    
    
    
    func setCountryData(country: Country, fromCheck: Bool) {
        if fromCheck {
            self.fromData = country
        }
        else{
            self.toData = country
        }
    }
    
    func checkDestinations() -> Bool {
        if fromData.name.isEmpty || toData.name.isEmpty {
            return false
        }
        return true
    }
}
