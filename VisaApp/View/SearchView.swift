//
//  SearchView.swift
//  VisaApp
//
//  Created by Abdulalim OZAY on 17.01.2023.
//

import SwiftUI

struct SearchView: View {
    
    // MARK: - Properties
    @EnvironmentObject var viewModel: CountryListViewModel
    @State private var showCountryListView = false
    @State private var selectFromTitle :Bool?
    
    // MARK: - Body
    var body: some View {
            
                VStack {
                    /// From
                    fromView
                    
                    /// To
                    toView
                    
                    ///Action button
                    actionButton.padding(.vertical)
                    
                }
                .padding(15)
                .vAlign(.center)
            .sheet(isPresented: $showCountryListView) {
                CountryListView(fromCheck: $selectFromTitle)
            }
        }
    
    
    @ViewBuilder
    private var actionButton:some View{
        
        NavigationLink {
                RequirementsView(fromCode: viewModel.fromData.code, toCode: viewModel.toData.code)
            } label: {
                Text("Trip To Advanture")
                    .padding(10)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .font(.callout)
                    .hAlignment(.center)
            }
            .disabled(!viewModel.checkDestinations())
            .background((!viewModel.checkDestinations()) ? Color.blue.opacity(0.5): Color.blue)
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
            selectFromTitle = true
            selectFrom()
        } label: {
            Text(viewModel.fromData.name.isEmpty ? "Select from" : viewModel.fromData.name)
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
            selectFromTitle = false
            selectFrom()
        } label: {
            Text(viewModel.toData.name.isEmpty ? "Select To": viewModel.toData.name)
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
        SearchView().environmentObject(CountryListViewModel())
    }
}
