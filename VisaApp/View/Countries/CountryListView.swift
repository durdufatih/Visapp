//
//  CountryListView.swift
//  VisaApp
//
//  Created by Abdulalim OZAY on 22.01.2023.
//

import SwiftUI

struct CountryListView: View {
    
    // MARK: - Properties
    @EnvironmentObject var viewModel: CountryListViewModel
    private let grid = [GridItem()]
    @Environment(\.presentationMode) var presentationMode
    @Binding  var fromCheck:Bool?
    @State var selectResult: Bool = false
    
    // MARK: - Body
    var body: some View {
        ZStack {
            ///
            Color.yellow
                .ignoresSafeArea()
            ///
            
            
            ScrollView() {
                LazyVGrid(columns: grid) {
                   // let activeCountryList = viewModel.countries.filter{ fromCheck! ? ($0.name != viewModel.fromData.name):($0.name != viewModel.toData.name)
                    
                    ForEach(viewModel.getSelectableList(fromCheck: fromCheck! ), id: \.id) { country in
                        
                        Button {
                            
                            viewModel.setCountryData(country: country, fromCheck: fromCheck!)
                            selectResult = true
                            self.presentationMode.wrappedValue.dismiss()
                            
                            
                        } label: {
                            CountryListCellView(title: country.name)
                        }

                    }
                }
                .padding(15)
            }.interactiveDismissDisabled(selectResult)
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
