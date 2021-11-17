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
        
        if viewModel.showProgressView {
            
            ProgressViewView()
        }
        
        VStack{
            
            List {
                
                Section(header:ListHeaderView()) {
                    
                    ForEach(viewModel.locations) { location in
                        
                        NavigationLink(destination: LocationDetailView(viewModel: LocationDetailViewModel(location: location))) {
                            
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
                        .onAppear {
                            if location == viewModel.locations.last {
                                viewModel.getLocation(page: viewModel.currentPage)
                            }
                        }
                    }
                }
            }
        }
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView(viewModel: LocationViewModel(page: 1))
    }
}
