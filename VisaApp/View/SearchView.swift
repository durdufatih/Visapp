//
//  SearchView.swift
//  VisaApp
//
//  Created by Abdulalim OZAY on 17.01.2023.
//

import SwiftUI

struct SearchView: View {
    
    // MARK: - Properties
    @State private var fromTitle: String?
    @State private var toTitle: String?
    @State private var showCountryListView = false
    
    // MARK: - Body
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    /// From
                    fromView
                    
                    /// To
                    toView
                }
                .padding(15)
                .vAlign(.top)
            }
            .navigationTitle("Search")
            .sheet(isPresented: $showCountryListView) {
                CountryListView(viewModel: CountryListViewModel())
            }
        }
    }
    
    // MARK: - From
    @ViewBuilder
    private var fromView: some View {
        
        /// From Title
        Text("I am from")
            .font(.title.bold())
            .hAlignment(.leading)
        
        /// From Button
        Button {
            selectFrom()
        } label: {
            Text(fromTitle ?? "Select From")
                .hAlignment(.leading)
        }
        .font(.callout)
        .fontWeight(.medium)
        .tint(.white)
        .hAlignment(.center)
        .fillView(.black)
    }
    
    // MARK: - To
    @ViewBuilder
    private var toView: some View {
        
        /// From Title
        Text("Where are you going?")
            .font(.title.bold())
            .hAlignment(.leading)
            .padding(.top, 50)
        
        /// From Button
        Button {
            selectFrom()
        } label: {
            Text(fromTitle ?? "Select To")
                .hAlignment(.leading)
        }
        .font(.callout)
        .fontWeight(.medium)
        .tint(.white)
        .hAlignment(.center)
        .fillView(.black)
    }
    
}

extension SearchView {
    func selectFrom() {
        showCountryListView.toggle()
    }
    
    func selectTo() {
        showCountryListView.toggle()
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
