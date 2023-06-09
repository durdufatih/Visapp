//
//  RequirementsView.swift
//  VisaApp
//
//  Created by Mehmet Fatih Durdu on 17.04.2023.
//

import SwiftUI

struct RequirementsView: View {
    
    @EnvironmentObject var viewModel: RequirementsViewModel
    @State private var isOn = false
    var fromCode: String
    var toCode: String
    
    var body: some View {
    
        VStack{
            if viewModel.countryRequirement.isEmpty{
                Text("Visit https://www.gov.uk/check-uk-visa/y").font(.title).frame(maxHeight: .infinity,alignment: .center)
            }
            else if viewModel.countryRequirement.count == 1{
                Text(viewModel.countryRequirement.first!.name).font(.title).frame(maxHeight: .infinity,alignment: .center)
            }
            else{
                ScrollView() {
                    
                    
                    ForEach(viewModel.countryRequirement, id: \.name) { requirements in
                        
                        VStack(alignment: .leading){
                            Text(requirements.name).font(.headline).padding(5).hAlignment(.leading)
                            Text(requirements.detail).font(.subheadline).padding(5).hAlignment(.leading)
                        }.background(.yellow).cornerRadius(10).shadow(radius: 4).fillView()
                        
                    }
                }
            }
            
        }.onAppear {
            DispatchQueue.main.async {
                viewModel.getRequirements(from: fromCode, to: toCode)
            }
            
            Interstitial().showAd()
        }
    }
}

struct RequirementsView_Previews: PreviewProvider {
    static var previews: some View {
        RequirementsView(fromCode: "TR", toCode: "GB")
    }
}
