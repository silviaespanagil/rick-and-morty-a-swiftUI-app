//
//  LocationListView.swift
//  RickMorty
//
//  Created by Silvia España on 5/11/21.
//

import SwiftUI

struct LocationListView: View {
    
    @StateObject var viewModel: LocationListViewModel
    
    @Environment(\.colorScheme) var currentMode
    
    var body: some View {
        
        VStack {
            
            List {
                
                Section(header:ListHeaderView()) {
                    
                    if viewModel.showProgressView {
                        
                        ProgressViewView()
                    }
                    
                    ForEach(viewModel.locations) { location in
                        
                        NavigationLink(destination: LocationDetailView(viewModel: LocationDetailViewModel(location: location))) {
                            
                            OtherCellView(name: location.name,
                                          infoA: location.type,
                                          infoBName: "Dimension",
                                          infoB: location.dimension)
                        }
                        .onAppear {
                            
                            if location == viewModel.locations.last {
                                
                                viewModel.getLocation(page: viewModel.currentPage)
                            }
                        }
                    }
                }
                .onAppear {
                    
                    if viewModel.locations.isEmpty {
                        
                        viewModel.getLocation(page: 1)
                    }
                }
            }
        }
    }
}

struct LocationListView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        LocationListView(viewModel: LocationListViewModel())
    }
}
