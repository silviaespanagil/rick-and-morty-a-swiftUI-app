//
//  LocationDetailView.swift
//  RickMorty
//
//  Created by Silvia España on 12/11/21.
//

import SwiftUI

struct LocationDetailView: View {
    
    @StateObject var viewModel: LocationDetailViewModel
    
    @Environment(\.colorScheme) var currentMode
    
    var body: some View {
        
        VStack {
            
            Text(viewModel.location.name)
                .font(.title)
                .foregroundColor(currentMode == .dark ? Color("Silver") : Color("NoBlack"))
            
            Divider().frame(maxWidth: 240)
            
            Spacer(minLength: 10)
            
            VStack(spacing: 20) {
                
                OtherDetailItemView(titleIcon: viewModel.typeIcon,
                                    title: viewModel.type,
                                    value: viewModel.location.type)
                    .frame(maxWidth:.infinity)
                
                OtherDetailItemView(titleIcon: viewModel.dimensionIcon,
                                    title: viewModel.dimension,
                                    value: viewModel.location.dimension)
                    .frame(maxWidth:.infinity)
            }
            .padding()
            
            List {
                
                Section(header: Text(viewModel.residents)) {
                    
                    if viewModel.showProgressView {
                        
                        ProgressViewView()
                    }
                    
                    if viewModel.noResidents {
                        
                        VStack(spacing: 5) {
                            
                            Image(systemName: "exclamationmark.triangle")
                            Text("“Wubba lubba dub dub!”")
                                .font(.footnote)
                            Text("There are no residents in this \(viewModel.location.type)")
                                .font(.footnote)
                        } .foregroundColor(currentMode == .dark ? Color("DeepBlue") : Color("LightBlue"))
                        
                    } else {
                        
                        ForEach(viewModel.characters, id: \.self) { character in
                            
                            NavigationLink(destination: CharacterDetailView(viewModel: CharacterDetailViewModel(character: character))) {
                                
                                OtherCharacterCellView(image: character.image,
                                                       name: character.name,
                                                       titleA: viewModel.bornIn,
                                                       subtitleA: character.origin,
                                                       titleB: viewModel.lastSeen,
                                                       subtitleB: character.location)
                                    .frame(maxWidth:.infinity)
                                    .padding(5)
                            }
                        }
                    }
                }
            }.frame(maxWidth:.infinity)
                .listStyle(.grouped)
            
        }.onAppear {
            
            viewModel.getLocationDetail()
        }
    }
}

struct LocationDetailView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        let location = Location(id: 1,
                                name: "Earth",
                                type: "Planet",
                                residents: ["1","2"],
                                dimension: "Dimension")
        
        LocationDetailView(viewModel:LocationDetailViewModel(location: location))
    }
}
