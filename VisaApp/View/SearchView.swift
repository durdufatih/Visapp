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
                    actionButton.padding(.vertical)
                    
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
            print("Action \(self.fromTitle!) to \(self.toTitle!)")
                
        } label: {
            Text("Trip To Advanture")
                .padding(10)
                .foregroundColor(.white)
                .fontWeight(.bold)
                .font(.callout)
                .hAlignment(.center)
        }
        .disabled(!checkVariables())
        .background((!checkVariables()) ? Color.blue.opacity(0.5): Color.blue)
        .cornerRadius(10)
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
        if fromTitle == nil || toTitle == nil{
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
