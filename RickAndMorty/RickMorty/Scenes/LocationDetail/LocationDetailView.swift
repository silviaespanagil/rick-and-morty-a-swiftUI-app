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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        Button(action: {
            viewModel.getResidents()
                }){
                    Text(":D")
                }
    }
}

struct LocationDetailView_Previews: PreviewProvider {
    static var previews: some View {
        LocationDetailView(viewModel:LocationDetailViewModel())
    }
}
