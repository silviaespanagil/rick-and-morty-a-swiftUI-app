//
//  LocationCellView.swift
//  RickMorty
//
//  Created by Silvia España on 5/11/21.
//

import SwiftUI

struct LocationView: View {
    
    @StateObject var viewModel: LocationViewModel
    
    var body: some View {
        
        VStack{
            
            List {
                
                ForEach(viewModel.locations) { location in
                    
                    VStack(alignment: .leading, spacing:10) {
                        
                        Spacer()
                        Text(location.name)
                        
                        VStack(alignment: .leading) {
                            
                            Text(location.type)
                            Text("\(viewModel.dimension)\(location.dimension)")
                            
                        }
                        .font(.footnote)
                        Spacer()
                    }
                }
            }
        }
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView(viewModel: LocationViewModel())
    }
}
