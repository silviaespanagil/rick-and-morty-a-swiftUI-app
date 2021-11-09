//
//  LocationCellView.swift
//  RickMorty
//
//  Created by Silvia España on 5/11/21.
//

import SwiftUI

struct LocationCellView: View {
    
    @StateObject var viewModel: LocationViewModel
    
    var body: some View {
        
        NavigationView{
            
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

struct LocationCellView_Previews: PreviewProvider {
    static var previews: some View {
        LocationCellView(viewModel: LocationViewModel())
    }
}
