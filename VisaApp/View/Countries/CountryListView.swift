//
//  CountryListView.swift
//  VisaApp
//
//  Created by Abdulalim OZAY on 22.01.2023.
//

import SwiftUI

struct CountryListView: View {
    
    // MARK: - Properties
    @StateObject var viewModel: CountryListViewModel
    private let grid = [GridItem()]
    @Environment(\.presentationMode) var presentationMode
    @Binding  var selectedItem:String?
    
    // MARK: - Body
    var body: some View {
        
        ZStack {
            ///
            Color.yellow
                .ignoresSafeArea()
            ///
            ScrollView() {
                LazyVGrid(columns: grid) {
                    ForEach(viewModel.countries, id: \.id) { country in
                        Button {
                            selectedItem = country.name
                            self.presentationMode.wrappedValue.dismiss()
                        } label: {
                            CountryListCellView(title: country.name)
                        }

                    }
                }
                .padding(15)
            }.interactiveDismissDisabled((selectedItem?.isEmpty ?? false))
        }
        .onAppear {
            viewModel.fetchCountryList()
        }
    }
    
}

//struct CountryListView_Previews: PreviewProvider {
//    static var previews: some View {
//        CountryListView()
//    }
//}

struct CountryListCellView: View {
    
    let title: String
    
    var body: some View {
        VStack {
            Text(title)
                .font(.headline)
                .padding(5)
                .hAlignment(.leading)
        }
        .frame(height: 44)
        .fillView()
    }
}
