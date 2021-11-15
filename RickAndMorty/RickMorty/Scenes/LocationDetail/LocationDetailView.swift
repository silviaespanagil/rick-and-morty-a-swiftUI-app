//
//  LocationDetailView.swift
//  RickMorty
//
//  Created by Silvia España on 12/11/21.
//

import SwiftUI

struct LocationDetailView: View {
    
    @StateObject var viewModel: LocationDetailViewModel
    
    var body: some View {
        Text(viewModel.location.name)
        /*Button(action: {
            viewModel.getResidents()
                }){
                    Text(":D")
                }*/
    }
}

struct LocationDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        let location = Location(id: 1,
                                name: "Earth",
                                type: "Type",
                                residents: ["1","2"],
                                dimension: "dimension")
        
        LocationDetailView(viewModel:LocationDetailViewModel(location: location))
    }
}
