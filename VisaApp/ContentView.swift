//
//  ContentView.swift
//  VisaApp
//
//  Created by Abdulalim OZAY on 17.01.2023.
//

import SwiftUI

struct ContentView: View {
    @State var countryListModel = CountryListViewModel()
    var body: some View {
        SearchView().environmentObject(countryListModel)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(CountryListViewModel())
    }
}
