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
    @State private var selectFromTitle : Bool?
    
    // MARK: - Body
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    /// From
                    fromView
                    
                    /// To
                    toView
                    
                    ///Action button
                    actionButton
                    
                }
                .padding(15)
                .vAlign(.top)
            }
            .navigationTitle("Search")
            .sheet(isPresented: $showCountryListView) {
                CountryListView(viewModel: CountryListViewModel(),selectedItem: self.selectFromTitle ?? false ? $fromTitle:$toTitle)
            }
        }
    }
    
    @ViewBuilder
    private var actionButton:some View{
        Button {
            checkVariables() ? print("Action \(self.fromTitle!) to \(self.toTitle!)"): print("Exception")
                
        } label: {
            Text("Go To Plesure :)")
                .font(.caption).hAlignment(.center)
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
            self.selectFromTitle = true
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
            self.selectFromTitle = false
            selectFrom()
        } label: {
            Text(toTitle ?? "Select To")
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
    
    func checkVariables() -> Bool{
        guard let fromText = fromTitle else{
            return false
        }
        
        guard let toTitle = fromTitle else{
            return false
        }
        
        return true
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
