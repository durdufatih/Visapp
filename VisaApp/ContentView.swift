//
//  ContentView.swift
//  VisaApp
//
//  Created by Abdulalim OZAY on 17.01.2023.
//

import SwiftUI

struct ContentView: View {
    @State var countryListModel = CountryListViewModel()
    @State var requirementModel = RequirementsViewModel()
    var body: some View {
        NavigationView {
            SearchView()
               
        }.navigationTitle("")
         .navigationBarTitleDisplayMode(.inline).environmentObject(requirementModel)
         .environmentObject(countryListModel)
         .navigationViewStyle(.stack)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(CountryListViewModel())
            .environmentObject(RequirementsViewModel())
    }
}
