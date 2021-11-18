//
//  LocationCellView.swift
//  RickMorty
//
//  Created by Silvia España on 5/11/21.
//

import SwiftUI

struct LocationView: View {
    
    @StateObject var viewModel: LocationViewModel
    
    @Environment(\.colorScheme) var currentMode
    
    var body: some View {
    
        VStack{
            
            List {
                
                Section(header:ListHeaderView()) {
                    
                    if viewModel.showProgressView {
                        
                        ProgressViewView()
                    }
                    
                    ForEach(viewModel.locations) { location in
                        
                        NavigationLink(destination: LocationDetailView(viewModel: LocationDetailViewModel(location: location))) {
                            
                            VStack(alignment: .leading, spacing:10) {
                                
                                Spacer()
                                
                                Text(location.name)
                                    .foregroundColor(currentMode == .dark ? Color("LightBlue") : Color("NoBlack"))
                                
                                VStack(alignment: .leading) {
                                    
                                    Text(location.type)
                                    
                                    if location.dimension == viewModel.unknownInfo {
                                        
                                        Text("\(viewModel.dimension)\(viewModel.unknownString)")
                                        
                                    } else {
                                        
                                        Text("\(viewModel.dimension)\(location.dimension)")
                                    }
                                }
                                .font(.footnote).foregroundColor(currentMode == .dark ? Color("Silver") : Color("DeepBlue"))
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
                .onAppear {
                   
                    if viewModel.locations.count < 1 {
                        
                        viewModel.getLocation(page: 1)
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
