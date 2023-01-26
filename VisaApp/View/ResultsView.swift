//
//  ResultsView.swift
//  VisaApp
//
//  Created by Abdulalim OZAY on 17.01.2023.
//

import SwiftUI

struct ResultsView: View {
    
    private let columns = [GridItem()]
    private let items = ["1", "2", "3"]
    
    var body: some View {
        ZStack {
            ///
            Color.yellow
                .ignoresSafeArea()
            ///
            ScrollView() {
                LazyVGrid(columns: columns) {
                    ForEach(items, id: \.self) { item in
                        ResultCellView(title: item, selected: true)
                    }
                }
                .padding(15)
            }
        }
    }
}

struct ResultCellView: View {
    
    let title: String
    let selected: Bool
    
    var body: some View {
        HStack {
            VStack {
                Text(title)
                    .font(.headline)
                    .padding(.bottom, 5)
                    .hAlignment(.leading)
                
                Text(title)
                    .hAlignment(.leading)
                    .foregroundColor(.gray)
            }
            .hAlignment(.center)
            
            ///
            Button {
                
            } label: {
                Image(systemName: selected ? "checkmark.circle" : "circle")
                    .resizable()
                    .frame(width: 30, height: 30)
            }
        }
        .frame(minHeight: 50)
        .fillView()
        
    }
}

struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
        ResultsView()
    }
}
